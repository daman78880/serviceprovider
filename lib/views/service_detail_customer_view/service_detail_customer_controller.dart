import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import '../../models/service_provider_detail_model.dart';
import '../../respository/home_repository.dart';
import '../../utils/constants.dart';
import '../../utils/routes/routes_name.dart';
import 'package:service_provider_two/models/sub_category_provider_list_model.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';
import '../all_customerl_services_view/on_click_service_customer/on_click_service_controller.dart';

class ServiceDetailCustomerController extends GetxController {
  OnClickServiceController onClickServiceController = Get.find<OnClickServiceController>();
  final _myRepo = HomeRepository();
  int serviceProviderIndex=0;
  String serviceId='';
  RxList<String> photoVideoList = [
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
  ].obs;
  Rx<Data> userData = Rx<Data>(Data());
  RxBool showLayout=false.obs;
  // RxBool showLayout=true.obs;

  @override
  void onInit() {
    serviceProviderIndex=Get.arguments[0]??0;
    super.onInit();
  }
  @override
  void onReady() {
    showLayout.value=true;
    // =value.data![0];
    userData.value=onClickServiceController.subCategoryList[serviceProviderIndex];
    serviceId=onClickServiceController.subCategoryList[serviceProviderIndex].serviceDetails?.sId??'';
    print('id for service is :${onClickServiceController.subCategoryList[serviceProviderIndex].serviceDetails?.sId??''}');
    super.onReady();
  }


// void hitGetServiceDetail(){
//   if(serviceProviderId.isNotEmpty) {
//     BuildContext? context = Get.context;
//     Utils.showDialogProgressDialog(context!, true);
//     _myRepo.getServiceProviderDetailApi(serviceProviderId).then((value) {
//       Utils.showDialogProgressDialog(context, false);
//       if (kDebugMode) {
//         print("success getAllServicesApi value :${value.data![0]}");
//       }
//       userData.value=value.data![0];
//       showLayout.value=true;
//
//       // value.data?.forEach((element) {subCategoryList.add(element);});
//     }).onError((error, stackTrace) {
//       Utils.showDialogProgressDialog(context, false);
//       Utils.snackBar('Error', error.toString());
//       if (kDebugMode) {
//         print("error:${error.toString()}");
//       }
//     });
//   }else{
//     Utils.snackBar('ServiceProviderId is empty', 'Please go back and come back.');
//   }
// }
void onBookNowClick(String id){
  Get.toNamed(RoutesName.selectServiceDetailCustomerView,arguments: [id]);
}
void onChatClick(String id)async{
  var name = '${await SharePref.getString(Constants.firstName)} ${await SharePref.getString(Constants.lastName)}';
  var receiverName ='${userData.value.firstName} ${userData.value.lastName}';
  var senderId = await SharePref.getString(Constants.loginId);
  var receiverId = userData.value.sId??'temp';
  var serviceId = userData.value.serviceDetails?.sId??'temp';
  var userId =  Utils.getChatId(senderId, receiverId,serviceId??'temp');

  Get.toNamed(RoutesName.chatScreen,
      arguments: {
        'name': name,
        'serviceId': serviceId,
        'id': userId,
        'senderId': senderId,
        'receiverId': receiverId,
        "receiverName":receiverName,
      });
  // Get.toNamed(RoutesName.chatScreen);
}
}

