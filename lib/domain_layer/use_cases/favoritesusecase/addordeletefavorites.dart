import '../../../data_layer/models/fav_model.dart';
import '../../repositery/base_favorites_repo.dart';

class AddOrDeleteFavoritesUseCase {
  BaseFavoritesRepo baseFavoritesRepo;

  AddOrDeleteFavoritesUseCase(this.baseFavoritesRepo);

  Future<FavModel> excute({required int productId}) async {
    return await baseFavoritesRepo.addOrDeleteFavorites(productId: productId);
  }
}
