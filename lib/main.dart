import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:e_commerce/persintion_layer/screens/loginscreen.dart';

import 'package:e_commerce/persintion_layer/screens/registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/cachehelper/cachehelper.dart';
import 'core/services_locator/services_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().user();
  ServicesLocator().banners();
  ServicesLocator().products();
  ServicesLocator().favorites();

  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const LogInScreen(),
      ),
    );
  }
}
