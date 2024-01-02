import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  final bool? status;
 final String? message;
  final List<BannersData> data;

 const Banners({required this.status, required this.message, required this.data});

  @override

  List<Object?> get props => [status, message, data];
}

class BannersData extends Equatable {
 final int id;
 final String image;
 final String? category;
 final String? product;

  @override

  List<Object?> get props => [id, image, category, product];

const  BannersData(
      {required this.id,
      required this.image,
      required this.category,
      required this.product});
}
