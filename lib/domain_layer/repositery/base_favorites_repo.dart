import '../entites/products/products.dart';

abstract class BaseFavoritesRepo {
  Future<List<Products>> getFavorites();
  Future<String> addOrDeleteFavorites({required int productId});
  Future deleteFavorites();
}
