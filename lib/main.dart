import 'package:e_commerce/persintion_layer/contollers/home_bloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userBloc.dart';
import 'package:e_commerce/persintion_layer/contollers/userBloc/userEvents.dart';
import 'package:e_commerce/persintion_layer/screens/home.dart';


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
  ServicesLocator().categories();



  await CacheHelper.init();
  

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UserBloc().. add(ProFileUserEvent())),
        BlocProvider(lazy: false,
            create: (context) => HomeBloc()..add(GetFavorites())..add(MainPage())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  HomeScreen(),
      ),
    );
  }
}
