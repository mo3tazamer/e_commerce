import 'package:e_commerce/domain_layer/entites/products/products.dart';
import 'package:e_commerce/domain_layer/repositery/basefavoritesrepo.dart';

import '../remote_services/favoritesremoteservices/favoritesremoteservices.dart';

class FavoriteRepo extends BaseFavoritesRepo {
  BaseFavoritesRemoteServices baseFavoritesRemoteServices;

  FavoriteRepo(this.baseFavoritesRemoteServices);

  @override
  Future<String> addOrDeleteFavorites({required int productId}) async {
    return await baseFavoritesRemoteServices.addOrDeleteFavorites(
        productId: productId);
  }

  @override
  Future deleteFavorites() {

    throw UnimplementedError();
  }

  @override
  Future<List<Products>> getFavorites() async {
    return await baseFavoritesRemoteServices.getFavorites();
  }
}
