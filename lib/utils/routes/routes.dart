import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/route_names.dart';
import 'package:movie_app/view/home_view.dart';
import 'package:movie_app/view/login_view.dart';
import 'package:movie_app/view/signup_view.dart';
import 'package:movie_app/view/splash_view.dart';

class Routes {
  
  static Route<dynamic> generateRoute(RouteSettings settings){
    
    switch(settings.name){

      case RouteNames.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());

      case RouteNames.signup:
        return MaterialPageRoute(builder: (BuildContext context) => const SignUpView());

      case RouteNames.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      case RouteNames.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeView());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("No Route Defined"),
            ),
          );
        });

    }
  }
}