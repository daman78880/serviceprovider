import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/models/all_services_model.dart';
import 'package:service_provider_two/respository/home_repository.dart';
import '../../models/services_show_model.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../booking_view/booking_screen_controller.dart';
import '../chat_view/chat_view_controller.dart';

class HomeCustomerController extends GetxController{
  BookingScreenController bookingController = Get.put(BookingScreenController(),permanent: true);

  final _myRepo = HomeRepository();
  RxList<ServicesShowModel> servicesList=<ServicesShowModel>[].obs;
  RxInt selectedIndex=0.obs;
  RxList<Data> serviceList = <Data>[].obs;


  void changeBottonNavigationIndex(int value){
    if( selectedIndex.value!=value) {
      selectedIndex.value = value;
    }
    if(selectedIndex.value==1){
      bookingController.getData();
    }
    if(selectedIndex.value!=2){
      Get.delete<ChatViewController>();
    }else{
    }
  }

  @override
  void onReady() {
    // hitAllServicesList();
    super.onReady();
  }
  void hitAllServicesList(){
    BuildContext? context=Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.getAllServicesApi().then((value ) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("success getAllServicesApi value :$value");
      }
      serviceList.clear();
      value.data?.forEach((element) {
        serviceList.add(element);
      });

    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
  void onCategoryClick(Data data){
    Get.toNamed(RoutesName.allSubServices,arguments:[data.iId?.categoriesName??'']);
  }

}