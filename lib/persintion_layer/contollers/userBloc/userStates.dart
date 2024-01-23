import '../../../domain_layer/entites/user/user.dart';

abstract class UserStates {}

class LogInUserIntState extends UserStates {}

class LogInUserLoading extends UserStates {}

class LogInUserSuccess extends UserStates {
 final User user;

  LogInUserSuccess({required this.user});
}

class LogInUserError extends UserStates {
  final String error;

  LogInUserError(this.error);
}

class ProfileUserLoading extends UserStates {}

class ProfileUserSuccess extends UserStates {
 final User user;

  ProfileUserSuccess({required this.user});
}

class ProfileUserError extends UserStates {
  final String error;

  ProfileUserError(this.error);
}

class LogoutUserSuccess extends UserStates {
  final String message;

  LogoutUserSuccess(this.message);
}

class LogoutUserError extends UserStates {
  final String error;
  LogoutUserError(this.error);
}

class RegisterUserLoading extends UserStates {}

class RegisterUserSuccess extends UserStates {
  final String message;
  RegisterUserSuccess(this.message);
}

class RegisterUserError extends UserStates {
  final String error;
  RegisterUserError(this.error);
}
