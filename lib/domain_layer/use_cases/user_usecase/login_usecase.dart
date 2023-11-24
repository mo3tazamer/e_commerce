import '../../entites/user/user.dart';
import '../../repositery/baseuserrepo/user_repo.dart';

class LogInUseCase {
  BaseUserRepo baseUserRepo;

  LogInUseCase(this.baseUserRepo);

  Future<User> excute({required String email, required String password}) async {
    return await baseUserRepo.postLogIn(password: password, email: email);
  }
}
