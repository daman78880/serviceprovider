import 'dart:typed_data';
import 'package:service_provider_two/models/bank_detail_api_model.dart';
import 'package:service_provider_two/models/edit_profile_model.dart';
import 'package:service_provider_two/models/help_and_support_model.dart';
import '../data/network/api_end_points.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../models/CreateBankDetailModel.dart';

class ProfileRepository{
  final BaseApiService _apiService =NetworkApiService();

  Future<EditProfileModel> ediProfileUpdateApi(dynamic data)async{
    try{
      dynamic response=await _apiService.putApiWithHeader(ApiEndPoint.profileUpdate,data);
      return  EditProfileModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<HelpAndSupportModel> helpAndSupportApi(dynamic data)async{
    try{
      dynamic response=await _apiService.postApiWithHeader(ApiEndPoint.helpAndSupport,data);
      return  HelpAndSupportModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }

  Future<dynamic> editBankDetailApi(dynamic data)async{
    try{
      dynamic response=await _apiService.putApiWithHeader(ApiEndPoint.editBankDetail,data);
      return response;
    }catch(e){
      throw e;
    }
  }

  Future<CreateBankDetailModel>  createBankDetail(dynamic data)async{
    try{
      dynamic response=await _apiService.postApiWithHeader(ApiEndPoint.createBankDetail,data);
      return  CreateBankDetailModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }
  Future<BankDetailApiModel>  getBankDetail()async{
    try{
      dynamic response=await _apiService.getApiWithHeader(ApiEndPoint.getBankDetail);
      return  BankDetailApiModel.fromJson(response);
    }catch(e){
      throw e;
    }
  }  Future<dynamic>  deleteBankDetail(dynamic data)async{
    try{
      dynamic response=await _apiService.deleteApiWithHeader(ApiEndPoint.removeBankDetails,data);
      return  response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic>  uploadProfileImageApi(String imagePath, Uint8List? data, String name)async{
    try{
      dynamic response=await _apiService.postUploadImageApi(ApiEndPoint.updateUserProfilePicture,imagePath,data,name);
      return  response;
    }catch(e){
      throw e;
    }
  }
  Future<dynamic>  getProfilePicApi()async{
    try{
      dynamic response=await _apiService.getApiWithHeader(ApiEndPoint.showProfilePicture);
      return  response;
    }catch(e){
      throw e;
    }
  }


}