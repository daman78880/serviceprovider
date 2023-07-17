import 'package:service_provider_two/models/all_service_home_model.dart';
import 'package:service_provider_two/models/all_services_model.dart';
import 'package:service_provider_two/models/all_sub_category_model.dart';
import 'package:service_provider_two/models/booking_model.dart';
import 'package:service_provider_two/models/review_model.dart';
import 'package:service_provider_two/models/search_result_model.dart';
import 'package:service_provider_two/models/sub_category_provider_list_model.dart';
import '../data/network/api_end_points.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../models/Generate_otp_model.dart';
import '../models/booking_cancel_model.dart';

class HomeRepository{
  final BaseApiService _apiService =NetworkApiService();
  Future<AllServicesModel> getAllServicesApi()async{
    try{
      dynamic response=await _apiService.getApiWithHeader(ApiEndPoint.allServices);
      return  AllServicesModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<AllSubCategoryModel> getAllSubCategoryApi(String id)async{
    try{
      dynamic response=await _apiService.getApiWithHeaderData(ApiEndPoint.listOfSubCategory,id);
      return  AllSubCategoryModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<SubCategoryProviderListModel> getListAllSubCategoryProviderApi(String id)async{
    try{
      dynamic response=await _apiService.getApiWithHeaderData(ApiEndPoint.listOfAllSubCategoryProvider,id);
      return  SubCategoryProviderListModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<BookingModel> getListOfBookings()async{
    try{
      dynamic response=await _apiService.getApiWithHeader(ApiEndPoint.bookingList);
      return  BookingModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<AllServiceHomeModel> getAllServiceHome()async{
    try{
      dynamic response=await _apiService.getApiWithHeader(ApiEndPoint.allServiceDetailsOfProvider);
      return  AllServiceHomeModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<BookingCancelModel> cancelBooking(String id)async{
    try{
      dynamic response=await _apiService.putApiWithHeaderData(ApiEndPoint.bookingCancel,id);
      return  BookingCancelModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<GenerateOtpModel> generateOtpBookingApi(String id)async{
    try{
      dynamic response=await _apiService.putApiWithHeaderData(ApiEndPoint.generateBookingOtp,id);
      return  GenerateOtpModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<BookingCancelModel> confirmBookingApi(String id)async{
    try{
      dynamic response=await _apiService.putApiWithHeaderData(ApiEndPoint.bookingApprovalByProvider,id);
      return  BookingCancelModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }
  Future<BookingCancelModel> completeBookingApi(String id)async{
    try{
      dynamic response=await _apiService.putApiWithHeaderData(ApiEndPoint.completeBooking,id);
      return  BookingCancelModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> rattingApi(dynamic data)async{
    try{
      print('inside hitting ppost api');
      dynamic response=await _apiService.postApiWithHeader(ApiEndPoint.customerRating,data);
      // return  BookingCancelModel.fromJson(response);
      return  response;
    }catch(e){
      rethrow;
    }
  }
  Future<dynamic> bookingStartOtpApi(dynamic data)async{
    try{
      dynamic response=await _apiService.putApiWithHeader(ApiEndPoint.approveBooking,data);
      // return  BookingCancelModel.fromJson(response);
      return  response;
    }catch(e){
      rethrow;
    }
  }
  Future<dynamic> activeAllService()async{
    try{
      dynamic response=await _apiService.putApi(ApiEndPoint.activeStatus);
      return  response;
    }catch(e){
      rethrow;
    }
  }
  Future<dynamic> deActiveAllService()async{
    try{
      dynamic response=await _apiService.putApi(ApiEndPoint.deactiveStatus);
      return  response;
    }catch(e){
      rethrow;
    }
  }
  Future<dynamic> serviceActiveDeActive(dynamic id)async{
    try{
      dynamic response=await _apiService.putApiWithHeader(ApiEndPoint.statusChangeService,id);
      return  response;
    }catch(e){
      rethrow;
    }
  }
  Future<SearchResultModel> searchResultApi(String id)async{
    try{
      dynamic response=await _apiService.getApiWithHeaderData(ApiEndPoint.searchService,id);
      return  SearchResultModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }

  Future<dynamic> sendNotification(data)async{
    try{
      dynamic response= await _apiService.notificationSend(ApiEndPoint.fcm,data);
      return  response;
    }catch(e){
      rethrow;
    }
  }
Future<ReviewModel> getReviewApi()async{
    try{
      dynamic response= await _apiService.getApiWithHeader(ApiEndPoint.ratingByCustomer);
    return  ReviewModel.fromJson(response);
    }catch(e){
      rethrow;
    }
  }





  // Future<ServiceProviderDetailModel> getServiceProviderDetailApi(String id)async{
  //   try{
  //     dynamic response=await _apiService.getApiWithHeaderData(ApiEndPoint.serviceProviderDetail,id);
  //     return  ServiceProviderDetailModel.fromJson(response);
  //   }catch(e){
  //     rethrow;
  //   }
  // }


}