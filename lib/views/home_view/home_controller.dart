import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/models/all_service_home_model.dart';

import '../../respository/home_repository.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../add_service_view/add_service_second_view/service_second_viewModel.dart';
import '../add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import '../addbankdetailview/controller.dart';
import '../booking_view/booking_screen_controller.dart';
import '../chat_view/chat_view_controller.dart';
import '../specialty_view/specialty_view_model.dart';
import '../upload_image_view/uploadimageviewmodel.dart';
class HomeController extends GetxController{
  BookingScreenController bookingController = Get.put(BookingScreenController(),permanent: true);
  RxInt selectedIndex=0.obs;
  final _myRepo = HomeRepository();
  var allServiceList= <Data>[].obs;

  void changeBottonNavigationIndex(int value){
    if( selectedIndex.value!=value) {
      selectedIndex.value = value;
      if(selectedIndex.value==3 || selectedIndex.value==1){
        bookingController.getData();
      }
      if(selectedIndex.value!=2){
        Get.delete<ChatViewController>();
      }else{
      }
    }
  }
  @override
  void onInit() {
    print('selected index customer $selectedIndex');
    // bookingController.getData();
    getData();
    super.onInit();
  }
  void cleanServiceController(){
    Get.delete<SpecialtyViewModel>(force: true);
    Get.delete<ServiceFirstViewModel>(force: true);
    Get.delete<ServiceSecondViewModel>(force: true);
    Get.delete<UploadImageViewModel>(force: true);
    Get.delete<ControllerBank>(force: true);
    Get.delete<BookingScreenController>(force: true);
  }
  void onMyServiceClick()async{
    bool check = await getData();
    if(check) {
      if (
      allServiceList.isNotEmpty
      ) {
        Get.toNamed(RoutesName.myService);
      } else {
        Get.toNamed(RoutesName.emptyService);
      }
    }
  }


  Future<bool> getData()  {
    return _myRepo.getAllServiceHome().then((value) {
        if (kDebugMode) {
          print("success booking get");
        }
        allServiceList.clear();
        value.data?.forEach((element) {
          print('elecemtn ${element.status}');
          allServiceList.add(element);
        });
        return true;
      }).onError((error, stackTrace) {
        Utils.snackBar('Error', error.toString());
        print('booking get api called error');
        if (kDebugMode) {
          print("error:${error.toString()}");
        }
        return false;
      });
  }
}