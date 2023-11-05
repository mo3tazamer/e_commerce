import 'package:dio/dio.dart';
import 'package:e_commerce/core/cachehelper/cachehelper.dart';
import 'package:e_commerce/core/error/serviceseexception.dart';
import 'package:e_commerce/data_layer/models/user_model/user_model.dart';

import '../../../core/const/appconst.dart';
import '../../../core/network/erromessagemodel.dart';
import '../../models/logoutmodel/logoutmodel.dart';

abstract class BaseUserRemote {
  Future postRegister(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String image});
  Future<UserModel> postLogIn(
      {required String email, required String password});
  Future<UserModel> getProfile(String token);
  Future<UserModel> putUpdateProfile(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String image});
  Future<LogOutModel> postLogOut(String token);
}

class UserRemote extends BaseUserRemote {
  @override
  Future<UserModel> getProfile(String token) async {
    var response = await Dio().get(AppConst.getProfile,
        options: Options(headers: {'Authorization': token}));
    if (response.statusCode == 200) {
      return UserModel.fromMap(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formMap(response.data));
    }
  }

  @override
  Future<UserModel> postLogIn(
      {required String email, required String password}) async {
    var response = await Dio().post(AppConst.postLogIn, data: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      var userdata = UserModel.fromMap(response.data);

      CacheHelper.saveData(key: 'token', value: userdata.data!.token);
      return userdata;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formMap(response.data));
    }
  }

  @override
  Future<LogOutModel> postLogOut(String token) async {
    var response = await Dio().post(AppConst.postLogOut, data: {
      'fcm_token': CacheHelper.getData(key: 'token'),
    });

    if (response.statusCode == 200) {
      return LogOutModel.formMap(response.data);
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formMap(response.data));
    }
  }

  @override
  Future<UserModel> postRegister(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String image}) async {
    var response = await Dio().post(AppConst.postRegister, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    });
    if (response.statusCode == 200) {
      UserModel userdata = UserModel.fromMap(response.data);
      
          CacheHelper.saveData(key: 'token', value: userdata.data!.token);

      /// todo: take token in shared pref

      return userdata;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formMap(response.data));
    }
  }

  @override
  Future<UserModel> putUpdateProfile(
      {required String name,
      required String phone,
      required String email,
      required String password,
      required String image}) async {
    var response = await Dio().post(
      AppConst.putUpdateProfile,
      options: Options(headers: {
        'lang': 'en',
        'Content-Type': 'application/json',
        'Authorization': CacheHelper.getData(key: 'token')
      }),
      data: {
        'name': name,
        'phone': phone,
        'email': email,
        'password': password,
        'image': image,
      },
    );
    if (response.statusCode == 200) {
      UserModel userdata = UserModel.fromMap(response.data);

      return userdata;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.formMap(response.data));
    }
  }
}
