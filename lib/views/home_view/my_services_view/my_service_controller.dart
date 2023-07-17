import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/constants.dart';
import '../../../models/service_show_model.dart';
import '../../../respository/home_repository.dart';
import '../../../utils/share_pref.dart';
import '../../../utils/utils.dart';
import '../../booking_view/booking_screen_controller.dart';
import '../home_controller.dart';

class MyServiceController extends GetxController {
  final _myRepo = HomeRepository();
  HomeController homeController = Get.find<HomeController>();
  RxList<ServiceShowModel> serviceList = <ServiceShowModel>[].obs;
  RxList<ServiceShowModell> serviceListTwo = <ServiceShowModell>[].obs;


  @override
  void onInit() {
    for (int i = 0; i < 10; i++) {
      var status = Random()
          .nextBool()
          .obs;
      if (i == 0) {
        serviceList.add(
            ServiceShowModel(title: 'House cleaning', activeStatus: status));
      } else if (i == 1) {
        serviceList.add(
            ServiceShowModel(title: 'Pet Trainer', activeStatus: status));
      } else if (i == 2) {
        serviceList.add(
            ServiceShowModel(title: 'Carpenter', activeStatus: status));
      } else {
        serviceList.add(
            ServiceShowModel(title: 'Service $i', activeStatus: status));
      }
    }
    setupData();
    super.onInit();
  }

  void setupData() {
    for(int i=0;i<homeController.allServiceList.length;i++){
      var startTimeLen=homeController.allServiceList[i].startTime?.length ??0;
      var imgList=homeController.allServiceList[i].images ??[];
      var startTime=homeController.allServiceList[i].startTime ??[];
      var endTime=homeController.allServiceList[i].endTime??[];
      var availability=homeController.allServiceList[i].availability??[];
      bool active=(homeController.allServiceList[i].status??'')=='active'?true:false;
      var startTimeList=<String>[];
      var availabilityTimeList=<String>[];
      for(int k=0;k<startTimeLen;k++){
        var time='${startTime[i]}-${endTime[i]}';
        var av='${availability[i]}';
        startTimeList.add(time);
        availabilityTimeList.add(av);
      }
      serviceListTwo.add(ServiceShowModell(
          speciality: homeController.allServiceList[i].categoriesName??'',
          subSpecialtiy: homeController.allServiceList[i].subCategoriesName??'',
          serviceName: "serviceName",
          totalExp: homeController.allServiceList[i].totalExperience??'',
          price: homeController.allServiceList[i].chargePerService??'',
          areaRange: homeController.allServiceList[i].areaRange??'',
          description: homeController.allServiceList[i].description??'',
          preferTiming: startTimeList,
          availability: availability,
          imageList: imgList,
          activeStatus: RxBool(active), startTime: startTime, endTime: endTime,
          serviceId:  homeController.allServiceList[i].sId??''));

    }
 /*   for (int i = 0; i <
        bookingScreenController.upComingBookingModelList.length; i++) {
      var startTimeLen=bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.startTime?.length ??0;
      var imgList=bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.images ??[];
      var startTime=bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.startTime ??[];
      var endTime=bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.endTime??[];
      var availability=bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.availability??[];
      bool active=(bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.status??'')=='active'?true:false;
      var startTimeList=<String>[];
      var availabilityTimeList=<String>[];
      for(int k=0;k<startTimeLen;k++){
        var time='${startTime[i]}-${endTime[i]}';
        var av='${availability[i]}';
        startTimeList.add(time);
        availabilityTimeList.add(av);
      }
      serviceListTwo.add(ServiceShowModell(
          speciality: bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.categoriesName??'',
          subSpecialtiy: bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.subCategoriesName??'',
          serviceName: "serviceName",
          totalExp: bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.totalExperience??'',
          price: bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.chargePerService??'',
          areaRange: bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.areaRange??'',
          description: bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.description??'',
          preferTiming: startTimeList,
          availability: availability,
          imageList: imgList,
          activeStatus: RxBool(active), startTime: startTime, endTime: endTime,
          serviceId:  bookingScreenController.upComingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.sId??''));
    }
    for (int i = 0; i <
        bookingScreenController.onGoingBookingModelList.length; i++) {
      var startTimeLen=bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.startTime?.length ??0;
      var imgList=bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.images ??[];
      var startTime=bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.startTime ??[];
      var endTime=bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.endTime??[];
      var availability=bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.availability??[];
      bool active=(bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.status??'')=='active'?true:false;
      var startTimeList=<String>[];
      var availabilityTimeList=<String>[];
      for(int k=0;k<startTimeLen;k++){
        var time='${startTime[i]}-${endTime[i]}';
        var av='${availability[i]}';
        startTimeList.add(time);
        availabilityTimeList.add(av);
      }
      serviceListTwo.add(ServiceShowModell(
          speciality: bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.categoriesName??'',
          subSpecialtiy: bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.subCategoriesName??'',
          serviceName: "serviceName",
          totalExp: bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.totalExperience??'',
          price: bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.chargePerService??'',
          areaRange: bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.areaRange??'',
          description: bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.description??'',
          preferTiming: startTimeList,
          availability: availability,
          imageList: imgList,
          activeStatus: RxBool(active), startTime: startTime, endTime: endTime,
          serviceId:  bookingScreenController.onGoingBookingModelList[i].serviceProvider?[0].serviceProviderDetails?.sId??''));

    }
    for (int i = 0; i <
        bookingScreenController.onPastCompleteBookingList.length; i++) {
      var startTimeLen=bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.startTime?.length ??0;
      var imgList=bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.images ??[];
      var startTime=bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.startTime ??[];
      var endTime=bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.endTime??[];
      var availability=bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.availability??[];
      bool active=(bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.status??'')=='active'?true:false;
      var startTimeList=<String>[];
      var availabilityTimeList=<String>[];
      print('total len past ${startTimeLen}');
      try {
        for (int k = 0; k < startTimeLen; k++) {
          print('inside index $k');
          var time = '${startTime[i]}-${endTime[i]}';
          var av = '${availability[i]}';
          startTimeList.add(time);
          availabilityTimeList.add(av);
        }
      }catch(e){
        print('getting error in myservice controller during startor end time list or availiblity days list');
        print('%%%%%%%%%%%%%%%%% ERRRO : $e');
      }
      serviceListTwo.add(ServiceShowModell(
          speciality: bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.categoriesName??'',
          subSpecialtiy: bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.subCategoriesName??'',
          serviceName: "serviceName",
          totalExp: bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.totalExperience??'',
          price: bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.chargePerService??'',
          areaRange: bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.areaRange??'',
          description: bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.description??'',
          preferTiming: startTimeList,
          availability: availability,
          imageList: imgList,
          activeStatus: RxBool(active), startTime: startTime, endTime: endTime,
          serviceId:  bookingScreenController.onPastCompleteBookingList[i].serviceProvider?[0].serviceProviderDetails?.sId??''));
    }*/
  }

