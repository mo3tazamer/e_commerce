import '../../../domain_layer/entites/categories/categories.dart';

class CategoriesModel extends Categories {
  CategoriesModel(
      {required super.status, required super.message, required super.data});

  factory CategoriesModel.formMap(Map<String, dynamic> json) {
    return CategoriesModel(
        status: json['status'],
        message: json['message'],
        data: List.from(json['data']['data'])
            .map((e) => CategoriesDataModel.formMap(e))
            .toList());
  }
}

class CategoriesDataModel extends CategoriesData {
  CategoriesDataModel(
      {required super.id, required super.name, required super.image});

  factory CategoriesDataModel.formMap(Map<String, dynamic> json) {
    return CategoriesDataModel(
        id: json['id'], name: json['name'], image: json['image']);
  }
}
