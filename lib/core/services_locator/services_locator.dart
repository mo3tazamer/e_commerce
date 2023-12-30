

import 'package:e_commerce/data_layer/repositery/favorites_repo.dart';
import 'package:e_commerce/data_layer/repositery/getbanners_repo.dart';
import 'package:e_commerce/data_layer/repositery/user_data_repo.dart';

import 'package:e_commerce/domain_layer/repositery/base_favorites_repo.dart';
import 'package:e_commerce/domain_layer/repositery/base_getbanner_srepo.dart';

import 'package:e_commerce/domain_layer/use_cases/user_usecase/login_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/logout_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/profile_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/register_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/updateprofile_usecase.dart';
import 'package:get_it/get_it.dart';

import '../../data_layer/remote_services/favorites_remote_services/favorites_remote_services.dart';
import '../../data_layer/remote_services/getbanners_remote_services/getbanners_remote_services.dart';
import '../../data_layer/remote_services/getcategories_remote_services/categoriesremoteservices.dart';

import '../../data_layer/remote_services/getproducts_remote_services/getproducts_remote_services.dart';
import '../../data_layer/remote_services/user_remote_services/user_remote.dart';
import '../../data_layer/repositery/getcategories_repo.dart';
import '../../data_layer/repositery/getproducts_repo.dart';
import '../../domain_layer/repositery/base_user_repo/user_repo.dart';
import '../../domain_layer/repositery/basecategoriesrepo/base_categories_repo.dart';
import '../../domain_layer/repositery/base_porducts_repo.dart';


import '../../domain_layer/use_cases/categoriesusecse/categoriesusecase.dart';
import '../../domain_layer/use_cases/favoritesusecase/addordeletefavorites.dart';
import '../../domain_layer/use_cases/favoritesusecase/deletefavorites.dart';
import '../../domain_layer/use_cases/favoritesusecase/getfavorites_usecase.dart';
import '../../domain_layer/use_cases/getbannersusecase/getbanners.dart';
import '../../domain_layer/use_cases/productsusecase/porductsusecase.dart';
import '../../domain_layer/use_cases/productsusecase/searchproducts.dart';

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
    gitIt.registerLazySingleton(() => SearchProductsUseCase(gitIt()));

    ///domain

    gitIt.registerFactory<BaseGetProductsRepo>(() => GetProductsRepo(gitIt()));

    /// data

    gitIt.registerLazySingleton<BaseGetProductsRemote>(
        () => GetProductsRemote());
  }

  void favorites() {
    gitIt.registerFactory(() => DeleteFavoritesUseCase(gitIt()));
    gitIt.registerFactory(() => AddOrDeleteFavoritesUseCase(gitIt()));
    gitIt.registerFactory(() => GetFavoritesUseCase(gitIt()));
    gitIt.registerFactory<BaseFavoritesRepo>(() => FavoriteRepo(gitIt()));

    gitIt.registerFactory<BaseFavoritesRemoteServices>(
        () => FavoritesRemoteServices());
  }
  void categories() {
    /// usecase

    gitIt.registerLazySingleton(
            () => CategoriesUseCase( gitIt()));

    ///domain
    gitIt.registerLazySingleton<BaseCategoriesRepo>(
            () => CategoriesRipo(gitIt()));

    /// data
    gitIt.registerLazySingleton<BaseCategoriesRemoteServices>(
            () => CategoriesRemoteServices());
  }

}
