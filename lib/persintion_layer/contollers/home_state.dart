part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {
  String error;

  HomeError({required this.error});
}

class IsFavSuccess extends HomeState {
  String message;

  IsFavSuccess(this.message);
}

class IsFavError extends HomeState {
  String error;

  IsFavError({required this.error});
}

class GetFavoritesSuccess extends HomeState {}

class GetFavoritesError extends HomeState {
  String error;

  GetFavoritesError({required this.error});
}
