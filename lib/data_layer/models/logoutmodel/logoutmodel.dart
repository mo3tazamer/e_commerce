import 'package:equatable/equatable.dart';

class LogOutModel extends Equatable {
  String status;
  String message;

  LogOutModel({required this.status, required this.message});

  factory LogOutModel.formMap(Map<String, dynamic> json) {
    return LogOutModel(status: json['status'], message: json['message']);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status,message];
}
