import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rent_a_car/features/auth/domain/usecases/current_user.dart';
import 'package:rent_a_car/features/auth/domain/usecases/signup_usecase.dart';

import '../../../../core/commons/app_user/app_user_cubit.dart';
import '../../../../core/entities/no_params.dart';
import '../../../../core/entities/user.dart';
import '../../domain/usecases/signin_usecase.dart';
import '../../domain/usecases/user_logout.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AppUserCubit _appUserCubit;

  final CurrentUser _currentUser;
  final SignUpUseCase _signUpUseCase;
  final SignInUseCase _signInUseCase;
  final UserLogout _userLogout;

  AuthBloc(
      {required AppUserCubit appUserCubit,
      required CurrentUser currentUser,
      required SignUpUseCase signUpUseCase,
      required SignInUseCase signInUseCase,
      required UserLogout userLogout})
      : _signUpUseCase = signUpUseCase,
        _signInUseCase = signInUseCase,
        _appUserCubit = appUserCubit,
        _currentUser = currentUser,
        _userLogout = userLogout,
        super(AuthInitial()) {
    on<AuthSignUp>(_onAuthSignUp);
    on<AuthSignIn>(_onAuthSignIn);
    on<AuthCurrentUserData>(_onAuthCurrentUserData);
    on<AuthUserLogout>(_onAuthUserLogout);
  }

  void _onAuthSignUp(event, emit) async {
    emit(AuthLoading());
    final res = await _signUpUseCase(UserSignUpParams(
        name: event.name, email: event.email, password: event.password));

    res.fold((failure) => emit(AuthFailure(failure.message)), (user) {
      _emitAuthState(user, emit);
      print(user.email);
    });
  }

  void _onAuthSignIn(event, emit) async {
    emit(AuthLoading());
    final res = await _signInUseCase(
        UserSignInParams(email: event.email, password: event.password));

    res.fold((failure) => emit(AuthFailure(failure.message)), (user) {
      _emitAuthState(user, emit);
      print(user.email);
    });
  }

  void _onAuthCurrentUserData(
      AuthCurrentUserData event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await _currentUser(NoParams());
    response.fold((failure) => emit(AuthFailure(failure.message)), (user) {
      _emitAuthState(user, emit);
      print(user.email);
    });
  }

  void _onAuthUserLogout(AuthUserLogout event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    final response = await _userLogout(NoParams());
    response.fold((failure) => emit(AuthFailure(failure.message)),
        (r) => emit(AuthSignOut(r)));
  }

  void _emitAuthState(User user, Emitter<AuthState> emit) async {
    _appUserCubit.updateUser(user);
    emit(AuthSuccess(user));
  }
}
