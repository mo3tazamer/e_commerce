

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
