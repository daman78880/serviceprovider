import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../models/search_result_model.dart';
import '../../respository/home_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../utils/utils.dart';


class SearchBarCustomerController extends GetxController{
  final _myRepo = HomeRepository();
  final txtController = TextEditingController();

  RxList<String> recentSearchList=["House Shifting","House Cleaning","House Shifting","House Cleaning","House Shifting","House Cleaning"].obs;
  RxInt displayStatus=0.obs;
  TextEditingController searchTxtContoller =TextEditingController();
  RxString searchTxt=''.obs;
  RxList<Data> searchResultList = <Data>[].obs;
@override
  void onInit() {
    super.onInit();
    // displayStatus.value=Random().nextInt(3) ;
    print('display status is $displayStatus');
  }

  onTextChange()async{
  if(txtController.text.trim().isNotEmpty) {
    searchTxt=txtController.text.trim().obs;
    _myRepo.searchResultApi(txtController.text.trim()).then((value) {
      if (kDebugMode) {
        print("success servieActiveOrDeactiveClick put");
      }
      if(value.data?.isNotEmpty==true){
        displayStatus.value=2;
      }else{
        displayStatus.value=1;
      }
      searchResultList.clear();
      value.data?.forEach((element) {
        searchResultList.add(element);
      });

    }).onError((error, stackTrace) {
      Utils.snackBar('Error', error.toString());
      print('serviceActiveDeActive called error');
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }else{
    searchResultList.clear();
    displayStatus.value=0;
  }
  }
}