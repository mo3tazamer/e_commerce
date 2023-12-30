import 'package:dio/dio.dart';
import 'package:e_commerce/core/cachehelper/cachehelper.dart';
import 'package:e_commerce/core/const/appconst.dart';
import 'package:e_commerce/core/error/serviceseexception.dart';

import '../../../domain_layer/entites/products/products.dart';
import '../../models/productsmodel/productsmodel.dart';

abstract class BaseGetProductsRemote {
  Future<List<ProductsModel>> getProduct();
  Future<List<ProductsModel>> searchProducts({required String product});
}

class GetProductsRemote extends BaseGetProductsRemote {
  @override
  Future<List<ProductsModel>> getProduct() async {
    var response = await Dio(BaseOptions(
            headers: {'Authorization': CacheHelper.getData(key: 'token')}))
        .get(AppConst.getProducts);

    if (response.statusCode == 200) {
      var getProduct = List.from(response.data['data']['products'])
          .map((e) => ProductsModel.formMap(e))
          .toList();

      return getProduct;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }

  @override
  Future<List<ProductsModel>> searchProducts({required String product}) async {
    var response = await Dio(BaseOptions(
            headers: {'Authorization': CacheHelper.getData(key: 'token')}))
        .post(AppConst.searchProducts, data: {'text': product});

    if (response.statusCode == 200) {
      var searchProduct = List.from(response.data['data']['data'])
          .map((e) => ProductsModel.formMap(e))
          .toList();

      return searchProduct;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}
