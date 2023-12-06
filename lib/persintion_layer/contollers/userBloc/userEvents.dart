abstract class UserEvents {}

class LogInUserEvent extends UserEvents {
  final String email;
  final String password;

  LogInUserEvent({required this.email, required this.password});
}

class RegisterEvent extends UserEvents {
  final String email;
  final String name;
  final String password;
  final String phone;
  String? image;

  RegisterEvent( {required this.email,required this.name,required this.password,required this.phone,this.image,});
}

class ProFileUserEvent extends UserEvents {}

class UpdateProFileUserEvent extends UserEvents {}

class LogoutUserEvent extends UserEvents {}
