// import 'package:flutter/cupertino.dart';
// import 'package:flutter/foundation.dart';
// import 'package:get/get.dart';
// import 'package:serviceprovider/models/all_services_model.dart';
// import '../../respository/home_repository.dart';
// import '../../utils/utils.dart';
//
// class CustomerAllServicesController extends GetxController{
//   RxList<Data> serviceList = <Data>[].obs;
//   final _myRepo = HomeRepository();
//   @override
//   void onReady() {
//     // hitAllServicesList();
//     super.onReady();
//   }
//
//   void hitAllServicesList(){
//     BuildContext? context=Get.context;
//     Utils.showDialogProgressDialog(context!, true);
//     _myRepo.getAllServicesApi().then((value ) {
//       Utils.showDialogProgressDialog(context, false);
//       if (kDebugMode) {
//         print("success getAllServicesApi value :$value");
//       }
//       serviceList.clear();
//       value.data?.forEach((element) {
//         serviceList.add(element);
//       });
//
//     }).onError((error, stackTrace) {
//       Utils.showDialogProgressDialog(context, false);
//       Utils.snackBar('Error', error.toString());
//       if (kDebugMode) {
//         print("error:${error.toString()}");
//       }
//     });
//   }
// }