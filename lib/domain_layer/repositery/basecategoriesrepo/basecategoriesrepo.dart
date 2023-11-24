import '../../entites/categories/categories.dart';

abstract class BaseCategoriesRepo {
  Future<Categories> getCategories();
}
