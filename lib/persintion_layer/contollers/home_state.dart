part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {}

class HomeError extends HomeState {
 final String error;

  HomeError({required this.error});
}

class IsFavSuccess extends HomeState {
  final String message;

  IsFavSuccess(this.message);
}

class IsFavError extends HomeState {
 final String error;

  IsFavError({required this.error});
}
class GetFavoritesLoading extends HomeState {}
class GetFavoritesSuccess extends HomeState {}

class GetFavoritesError extends HomeState {
 final String error;

  GetFavoritesError({required this.error});
}
