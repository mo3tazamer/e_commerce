import 'package:e_commerce/data_layer/remote_services/getcategoriesremoteservices/categoriesremoteservices.dart';
import 'package:e_commerce/domain_layer/entites/categories/categories.dart';
import 'package:e_commerce/domain_layer/repositery/basecategoriesrepo/basecategoriesrepo.dart';

class CategoriesRipo extends BaseCategoriesRepo {
  BaseCategoriesRemoteServices baseCategoriesRemoteServices;

  CategoriesRipo(this.baseCategoriesRemoteServices);

  @override
  Future<Categories> getCategories() async {
    return await baseCategoriesRemoteServices.getCategories();
  }
}
