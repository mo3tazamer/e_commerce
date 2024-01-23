import 'package:e_commerce/domain_layer/entites/products/products.dart';
import 'package:e_commerce/domain_layer/repositery/base_favorites_repo.dart';

import '../models/fav_model.dart';
import '../remote_services/favorites_remote_services/favorites_remote_services.dart';


class FavoriteRepo extends BaseFavoritesRepo {
  BaseFavoritesRemoteServices baseFavoritesRemoteServices;

  FavoriteRepo(this.baseFavoritesRemoteServices);

  @override
  Future<FavModel> addOrDeleteFavorites({required int productId}) async {
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
