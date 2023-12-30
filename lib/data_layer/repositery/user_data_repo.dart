import 'package:e_commerce/data_layer/models/logoutmodel/logoutmodel.dart';
import 'package:e_commerce/domain_layer/entites/user/user.dart';

import '../../domain_layer/repositery/base_user_repo/user_repo.dart';
import '../remote_services/user_remote_services/user_remote.dart';

class UserDataRepo extends BaseUserRepo {
  BaseUserRemote baseUserRemote;

  UserDataRepo(this.baseUserRemote);

  @override
  Future<User> getProfile(String token) async {
    return await baseUserRemote.getProfile(token);
  }

  @override
  Future<User> postLogIn(
      {required String email, required String password}) async {
    return await baseUserRemote.postLogIn(email: email, password: password);
  }

  @override
  Future<LogOutModel> postLogOut(var token) async {
    return await baseUserRemote.postLogOut(token);
  }

  @override
  Future<User> postRegister(
      {required String name,
      required String phone,
      required String email,
      required String password,
      String? image}) async {
    return await baseUserRemote.postRegister(
        name: name,
        phone: phone,
        email: email,
        password: password,
        image: image);
  }

  @override
  Future<User> putUpdateProfile(
      {required String name,
      required String phone,
      required String email,
      required String password,
      String? image}) async {
    return await baseUserRemote.putUpdateProfile(
        name: name,
        phone: phone,
        email: email,
        password: password,
        image: image);
  }
}
