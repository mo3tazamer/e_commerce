import 'package:e_commerce/data_layer/models/logoutmodel/logoutmodel.dart';
import 'package:e_commerce/domain_layer/repositery/user_repo/user_repo.dart';

import '../../entites/user/user.dart';

class LogOutUseCase {
  BaseUserRepo baseUserRepo;

  LogOutUseCase(this.baseUserRepo);

  Future<LogOutModel> excute(var token) async {
    return await baseUserRepo.postLogOut(token);
  }
}
