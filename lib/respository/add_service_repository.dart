import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:service_provider_two/models/booking_service_model.dart';
import 'package:service_provider_two/models/create_service_one_time_model.dart';
import 'package:service_provider_two/models/create_service_second_model.dart';
import 'package:service_provider_two/models/create_sub_category_model.dart';
import 'package:service_provider_two/models/service_image_upload_model.dart';
import 'package:service_provider_two/models/show_services_model.dart';
import 'package:service_provider_two/models/sub_specility_detail_model.dart';
import '../data/network/api_end_points.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';
import '../models/create_category_model.dart';
import '../models/get_service_detail_model.dart';

class AddServiceRepository {
  final BaseApiService _apiService = NetworkApiService();

  Future<dynamic> addServiceFirstApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiWithHeader(
          ApiEndPoint.createFirstService, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateServiceSecondModel> addServiceSecondApi(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiWithHeader(
          ApiEndPoint.createSecondService, data);
      return CreateServiceSecondModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<SubSpecilityDetailModel> getSubSpeciltyDetailApi() async {
    try {
      dynamic response = await _apiService
          .getApiWithHeader(ApiEndPoint.getSubCategoriesDetail);
      return SubSpecilityDetailModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ShowServicesModel> getServiceIdApi() async {
    try {
      dynamic response =
          await _apiService.getApiWithHeader(ApiEndPoint.showServices);
      return ShowServicesModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<ServiceImageUploadModel> serviceUploadImage(
      String serviceId, String imagePath) async {
    try {
      dynamic response = await _apiService.postServiceUploadImageApi(
          ApiEndPoint.addImage, serviceId, imagePath);
      return ServiceImageUploadModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateServiceOneTimeModel> addService(
    String categoriesName,
    String subCategoriesName,
    String serviceName,
    String totalExperience,
    String currency,
    String chargePerService,
    String areaRange,
    String description,
    List<String> dayList,
    List<String> startTimeList,
    List<String> endTimeList,
    List<File> imagesList,
    List<Uint8List> imageListUtf,
    List<String> backBitesImageNameList,
  ) async {
    if (kDebugMode) {
      print(
        'dayList $dayList\nlength:${dayList.length}\nstartTime$startTimeList\nlen:${startTimeList.length}\nendTime:$endTimeList\nlen:${endTimeList.length}\nimageList${imagesList.length}');
    }
    try {
      dynamic response = await _apiService.createService(
          ApiEndPoint.createService,
          categoriesName,
          subCategoriesName,
          serviceName,
          totalExperience,
          currency,
          chargePerService,
          areaRange,
          description,
          dayList,
          startTimeList,
          endTimeList,
          imagesList,
          imageListUtf,
          backBitesImageNameList);
      return CreateServiceOneTimeModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<BookingServiceModel> bookingService(
   int serviceType ,
  dynamic data
  ) async {
    if (kDebugMode) {
      print(
        'serviceType $serviceType\nlength:$data');
    }
    try {
      dynamic response = await _apiService.bookingService(ApiEndPoint.bookingService, serviceType,data);
      return BookingServiceModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<GetServiceDetailModel> getServiceDetail(dynamic data) async {
    try {
      dynamic response = await _apiService.getApiWithHeaderData(
          ApiEndPoint.serviceDetails, data);
      return GetServiceDetailModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateCategoryModel> createCategory(dynamic category) async {
    try {
      dynamic response = await _apiService.postApiWithHeader(
          ApiEndPoint.createCategories, category);
      return CreateCategoryModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }

  Future<CreateSubCategoryModel> createSubCategory(dynamic data) async {
    try {
      dynamic response = await _apiService.postApiWithHeader(
          ApiEndPoint.createSubCategories, data);
      return CreateSubCategoryModel.fromJson(response);
    } catch (e) {
      rethrow;
    }
  }
}
