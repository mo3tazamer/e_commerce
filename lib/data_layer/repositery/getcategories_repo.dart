
import 'package:e_commerce/domain_layer/entites/categories/categories.dart';
import 'package:e_commerce/domain_layer/repositery/basecategoriesrepo/base_categories_repo.dart';

import '../remote_services/getcategories_remote_services/categoriesremoteservices.dart';

class CategoriesRipo extends BaseCategoriesRepo {
  BaseCategoriesRemoteServices baseCategoriesRemoteServices;

  CategoriesRipo(this.baseCategoriesRemoteServices);

  @override
  Future<Categories> getCategories() async {
    return await baseCategoriesRemoteServices.getCategories();
  }
}
