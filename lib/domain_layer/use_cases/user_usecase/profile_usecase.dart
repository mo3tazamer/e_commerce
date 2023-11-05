import '../../entites/user/user.dart';
import '../../repositery/user_repo/user_repo.dart';

class ProFileUseCase{


  BaseUserRepo baseUserRepo;

  ProFileUseCase(this.baseUserRepo);

  Future<User> excute( String token) async{
    return await baseUserRepo.getProfile(token);

  }

}