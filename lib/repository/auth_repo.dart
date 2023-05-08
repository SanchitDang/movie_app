import 'package:movie_app/data/network/BaseApiServices.dart';
import 'package:movie_app/data/network/NetworkApiServices.dart';
import 'package:movie_app/res/app_urls.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try{
      dynamic response = _apiServices.getPostApiResponse(AppUrls.loginUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> signupApi(dynamic data) async {
    try{
      dynamic response = _apiServices.getPostApiResponse(AppUrls.registerUrl, data);
      return response;
    }catch(e){
      rethrow;
    }
  }

}