import '../../data_layer/models/fav_model.dart';
import '../entites/products/products.dart';

abstract class BaseFavoritesRepo {
  Future<List<Products>> getFavorites();
  Future<FavModel> addOrDeleteFavorites({required int productId});
  Future deleteFavorites();
}
