import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/models/sub_category_provider_list_model.dart';
import '../../../respository/home_repository.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class OnClickServiceController extends GetxController{
  final _myRepo = HomeRepository();
  String subCategoryId='';
  @override
  void onInit() {
    subCategoryId=Get.arguments[0]??'';
    print('subCategory :$subCategoryId');
    super.onInit();
  }
  @override
  void onReady() {
    hitSubCategoryProviderApi();
    super.onReady();
  }

  // RxList<String> serviceList=["House Shifting","House Cleaning","House Shifting","House Cleaning","House Shifting","House Cleaning"].obs;
  RxList<Data> subCategoryList = <Data>[].obs;

  void cleanResource(){
    Get.delete<OnClickServiceController>(force: true);
    Get.back();
  }
  void hitSubCategoryProviderApi(){
    if(subCategoryId.isNotEmpty) {
      BuildContext? context = Get.context;
      Utils.showDialogProgressDialog(context!, true);
      _myRepo.getListAllSubCategoryProviderApi(subCategoryId).then((value) {
        Utils.showDialogProgressDialog(context, false);
        if (kDebugMode) {
          print("success getAllServicesApi value :$value");
        }
        value.data?.forEach((element) {
          subCategoryList.add(element);
        });
      }).onError((error, stackTrace) {
        Utils.showDialogProgressDialog(context, false);
        Utils.snackBar('Error', error.toString());
        if (kDebugMode) {
          print("error:${error.toString()}");
        }
      });
    }else{
      Utils.snackBar('subCategoryId is empty', 'Please go back and come back.');
    }
  }
  void onServiceClick(int index){
    Get.toNamed(RoutesName.serviceDetailCustomer,arguments: [index]);
  }
}