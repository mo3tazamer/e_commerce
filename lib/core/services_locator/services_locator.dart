import 'package:e_commerce/data_layer/remote_services/favoritesremoteservices/favoritesremoteservices.dart';
import 'package:e_commerce/data_layer/remote_services/getbanners_remoteservices/getbanners_remoteservices.dart';
import 'package:e_commerce/data_layer/remote_services/getproducts_remoteservices/getproducts_remoteservices.dart';
import 'package:e_commerce/data_layer/remote_services/user_remoteservices/user_remote.dart';
import 'package:e_commerce/data_layer/repositery/favoritesrepo.dart';
import 'package:e_commerce/data_layer/repositery/getbannersrepo.dart';
import 'package:e_commerce/data_layer/repositery/userdatarepo.dart';
import 'package:e_commerce/domain_layer/repositery/basefavoritesrepo.dart';
import 'package:e_commerce/domain_layer/repositery/basegetbannersrepo.dart';



import 'package:e_commerce/domain_layer/use_cases/user_usecase/login_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/logout_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/profile_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/register_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/updateprofile_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../data_layer/repositery/getproductsrepo.dart';
import '../../domain_layer/repositery/baseporductsrepo.dart';
import '../../domain_layer/repositery/baseuserrepo/user_repo.dart';

import '../../domain_layer/use_cases/favoritesusecase/addordeletefavorites.dart';
import '../../domain_layer/use_cases/favoritesusecase/deletefavorites.dart';
import '../../domain_layer/use_cases/favoritesusecase/getfavorites_usecase.dart';
import '../../domain_layer/use_cases/getbannersusecase/getbanners.dart';
import '../../domain_layer/use_cases/productsusecase/porductsusecase.dart';

final gitIt = GetIt.instance;

class ServicesLocator {
  void user() {
    gitIt.registerLazySingleton(() => LogOutUseCase(gitIt()));
    gitIt.registerLazySingleton(() => ProFileUseCase(gitIt()));
    gitIt.registerLazySingleton(() => RegisterUseCase(gitIt()));
    gitIt.registerLazySingleton(() => UpDateProfileUseCase(gitIt()));
    gitIt.registerLazySingleton(() => LogInUseCase(gitIt()));
    gitIt.registerLazySingleton<BaseUserRepo>(() => UserDataRepo(gitIt()));
    gitIt.registerLazySingleton<BaseUserRemote>(() => UserRemote());
  }

  void banners() {
    /// usecase

    gitIt.registerLazySingleton(
        () => GetBannersUseCase(baseGetBannersRepo: gitIt()));

    ///domain
    gitIt.registerLazySingleton<BaseGetBannersRepo>(
        () => GetBannersRepo(gitIt()));

    /// data
    gitIt.registerLazySingleton<BaseGetBannersRemoteServices>(
        () => GetBannersRemoteServices());
  }

  void products() {
    /// usecase

    gitIt.registerLazySingleton(() => GetProductsUseCase(gitIt()));

    ///domain

    gitIt.registerFactory<BaseGetProductsRepo>(() => GetProductsRepo(gitIt()));

    /// data

    gitIt.registerLazySingleton<BaseGetProductsRemote>(
        () => GetProductsRemote());
  }

  void favorites(){




    gitIt.registerFactory(() => DeleteFavoritesUseCase(gitIt()));
    gitIt.registerFactory(() => AddOrDeleteFavoritesUseCase(gitIt()));
    gitIt.registerFactory(() => GetFavoritesUseCase(gitIt()));
    gitIt.registerFactory<BaseFavoritesRepo>(() => FavoriteRepo(gitIt()));

    gitIt.registerFactory<BaseFavoritesRemoteServices>(() => FavoritesRemoteServices());

  }
}
