import 'package:e_commerce/data_layer/models/logoutmodel/logoutmodel.dart';


import '../../repositery/base_user_repo/user_repo.dart';


class LogOutUseCase {
  BaseUserRepo baseUserRepo;

  LogOutUseCase(this.baseUserRepo);

  Future<LogOutModel> excute(var token) async {
    return await baseUserRepo.postLogOut(token);
  }
}
