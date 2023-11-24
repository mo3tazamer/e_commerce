import 'package:equatable/equatable.dart';

class Categories extends Equatable {
  bool status;
  String? message;
  List<CategoriesData> data;

  Categories({required this.status, required this.message, required this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [status, message, data];
}

class CategoriesData extends Equatable {
  int id;
  String name;
  String image;

  CategoriesData({required this.id, required this.name, required this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, image];
}
