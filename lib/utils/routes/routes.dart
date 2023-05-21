import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/route_names.dart';
import 'package:movie_app/view/color_slider_view.dart';
import 'package:movie_app/view/favourites_view.dart';
import 'package:movie_app/view/home_view.dart';
import 'package:movie_app/view/login_view.dart';
import 'package:movie_app/view/signup_view.dart';
import 'package:movie_app/view/splash_view.dart';
import 'package:movie_app/view/theme_changer_view.dart';

import '../../view/favourite_picker_view.dart';

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

      case RouteNames.favourites:
        return MaterialPageRoute(builder: (BuildContext context) => const FavouritesScreen());

      case RouteNames.favouritePicker:
        return MaterialPageRoute(builder: (BuildContext context) => const FavouritesPicker());

      case RouteNames.themeChanger:
        return MaterialPageRoute(builder: (BuildContext context) => const ThemeScreen());

      case RouteNames.colorChanger:
        return MaterialPageRoute(builder: (BuildContext context) => const ColorSlider());

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