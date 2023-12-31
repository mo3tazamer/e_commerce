import 'package:e_commerce/core/cachehelper/cachehelper.dart';

class AppConst {
  static String baseurl = 'https://student.valuxapps.com/api/';
  static String postLogIn = '${baseurl}login';
  static String getProfile = '${baseurl}profile';
  static String putUpdateProfile = '${baseurl}update-profile';
  static String postLogOut = '${baseurl}logout';
  static String postRegister = '${baseurl}register';
  static String getBanners = '${baseurl}banners';
  static String getProducts = '${baseurl}home';
  static String addOrDeleteFavorites = '${baseurl}favorites';
  static String getFavorites = '${baseurl}favorites';
  static String getCategories = '${baseurl}categories';
  static String searchProducts = '${baseurl}products/search';
  static var token = CacheHelper.getData(key: 'token');
}
