import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:e_commerce/persintion_layer/screens/home.dart';
import 'package:e_commerce/persintion_layer/screens/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cachehelper/cachehelper.dart';

import 'core/routes/route.dart';
import 'core/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().user();
  ServicesLocator().banners();
  ServicesLocator().products();
  ServicesLocator().favorites();
  ServicesLocator().categories();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => BlocProvider(
        create: (context) => HomeBloc()
          ..add(
            MainPage(),
          )
          ..add(
            GetFavoritesEvent(),
          ),
        child: MaterialApp(
          onGenerateRoute: RouteGenerator.generateRoute,
          debugShowCheckedModeBanner: false,
          title: 'e-Commerce',
          home: CacheHelper.getData(key: 'token') != null
              ? const HomeScreen()
              : const LogInScreen(),
        ),
      ),
    );
  }
}
