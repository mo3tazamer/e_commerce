import 'package:e_commerce/domain_layer/entites/banners/banners.dart';
import 'package:e_commerce/domain_layer/repositery/base_getbanner_srepo.dart';
import '../remote_services/getbanners_remote_services/getbanners_remote_services.dart';


class GetBannersRepo extends BaseGetBannersRepo {
  BaseGetBannersRemoteServices baseGetBannersRemoteServices;

  GetBannersRepo(this.baseGetBannersRemoteServices);

  @override
  Future<Banners> getBannersRepo() async {
    return await baseGetBannersRemoteServices.getBanners();
  }
}
