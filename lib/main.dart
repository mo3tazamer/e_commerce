import 'package:device_preview/device_preview.dart';

import 'package:e_commerce/persintion_layer/screens/home.dart';
import 'package:e_commerce/persintion_layer/screens/login_screen.dart';
import 'package:flutter/foundation.dart';


import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cachehelper/cachehelper.dart';

import 'core/routes/route.dart';
import 'core/services_locator/services_locator.dart';
import 'core/theme/customize_application_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().user();
  ServicesLocator().banners();
  ServicesLocator().products();
  ServicesLocator().favorites();
  ServicesLocator().categories();
  await CacheHelper.init();
//!kReleaseMode
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: AppRoute.home,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',

        theme: customizeApplicationTheme(),

        home: CacheHelper.getData(key: 'token') != null
            ? HomeScreen()
            : const LogInScreen(),
      ),
    );
  }
}
