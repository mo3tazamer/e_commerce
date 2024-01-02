import 'package:equatable/equatable.dart';

class Categories extends Equatable {
 final bool status;
  final String? message;
 final List<CategoriesData> data;

 const Categories({required this.status, required this.message, required this.data});

  @override

  List<Object?> get props => [status, message, data];
}

class CategoriesData extends Equatable {
final  int id;
 final String name;
 final String image;

 const CategoriesData({required this.id, required this.name, required this.image});

  @override

  List<Object?> get props => [id, name, image];
}
