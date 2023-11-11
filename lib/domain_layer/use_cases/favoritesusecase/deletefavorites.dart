import '../../repositery/basefavoritesrepo.dart';

class DeleteFavoritesUseCase {
  BaseFavoritesRepo baseFavoritesRepo;

  DeleteFavoritesUseCase(this.baseFavoritesRepo);

  Future excute() async {
    return await baseFavoritesRepo.deleteFavorites();
  }
}
