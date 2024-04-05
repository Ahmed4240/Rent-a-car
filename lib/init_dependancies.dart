import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:rent_a_car/core/commons/app_user/app_user_cubit.dart';
import 'package:rent_a_car/core/network/connection_checker.dart';
import 'package:rent_a_car/core/secrets/app_secrets.dart';
import 'package:rent_a_car/features/auth/domain/usecases/current_user.dart';
import 'package:rent_a_car/features/auth/domain/usecases/signin_usecase.dart';
import 'package:rent_a_car/features/auth/domain/usecases/signup_usecase.dart';
import 'package:rent_a_car/features/auth/domain/usecases/user_logout.dart';
import 'package:rent_a_car/features/home/data/data_sources/home_data_source.dart';
import 'package:rent_a_car/features/home/domain/repositories/home_repository.dart';
import 'package:rent_a_car/features/home/domain/use_cases/home_use_case.dart';
import 'package:rent_a_car/features/home/persentation/bloc/home_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'features/auth/data/data_sources/auth_remote_data_source.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/repositories/auth_repository_impl.dart';
import 'features/auth/persentation/bloc/auth_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _initAuth();
  _initHome();
  final supabase = await Supabase.initialize(
      url: AppSecrets.SUPABASE_URL, anonKey: AppSecrets.SUPABASE_ANON_KEY);

  serviceLocator.registerLazySingleton(() => supabase.client);
  serviceLocator.registerLazySingleton(() => AppUserCubit());
  serviceLocator.registerLazySingleton(() => InternetConnection());
  serviceLocator.registerFactory<ConnectionChecker>(
      () => ConnectionCheckerImpl(serviceLocator()));
}

void _initHome() {
  serviceLocator
    ..registerFactory<HomeDataSource>(() => HomeDataSourceImp(serviceLocator()))
    ..registerFactory<HomeRepository>(() => HomeRepositoryImpl(serviceLocator()))
    ..registerFactory(() => HomeUseCase(serviceLocator()))
    ..registerLazySingleton(() => HomeBloc(useCase: serviceLocator()));
}

void _initAuth() {
  serviceLocator
    ..registerFactory<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(serviceLocator(),),)
    // Repository
    ..registerFactory<AuthRepository>(
      () => AuthRepositoryImpl(serviceLocator(), serviceLocator()),
    )
    // Usecases
    ..registerFactory(() => SignUpUseCase(serviceLocator(),),)
    ..registerFactory(() => SignInUseCase(serviceLocator(),),)
    ..registerFactory(() => CurrentUser(serviceLocator(),),)
    ..registerFactory(() => UserLogout(serviceLocator(),),)
    // Bloc
    ..registerLazySingleton(
      () => AuthBloc(
        signUpUseCase: serviceLocator(),
        signInUseCase: serviceLocator(),
        currentUser: serviceLocator(),
        appUserCubit: serviceLocator(),
        userLogout: serviceLocator(),
      ),
    );
}
