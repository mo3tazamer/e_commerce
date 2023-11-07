import '../../../domain_layer/entites/products.dart';

class ProductsModel extends Products {
  ProductsModel(
      {required super.id,
      required super.price,
      required super.oldPrice,
      required super.discount,
      required super.image,
      required super.name,
      required super.description});

  factory ProductsModel.formMap(Map<String, dynamic> json) {


    return ProductsModel(
        id: json['id'],
        price: json['price'],
        oldPrice: json['old_price'],
        discount: json['discount'],
        image: json['image'],
        name: json['name'],
        description: json['description']);
  }
}
