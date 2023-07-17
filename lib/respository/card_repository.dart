import 'package:service_provider_two/models/add_card_model.dart';
import 'package:service_provider_two/models/card_detail_model.dart';
import '../data/network/api_end_points.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';

class CardRepository{
  final BaseApiService _apiService =NetworkApiService();
  Future<AddCardModel> addCardApi(dynamic data)async{
    try{
      dynamic response=await _apiService.postApiWithHeader(ApiEndPoint.insertCard,data);
      return  AddCardModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<AddCardModel> editCardDetail(dynamic data)async{
    try{
      dynamic response=await _apiService.putApiWithHeader(ApiEndPoint.editCardDetail,data);
      return  AddCardModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<AddCardModel> removeCardDetail(dynamic data)async{
    try{
      dynamic response=await _apiService.deleteApiWithHeader(ApiEndPoint.removeCardDetails,data);
      return  AddCardModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<CardDetailModel> getAllCardDetails()async{
    try{
      dynamic response=await _apiService.getApiWithHeader(ApiEndPoint.getCardDetails);
      return  CardDetailModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }


}