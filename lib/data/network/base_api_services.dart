import 'dart:io';
import 'dart:typed_data';


abstract class BaseApiService{
  Future<dynamic> getApi(String url);
  Future<dynamic> getApiWithHeader(String url);
  Future<dynamic> getApiWithHeaderData(String url,dynamic jsonBody);
  Future<dynamic> postApi(String url,dynamic jsonBody);
  Future<dynamic> postApiWithHeader(String url,dynamic jsonBody);
  Future<dynamic> postServiceUploadImageApi(String url,String serviceId ,String imagePath);
  Future<dynamic> createService(String url, String categoriesName, String subCategoriesName, String serviceName,
      String totalExperience  , String currency, String chargePerService, String areaRange  , String description  ,
      List<String> dayList, List<String> startTimeList, List<String> endTimeList, List<File> imagesList,List<Uint8List> bitesImageList,List<String> backBitesImageNameList);
  Future<dynamic> postUploadImageApi(String url,String imagePath, Uint8List? data, String name);
  Future<dynamic> bookingService(String url,int serviceType ,
      dynamic data);
  Future<dynamic> putApi(String url);
  Future<dynamic> putApiWithHeader(String url,dynamic jsonBody);
  Future<dynamic> putApiWithHeaderData(String url,dynamic jsonBody);
  Future<dynamic> deleteApiWithHeader(String url,dynamic jsonBody);
  Future<dynamic> notificationSend(String url,dynamic jsonBody);
}