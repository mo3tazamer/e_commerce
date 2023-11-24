import 'package:e_commerce/domain_layer/entites/categories/categories.dart';

import '../../repositery/basecategoriesrepo/basecategoriesrepo.dart';

class CategoriesUseCase {
  BaseCategoriesRepo baseCategoriesRepo;

  CategoriesUseCase(this.baseCategoriesRepo);

  Future<Categories> excute() async {
    return await baseCategoriesRepo.getCategories();
  }
}
