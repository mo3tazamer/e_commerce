part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}


class MainPage extends HomeEvent{}

class InFav extends HomeEvent {
  int? favId;

  InFav({required this.favId});
}
class GetFavorites extends HomeEvent{}





