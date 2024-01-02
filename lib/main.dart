import 'package:device_preview/device_preview.dart';
import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:e_commerce/persintion_layer/screens/home.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cachehelper/cachehelper.dart';
import 'core/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().user();
  ServicesLocator().banners();
  ServicesLocator().products();
  ServicesLocator().favorites();
  ServicesLocator().categories();

  await CacheHelper.init();

  var token = await CacheHelper.getData(key: 'token');
  if (kDebugMode) {
    print(token);
  }
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserBloc()..add(ProFileUserEvent())),
        BlocProvider(
            lazy: false,
            create: (context) => HomeBloc()
              ..add(GetFavorites())
              ..add(MainPage())),
      ],
      child: ScreenUtilInit(

        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}

