import 'package:dio/dio.dart';
import 'package:e_commerce/core/const/appconst.dart';
import 'package:e_commerce/core/error/serviceseexception.dart';

import '../../models/categoriesmodel/categoriesmodel.dart';

abstract class BaseCategoriesRemoteServices {
  Future<CategoriesModel> getCategories();
}

class CategoriesRemoteServices extends BaseCategoriesRemoteServices {
  @override
  Future<CategoriesModel> getCategories() async {
    var response = await Dio().get(
      AppConst.getCategories,
    );

    if (response.statusCode == 200) {
      var getData = CategoriesModel.formMap(response.data);


      return getData;
    } else {

      throw ServerException(errorMessageModel: response.data);
    }
  }
}
