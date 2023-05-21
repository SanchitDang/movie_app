import 'dart:async';
import 'package:flutter/material.dart';
import 'package:movie_app/utils/routes/route_names.dart';
import 'package:movie_app/view_model/user_view_model.dart';

import '../../model/UserModel.dart';

class SplashServices {

  Future<UserModel> getUserData() => UserViewModel().getUser();

  void isLogin(BuildContext context) {

    getUserData().then((value) => {

      if (value.token != null && value.token != '') {
          Timer(const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, RouteNames.home))
      } else {
      Timer(const Duration(seconds: 3),
      () => Navigator.pushReplacementNamed(context, RouteNames.signup))
      }
    });

  }
}
