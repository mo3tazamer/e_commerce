

import '../../../domain_layer/entites/user/user.dart';

abstract class UserStates {}

class LogInUserIntState extends UserStates {}

class LogInUserLoading extends UserStates {}

class LogInUserSuccess extends UserStates {
  User user;

  LogInUserSuccess({required this.user});
}

class LogInUserError extends UserStates {
  final String error;

  LogInUserError(this.error);
}
class ProfileUserLoading extends UserStates {}
class ProfileUserSuccess extends UserStates {
  User user;

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