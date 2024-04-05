import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/no_params.dart';
import '../../domain/models/car_item.dart';
import '../../domain/use_cases/home_use_case.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeUseCase _useCase;

  HomeBloc({required HomeUseCase useCase})
      : _useCase = useCase,
        super(HomeInitial()) {
    on<HomeEvent>((event, emit) => emit(LoadingState()));
    on<LoadAllCarsEvent>(loadAllCars);
  }

  void loadAllCars(LoadAllCarsEvent event, Emitter<HomeState> emitter) async {
    emit(LoadingState());
    Future.delayed(const Duration(seconds: 9));
    final result = await _useCase(NoParams());
    result.fold((error) => emit(FailureState(error.message)),
        (result) => emit(SuccessState(result)));
  }
}
