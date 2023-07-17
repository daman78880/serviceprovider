import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../models/all_sub_category_model.dart';
import '../../../res/assets/image_assets.dart';
import '../../../respository/home_repository.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class SubCategoryController  extends GetxController{
  RxList<String> searchList=[ImageAssets.demoImageSecond,ImageAssets.demoImageSecond,ImageAssets.demoImageSecond,ImageAssets.demoImageSecond,ImageAssets.demoImageSecond,ImageAssets.demoImageSecond,ImageAssets.demoImageSecond,ImageAssets.demoImageSecond].obs;
  RxList<Data> subCategoryList=<Data>[].obs;
  final _myRepo = HomeRepository();
  String categoryId='';
  @override
  void onInit() {
    categoryId=Get.arguments[0]??'';
    super.onInit();
  }
  @override
  void onReady() {
    onGetAllSubCategoryApi();
    super.onReady();
  }
  void onGetAllSubCategoryApi(){
    BuildContext? context=Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.getAllSubCategoryApi(categoryId).then((value ) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("success getAllServicesApi value :$value");
      }
      value.data?.forEach((element) {subCategoryList.add(element);});
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
  void onClickCategoryItem(String categoryId){
    // print('clicked id is ${categoryId}');
    Get.toNamed(RoutesName.onClickCustomerService,arguments: [categoryId]);

  }
}