  void onServiceStatusChange(int index, bool value) {
    serviceList[index].activeStatus.value = value;
  }

  void pauseAllServiceClick() {
    for (int i = 0; i < serviceList.length; i++) {
      serviceList[i].activeStatus.value = false;
    }
  }

  void activeAllServiceClick() {
    for (int i = 0; i < serviceList.length; i++) {
      serviceList[i].activeStatus.value = true;
    }
  }

  void activeAllService(){
    BuildContext? context= Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.activeAllService().then((value) {
      if (kDebugMode) {
        print("success activeAllService put");
      }
      Utils.showDialogProgressDialog(context, false);
   for(int i=0;i<serviceListTwo.length;i++){
     serviceListTwo[i].activeStatus.value=true;
   }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      print('booking get api called error');
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

  void deActiveAllService(){
    BuildContext? context= Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.deActiveAllService().then((value) {
      if (kDebugMode) {
        print("success deActiveAllService put");
      }
      Utils.showDialogProgressDialog(context, false);
   for(int i=0;i<serviceListTwo.length;i++){
     serviceListTwo[i].activeStatus.value=false;
   }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      print('booking get api called error');
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
  void serviceActiveOrDeactiveClick(String id,int index)async{
    var data={
      'serviceId':id
    };
    BuildContext? context= Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.serviceActiveDeActive(data).then((value) {
      if (kDebugMode) {
        print("success servieActiveOrDeactiveClick put");
      }
      Utils.showDialogProgressDialog(context, false);
     serviceListTwo[index].activeStatus.value=!serviceListTwo[index].activeStatus.value;
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      print('serviceActiveDeActive called error');
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

}