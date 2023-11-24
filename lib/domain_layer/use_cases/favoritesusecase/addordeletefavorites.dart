import '../../repositery/basefavoritesrepo.dart';

class AddOrDeleteFavoritesUseCase {
  BaseFavoritesRepo baseFavoritesRepo;

  AddOrDeleteFavoritesUseCase(this.baseFavoritesRepo);

  Future<String> excute({required int productId}) async {
    return await baseFavoritesRepo.addOrDeleteFavorites(productId: productId);
  }
}
