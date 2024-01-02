import 'package:equatable/equatable.dart';

class Products extends Equatable {
 final dynamic id;
   final dynamic price;
 final dynamic oldPrice;
  final int? discount;
  final String? image;
  final String? name;
  final String? description;
  final bool? inFavorites;
  final bool? inCart;

 const Products(
      {required this.id,
      required this.price,
      required this.oldPrice,
      required this.discount,
      required this.image,
      required this.name,
      required this.description,
      required this.inFavorites,
      required this.inCart});

  @override
  List<Object?> get props =>
      [id, price, oldPrice, discount, image, name, description,inFavorites,inCart];
}
