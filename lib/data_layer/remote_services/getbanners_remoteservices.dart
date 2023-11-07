import 'package:dio/dio.dart';
import 'package:e_commerce/core/const/appconst.dart';
import 'package:e_commerce/core/error/serviceseexception.dart';
import 'package:e_commerce/data_layer/models/bnnersmodel/bannersmodel.dart';

import '../../core/network/erromessagemodel.dart';

abstract class BaseGetBannersRemoteServices {
  Future<BannersModel> getBanners();
}

class GetBannersRemoteServices extends BaseGetBannersRemoteServices {
  @override
  Future<BannersModel> getBanners() async {
    var response = await Dio().get(AppConst.getBanners);
    if (response.statusCode == 200) {
      var banners = BannersModel.formMap(response.data);
      return banners;
    } else {
      throw throw ServerException(
          errorMessageModel: ErrorMessageModel.formMap(response.data));
    }
  }
}
