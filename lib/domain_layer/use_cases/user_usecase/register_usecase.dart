import 'package:e_commerce/domain_layer/repositery/user_repo/user_repo.dart';

import '../../entites/user/user.dart';

class RegisterUseCase {
  BaseUserRepo baseUserRepo;

  RegisterUseCase(this.baseUserRepo);

  Future<User> excute(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String image}) async {
    return await baseUserRepo.postRegister(
        email: email,
        image: image,
        name: name,
        password: password,
        phone: phone);
  }
}
