import 'package:e_commerce/domain_layer/entites/banners/banners.dart';
import 'package:e_commerce/domain_layer/repositery/base_getbanner_srepo.dart';

class GetBannersUseCase {
  BaseGetBannersRepo baseGetBannersRepo;

  GetBannersUseCase({required this.baseGetBannersRepo});

  Future<Banners> excute() async {
    return await baseGetBannersRepo.getBannersRepo();
  }
}
