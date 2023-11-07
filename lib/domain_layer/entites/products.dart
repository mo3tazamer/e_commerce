import 'package:equatable/equatable.dart';

class Products extends Equatable{
  int id;
  dynamic price;
  dynamic oldPrice;
  int discount;
  String image;
  String name;
  String description;

  Products(
      { required this.id,
     required this.price,
     required this.oldPrice,
     required this.discount,
     required this.image,
    required this.name,
     required this.description});

  @override

  List<Object?> get props => [id,price,oldPrice,discount,image,name,description];

}