import 'package:equatable/equatable.dart';

class LogOutModel extends Equatable {
 final String status;
 final String message;

 const LogOutModel({required this.status, required this.message});

  factory LogOutModel.formMap(Map<String, dynamic> json) {
    return LogOutModel(status: json['status'], message: json['message']);
  }

  @override
  List<Object?> get props => [status, message];
}
