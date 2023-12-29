import 'package:equatable/equatable.dart';

class Products extends Equatable {
  dynamic? id;
  dynamic? price;
  dynamic? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;
  bool? inFavorites;
  bool? inCart;

  Products(
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
