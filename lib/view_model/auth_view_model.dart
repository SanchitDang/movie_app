import 'package:flutter/material.dart';
import 'package:movie_app/model/UserModel.dart';
import 'package:movie_app/repository/auth_repo.dart';
import 'package:movie_app/utils/routes/route_names.dart';
import 'package:movie_app/utils/utils.dart';
import 'package:movie_app/view_model/user_view_model.dart';

class AuthViewModel with ChangeNotifier{
  final _myREpo = AuthRepository();
  final _userViewModel = UserViewModel();

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
      _userViewModel.saveUser(UserModel.fromJson(value));
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
      _userViewModel.saveUser(UserModel.fromJson(value));
      Navigator.pushNamed(context, RouteNames.home);
    }).onError((error, stackTrace) {
      setLoadingSignup(false);
      Utils.createFlushBar(context, error.toString());
    });
  }

}