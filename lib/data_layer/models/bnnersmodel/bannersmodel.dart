import 'package:e_commerce/domain_layer/entites/banners/banners.dart';

class BannersModel extends Banners {
  BannersModel(
      {required super.status, required super.message, required super.data});

  factory BannersModel.formMap(Map<String, dynamic> json) {
    return BannersModel(
        status: json['status'],
        message: json['message'],
        data: List.from(json['data']).map((e) => BannersDataModel.formMap(e)).toList());
  }
}

class BannersDataModel extends BannersData {
  BannersDataModel(
      {required super.id,
      required super.image,
      required super.category,
      required super.product});

  factory BannersDataModel.formMap(Map<String, dynamic> json) {
    return BannersDataModel(
        id: json['id'],
        image: json['image'],
        category: json['category'],
        product: json['product']);
  }
}
