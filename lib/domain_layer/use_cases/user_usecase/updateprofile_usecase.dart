import '../../entites/user/user.dart';
import '../../repositery/user_repo/user_repo.dart';

class UpDateProfileUseCase{


  BaseUserRepo baseUserRepo;

  UpDateProfileUseCase(this.baseUserRepo);

  Future<User> excute({required String name,
    required String phone,
    required String email,
    required String password,
    required String image} ) async{
    return await baseUserRepo.putUpdateProfile(phone: phone,password: password,name: name,image: image,email: email);

  }

}