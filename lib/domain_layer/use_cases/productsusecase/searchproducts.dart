import 'package:e_commerce/domain_layer/entites/products/products.dart';
import 'package:e_commerce/domain_layer/repositery/base_porducts_repo.dart';

class SearchProductsUseCase {
  BaseGetProductsRepo baseGetProductsRepo;

  SearchProductsUseCase(this.baseGetProductsRepo);

  Future<List<Products>> excute({required String product}) async {
    return await baseGetProductsRepo.searchProducts(product: product);
  }
}
