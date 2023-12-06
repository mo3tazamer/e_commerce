import 'package:dio/dio.dart';
import 'package:e_commerce/core/const/appconst.dart';
import 'package:e_commerce/core/error/serviceseexception.dart';

import '../../../core/cachehelper/cachehelper.dart';
import '../../models/productsmodel/productsmodel.dart';

abstract class BaseFavoritesRemoteServices {
  Future<List<ProductsModel>> getFavorites();
  Future<String> addOrDeleteFavorites({required int productId});
  Future deleteFavorites();
}

class FavoritesRemoteServices extends BaseFavoritesRemoteServices {
  @override
  Future<String> addOrDeleteFavorites({required int productId}) async {
    var response = await Dio(BaseOptions(
            headers: {'Authorization': CacheHelper.getData(key: 'token')}))
        .post(AppConst.addOrDeleteFavorites, data: {"product_id": productId});

    if (response.statusCode == 200) {
      var getaData = response.data['message'];
      return getaData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future deleteFavorites() {

    throw UnimplementedError();
  }

  @override
  Future<List<ProductsModel>> getFavorites() async {
    var response = await Dio(BaseOptions(
            headers: {'Authorization': CacheHelper.getData(key: 'token')}))
        .get(AppConst.getFavorites);

    if (response.statusCode == 200) {
      var getData = List.from(response.data['data']['data'])
          .map((e) => ProductsModel.formMap(e['product']))
          .toList();
      return getData;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}
