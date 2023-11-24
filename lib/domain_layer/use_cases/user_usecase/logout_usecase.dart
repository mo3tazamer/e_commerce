import 'package:e_commerce/data_layer/models/logoutmodel/logoutmodel.dart';

import '../../entites/user/user.dart';
import '../../repositery/baseuserrepo/user_repo.dart';

class LogOutUseCase {
  BaseUserRepo baseUserRepo;

  LogOutUseCase(this.baseUserRepo);

  Future<LogOutModel> excute(var token) async {
    return await baseUserRepo.postLogOut(token);
  }
}
