
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userStates.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services_locator/services_locator.dart';
import '../../../domain_layer/use_cases/user_usecase/login_usecase.dart';
import '../../../domain_layer/use_cases/user_usecase/register_usecase.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  UserBloc() : super(LogInUserIntState()) {
    on<UserEvents>((event, emit) async {
      emit(LogInUserLoading());

      if (event is LogInUserEvent) {
        try {
          var userData = await LogInUseCase(gitIt())
              .excute(email: event.email, password: event.password);

          emit(LogInUserSuccess(user: userData));
        } on Exception catch (e) {
          emit(LogInUsererror(e.toString()));
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
        } on Exception catch (e) {
          emit(LogInUsererror(e.toString()));
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
