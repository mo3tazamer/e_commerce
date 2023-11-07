import 'package:dio/dio.dart';
import 'package:e_commerce/core/const/appconst.dart';
import 'package:e_commerce/core/error/serviceseexception.dart';

import '../models/productsmodel/productsmodel.dart';

abstract class BaseGetProductsRemote {
  Future<List<ProductsModel>> getProduct();
}

class GetProductsRemote extends BaseGetProductsRemote {
  @override
  Future<List<ProductsModel>> getProduct() async {
    /// todo add Authorization form shared pref
    var response = await Dio(BaseOptions(headers: {
      'Authorization':
          'aCLPA5KnkeGH7IFXTpir9wiLLmDCbXQQwFeDlkHBCym00CDgAqqnxNpwQNJO2uvcsK1H3O'
    })).get(AppConst.getProducts);

    if (response.statusCode == 200) {
      var getProduct = List.from(response.data['data']['products'])
          .map((e) => ProductsModel.formMap(e))
          .toList();

      return getProduct;
    } else {
      throw ServerException(errorMessageModel: response.data);
    }
  }
}
