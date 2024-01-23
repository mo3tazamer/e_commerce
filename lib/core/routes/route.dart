import 'package:e_commerce/persintion_layer/screens/home.dart';
import 'package:e_commerce/persintion_layer/screens/login_screen.dart';
import 'package:e_commerce/persintion_layer/screens/profile_screen.dart';
import 'package:flutter/material.dart';



import '../../persintion_layer/screens/get_favorites.dart';
import '../../persintion_layer/screens/register_screen.dart';

class AppRoute {
  static const String home = '/';
  static const String favorites = '/favorites';
  static const String login = '/login';
  static const String register = '/register';
  static const String profile = '/profile';
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {


    switch (settings.name) {
      case AppRoute.home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());

      case AppRoute.favorites:
        return MaterialPageRoute(builder: (context) => const GetFavorite());
      case AppRoute.login:
        return MaterialPageRoute(builder: (context) => const LogInScreen());
      case AppRoute.register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case AppRoute.profile:
        return MaterialPageRoute(builder: (context) => const ProFileScreen());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                  body: Center(child: Text('no route defined')),
                ));
    }
  }
}
