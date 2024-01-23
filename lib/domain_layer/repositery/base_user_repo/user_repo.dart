import 'package:e_commerce/data_layer/models/logoutmodel/logoutmodel.dart';

import '../../entites/user/user.dart';

abstract class BaseUserRepo {
  Future<User> postRegister(
      {required String name,
      required String phone,
      required String email,
      required String password,
       String? image});
  Future<User> postLogIn({required String email, required String password});
  Future<User> getProfile(String token);
  Future<User> putUpdateProfile(
      {required String name,
      required String phone,
      required String email,
      required String password,
       String? image});
  Future<LogOutModel> postLogOut(String token);
}
