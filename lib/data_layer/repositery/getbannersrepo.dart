import 'package:e_commerce/domain_layer/entites/banners/banners.dart';
import 'package:e_commerce/domain_layer/repositery/basegetbannersrepo.dart';
import '../remote_services/getbanners_remoteservices/getbanners_remoteservices.dart';

class GetBannersRepo extends BaseGetBannersRepo {
  BaseGetBannersRemoteServices baseGetBannersRemoteServices;

  GetBannersRepo(this.baseGetBannersRemoteServices);

  @override
  Future<Banners> getBannersRepo() async {
    return await baseGetBannersRemoteServices.getBanners();
  }
}
