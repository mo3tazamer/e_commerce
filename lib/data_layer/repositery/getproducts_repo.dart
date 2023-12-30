


import '../../domain_layer/entites/products/products.dart';
import '../../domain_layer/repositery/base_porducts_repo.dart';
import '../remote_services/getproducts_remote_services/getproducts_remote_services.dart';

class GetProductsRepo extends BaseGetProductsRepo {
  BaseGetProductsRemote baseGetProductsRemote;

  GetProductsRepo(this.baseGetProductsRemote);

  @override
  Future<List<Products>> getProduct() async {
    return await baseGetProductsRemote.getProduct();
  }

  @override
  Future<List<Products>> searchProducts({required String product}) async {
    return await baseGetProductsRemote.searchProducts(product: product);
  }
}
