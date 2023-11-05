import 'package:e_commerce/data_layer/remote_services/user_remoteservices/user_remote.dart';
import 'package:e_commerce/data_layer/repositery/userdatarepo.dart';
import 'package:e_commerce/domain_layer/repositery/user_repo/user_repo.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/login_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/logout_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/profile_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/register_usecase.dart';
import 'package:e_commerce/domain_layer/use_cases/user_usecase/updateprofile_usecase.dart';
import 'package:get_it/get_it.dart';

final gitIt = GetIt.instance;

class ServicesLocator {
  void init() {
    gitIt.registerLazySingleton(() => LogOutUseCase(gitIt()));
    gitIt.registerLazySingleton(() => ProFileUseCase(gitIt()));
    gitIt.registerLazySingleton(() => RegisterUseCase(gitIt()));
    gitIt.registerLazySingleton(() => UpDateProfileUseCase(gitIt()));
    gitIt.registerLazySingleton(() => LogInUseCase(gitIt()));
    gitIt.registerLazySingleton<BaseUserRepo>(() => UserDataRepo(gitIt()));
    gitIt.registerLazySingleton<BaseUserRemote>(() => UserRemote());
  }
}
