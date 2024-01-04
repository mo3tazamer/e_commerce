import 'package:equatable/equatable.dart';

class User extends Equatable {
  final bool status;
  final String? message;
  final Data? data;

 const User({required this.status, required this.message, required this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class Data extends Equatable {
  final String name;
  final String phone;
  final String email;
  final int id;
  final String? image;
  final String token;

  const Data(
      {required this.name,
      required this.phone,
      required this.email,
      required this.id,
       this.image,
      required this.token});

  @override
  List<Object?> get props => [name, phone, email, id, image, token];
}
