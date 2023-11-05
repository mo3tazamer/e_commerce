import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String status;
  final String message;



   const ErrorMessageModel( {required this.status, required this.message,});

  factory ErrorMessageModel.formMap(Map<String, dynamic> json) {
    return ErrorMessageModel( message: json['message'],status:json['status'] );
  }

  @override
  List<Object?> get props => [status, message];
}
