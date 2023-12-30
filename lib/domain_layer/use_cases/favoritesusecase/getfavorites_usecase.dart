import 'package:e_commerce/domain_layer/repositery/base_favorites_repo.dart';

import '../../entites/products/products.dart';

class GetFavoritesUseCase {
  BaseFavoritesRepo baseFavoritesRepo;

  GetFavoritesUseCase(this.baseFavoritesRepo);

  Future<List<Products>> excute() async {
    return await baseFavoritesRepo.getFavorites();
  }
}
