
import 'package:e_commerce/core/cachehelper/cachehelper.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userStates.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/error/serviceseexception.dart';
import '../../../core/services_locator/services_locator.dart';
import '../../../domain_layer/entites/user/user.dart';
import '../../../domain_layer/use_cases/user_usecase/login_usecase.dart';
import '../../../domain_layer/use_cases/user_usecase/logout_usecase.dart';
import '../../../domain_layer/use_cases/user_usecase/profile_usecase.dart';
import '../../../domain_layer/use_cases/user_usecase/register_usecase.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  static User? profileData;
  UserBloc() : super(LogInUserIntState()) {
    on<UserEvents>((event, emit) async {
      emit(LogInUserLoading());

      if (event is LogInUserEvent) {
        try {
          var userData = await LogInUseCase(gitIt())
              .excute(email: event.email, password: event.password);

          emit(LogInUserSuccess(user: userData));
        } on Exception catch (e) {
          emit(LogInUserError(e.toString()));
        }
      }

      if (event is RegisterEvent) {

        try {
          var userData = await RegisterUseCase(gitIt()).excute(
              name: event.name,
              phone: event.phone,
              email: event.email,
              password: event.password,
              image: event.image);

          emit(LogInUserSuccess(user: userData));
        } on ServerException catch (e) {
          emit(LogInUserError(e.errorMessageModel.message));
        }
      }
         if(event is ProFileUserEvent){
           emit(ProfileUserLoading());
           try {
             profileData = await ProFileUseCase(gitIt()).excute(CacheHelper.getData(key: 'token') );
             emit(ProfileUserSuccess(user: profileData!));
           }
           on ServerException catch (e) {
             emit(LogInUserError(e.errorMessageModel.message));
           }
         }if(event is LogoutUserEvent){

           try {
            var logout = await LogOutUseCase(gitIt()).excute(CacheHelper.getData(key: 'token') );
             emit(LogoutUserSuccess(logout.message));
           }
           on ServerException catch (e) {
             emit(LogInUserError(e.errorMessageModel.message));
           }
         }




    });
  }

  @override
  void onTransition(Transition<UserEvents, UserStates> transition) {
    super.onTransition(transition);
    if (kDebugMode) {
      print(transition);
    }
  }
}
