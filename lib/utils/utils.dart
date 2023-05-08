import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:another_flushbar/flushbar_route.dart';

import '../res/colors.dart';

class Utils {

  static changeFocus(BuildContext context, FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  static createToastShort(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: MyColors.appThemeColor,
      textColor: Colors.white,
    );
  }

  static createToastLong(String message){
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: MyColors.appThemeColor,
      textColor: Colors.white,
    );
  }

  static createFlushBar(BuildContext context, String message){
    showFlushbar(context: context,
        flushbar: Flushbar(
          icon: const Icon(Icons.error, size: 28,color:  Colors.white,),
          message: message,
          messageColor: Colors.white,
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(8),
          flushbarPosition: FlushbarPosition.TOP,
          forwardAnimationCurve: Curves.decelerate,
          reverseAnimationCurve: Curves.easeInOut,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(15),
          positionOffset: 20,


    )..show(context));
  }

  static createSnackBar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 3),
        backgroundColor: MyColors.appThemeColor,
      ),
    );
  }

}

