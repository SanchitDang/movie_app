import 'package:flutter/material.dart';
import 'package:movie_app/repository/auth_repo.dart';
import 'package:movie_app/utils/routes/route_names.dart';
import 'package:movie_app/utils/utils.dart';

class AuthViewModel with ChangeNotifier{
  final _myREpo = AuthRepository();

  bool _loading = false;

  bool get getLoading => _loading;

  setLoading(bool value){
    _loading = value;
    notifyListeners();
  }


  final bool _loadingSignup = false;

  bool get getLoadingSignup => _loadingSignup;

  setLoadingSignup(bool value){
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(BuildContext context, dynamic data) async {
    setLoading(true);
    _myREpo.loginApi(data).then((value) {
      setLoading(false);
      Navigator.pushNamed(context, RouteNames.home);
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.createFlushBar(context, error.toString());
    });
  }

  Future<void> signupApi(BuildContext context, dynamic data) async {
    setLoadingSignup(true);
    _myREpo.signupApi(data).then((value) {
      setLoadingSignup(false);
      Navigator.pushNamed(context, RouteNames.home);
    }).onError((error, stackTrace) {
      setLoadingSignup(false);
      Utils.createFlushBar(context, error.toString());
    });
  }

}