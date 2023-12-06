import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  bool? status;
  String? message;
  List<BannersData> data;

  Banners({required this.status, required this.message, required this.data});

  @override

  List<Object?> get props => [status, message, data];
}

class BannersData extends Equatable {
  int id;
  String image;
  String? category;
  String? product;

  @override

  List<Object?> get props => [id, image, category, product];

  BannersData(
      {required this.id,
      required this.image,
      required this.category,
      required this.product});
}
