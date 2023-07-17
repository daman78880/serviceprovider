import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../../../models/bank_detail_model.dart';
import '../../../../respository/profile_edit_repository.dart';
import '../../../../utils/utils.dart';

class BankDetailController extends GetxController {
  final _myRepo = ProfileRepository();

  RxList<BankDetailModel> bankList = <BankDetailModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    hitGetBankDetailApi();
  }
  void hitGetBankDetailApi(){
    _myRepo.getBankDetail().then((value) {
      if (kDebugMode) {
        print("success getBank Detail $value");
      }
      bankList.clear();
      for (int i = 0; i < (value.data?.length??0); i++) {
        bankList.add(BankDetailModel(
            bankId: value.data![i].sId.toString(),
            bankName:  value.data![i].bankName.toString(),
            bankNumber: int.parse(value.data![i].accountNo??''),
            ifceCode:value.data![i].ifscCode??'',
            activeBankStatus: value.data![i].status=='deactivate'?false:true,
            lastViewLine: i==value.data!.length-1?true:false));
      }
    }).onError((error, stackTrace) {
        Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

  void onDeleteAccount(int index,String bankId) {
    if (bankList.length >= index) {
      if(bankId.isNotEmpty) {
        BuildContext? context=Get.context;
        Utils.showDialogProgressDialog(context!, true);
        _myRepo.deleteBankDetail(bankId).then((value) {
          Utils.showDialogProgressDialog(context, false);
          if (kDebugMode) {
            print("success getBank Detail $value");
          }
          bankList.removeAt(index);
        }).onError((error, stackTrace) {
          Utils.showDialogProgressDialog(context, false);
            Utils.snackBar('Error', error.toString());
          if (kDebugMode) {
            print("error:${error.toString()}");
          }
        });

      }else{
        Utils.snackBar('Error', 'Bank id empty please try some time later');
      }
    }
  }
  void onEditBankDetailClick(
      {required String bankName, required int accountNumber, required String ifceCode,required String bankId}) {
    if (bankName.isNotEmpty && accountNumber > 0 && ifceCode.isNotEmpty) {
      Get.toNamed(RoutesName.addEditBankDetail, arguments: [bankName, accountNumber, ifceCode,bankId]);
    }
    else {
      Get.snackbar("SomeThing wrong", "Some data missing try some time later");
    }
  }
  void onContinueClicked() {
      Get.toNamed(RoutesName.addEditBankDetail,arguments:[ '',0,'',''])?.then((value) {Get.delete<BankDetailController>();});
  }
}