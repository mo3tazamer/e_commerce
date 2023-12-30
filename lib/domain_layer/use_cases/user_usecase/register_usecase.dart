import '../../entites/user/user.dart';
import '../../repositery/base_user_repo/user_repo.dart';


class RegisterUseCase {
  BaseUserRepo baseUserRepo;

  RegisterUseCase(this.baseUserRepo);

  Future<User> excute(
      {required String name,
      required String phone,
      required String email,
      required String password,
      String? image}) async {
    return await baseUserRepo.postRegister(
        email: email,
        image: image,
        name: name,
        password: password,
        phone: phone);
  }
}
