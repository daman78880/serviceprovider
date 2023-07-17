import 'package:service_provider_two/models/login_model.dart';
import 'package:service_provider_two/models/login_with_otp_model.dart';
import 'package:service_provider_two/models/socialmedia_login_model.dart';
import '../data/network/api_end_points.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';

class AuthRepository{
  final BaseApiService _apiService =NetworkApiService();
Future<LoginModel> loginApi(dynamic data)async{
  try{
      dynamic response=await _apiService.postApi(ApiEndPoint.login,data);
      return  LoginModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }
  Future<LoginWithOtpModel> loginWithOtpApi(dynamic data)async{
    try{
      dynamic response=await _apiService.postApi(ApiEndPoint.loginWithOtp,data);
      return  LoginWithOtpModel.fromJson(response);
    }catch(e){
      rethrow ;
    }
  }
  Future<SocialMediaLoginModel> socialMediaLogin(dynamic data)async{
    try{
      dynamic response=await _apiService.postApi(ApiEndPoint.loginWithSocialMedia,data);
      return  SocialMediaLoginModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }


}