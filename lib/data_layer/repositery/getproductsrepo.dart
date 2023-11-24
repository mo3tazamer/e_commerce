import 'package:e_commerce/data_layer/models/productsmodel/productsmodel.dart';
import 'package:e_commerce/data_layer/remote_services/getproducts_remoteservices/getproducts_remoteservices.dart';

import '../../domain_layer/entites/products/products.dart';
import '../../domain_layer/repositery/baseporductsrepo.dart';

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
