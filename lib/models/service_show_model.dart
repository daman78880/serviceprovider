import 'package:get/get.dart';

class ServiceShowModel {
  String title;
  RxBool activeStatus;

  ServiceShowModel({required this.title, required this.activeStatus});
}

class ServiceShowModell {
  String serviceId;
  String speciality;
  String subSpecialtiy;
  String serviceName;
  String totalExp;
  String price;
  String areaRange;
  String description;
  List<String> startTime;
  List<String> endTime;
  List<String> preferTiming;
  List<String> availability;
  List<String> imageList;
  RxBool activeStatus;

  ServiceShowModell({
    required this.serviceId,
    required this.speciality,
    required this.subSpecialtiy,
    required this.serviceName,
    required this.totalExp,
    required this.price,
    required this.areaRange,
    required this.description,
    required this.preferTiming,
    required this.startTime,
    required this.endTime,
    required this.availability,
    required this.imageList,
    required this.activeStatus,
  });
}
