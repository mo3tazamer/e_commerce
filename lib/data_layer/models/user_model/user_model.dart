import 'dart:convert';

import 'package:e_commerce/domain_layer/entites/user/user.dart';

class UserModel extends User {
  UserModel(
      {required super.status, required super.message, required super.data});

  factory UserModel.fromMap(Map<String, dynamic> json) {
    return UserModel(
      data: json['data'] != null ? DataModel.formMap(json['data']) : null,
      message: json['message'],
      status: json['status'],
    );
  }
}

class DataModel extends Data {
  const DataModel(
      {required super.name,
      required super.phone,
      required super.email,
      required super.id,
      required super.image,
      required super.token});

  factory DataModel.formMap(Map<String, dynamic> json) {
    return DataModel(
        name: json['name'],
        phone: json['phone'],
        email: json['email'],
        id: json['id'],
        image: json['image'],
        token: json['token']);
  }
}
