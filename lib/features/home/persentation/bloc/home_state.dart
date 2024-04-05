part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingState extends HomeState {}

final class SuccessState extends HomeState {
  final List<CarItem> carsList;
  SuccessState(this.carsList);
}

final class FailureState extends HomeState {
  final String message;
  FailureState(this.message);
}
