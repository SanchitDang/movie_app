import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/res/colors.dart';
import 'package:movie_app/view/services/splash_services.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  SplashServices sS = SplashServices();

  @override
  void initState(){
    super.initState();
    sS.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Text("My Movies",style: GoogleFonts.montserrat(
          color: MyColors.appThemeColor,
          fontWeight: FontWeight.bold,
          fontSize: screenWidth / 8,
        ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
