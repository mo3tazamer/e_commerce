import '../../repositery/base_favorites_repo.dart';

class AddOrDeleteFavoritesUseCase {
  BaseFavoritesRepo baseFavoritesRepo;

  AddOrDeleteFavoritesUseCase(this.baseFavoritesRepo);

  Future<String> excute({required int productId}) async {
    return await baseFavoritesRepo.addOrDeleteFavorites(productId: productId);
  }
}
