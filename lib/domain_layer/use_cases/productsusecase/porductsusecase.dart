import '../../entites/products/products.dart';
import '../../repositery/base_porducts_repo.dart';

class GetProductsUseCase {
  BaseGetProductsRepo baseProductsRepo;

  GetProductsUseCase(this.baseProductsRepo);

  Future<List<Products>> excute() async {
    return await baseProductsRepo.getProduct();
  }
}
