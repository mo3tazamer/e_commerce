import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/services_locator/services_locator.dart';
import 'package:e_commerce/domain_layer/entites/banners/banners.dart';
import 'package:e_commerce/domain_layer/entites/categories/categories.dart';
import 'package:e_commerce/domain_layer/use_cases/categoriesusecse/categoriesusecase.dart';
import 'package:e_commerce/domain_layer/use_cases/getbannersusecase/getbanners.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain_layer/entites/products/products.dart';
import '../../domain_layer/use_cases/favoritesusecase/addordeletefavorites.dart';
import '../../domain_layer/use_cases/favoritesusecase/getfavorites_usecase.dart';
import '../../domain_layer/use_cases/productsusecase/porductsusecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static Banners? getBanners;
  static Categories? categories;
  static List<Products>? getProducts;
  static List<Products>? getFavorites;
  static Map<int, bool> fav = {};

  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) async {
      emit(HomeLoading());
      if (event is MainPage) {
        try {
          getBanners =
              await GetBannersUseCase(baseGetBannersRepo: gitIt()).excute();
          categories = await CategoriesUseCase(gitIt()).excute();
          getProducts = await GetProductsUseCase(gitIt()).excute();
          for (var element in getProducts!) {
            fav.addAll({element.id!: element.inFavorites!});
          }

          emit(HomeSuccess());
        } on Exception catch (e) {
          emit(HomeError(error: e.toString()));
        }
      }

      ////////////////////////////////////
      else if (event is GetFavorites) {
        try {
          getFavorites = await GetFavoritesUseCase(gitIt()).excute();

          emit(GetFavoritesSuccess());
        } catch (e) {

          emit(GetFavoritesError(error: e.toString()));
        }
      }

      /////////////////////////////////////////

      else if (event is InFav) {
        fav[event.favId!] = !fav[event.favId]!;
        try {
          var fav = await AddOrDeleteFavoritesUseCase(gitIt())
              .excute(productId: (event.favId)!);
          getFavorites = await GetFavoritesUseCase(gitIt()).excute();

          emit(IsFavSuccess(fav));
        } catch (e) {
          fav[event.favId!] = !fav[event.favId]!;

          emit(IsFavError(error: e.toString()));
        }
      }
    });
  }
  @override
  void onTransition(Transition<HomeEvent, HomeState> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print(transition);
    }
  }
  // @override
  // void onChange(Change<HomeState> change) {

  //   super.onChange(change);
  //   if (kDebugMode) {
  //     print(change);
  //   }
  // }
}
