import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../../respository/profile_edit_repository.dart';
import '../../../../utils/constants.dart';
import '../../../../utils/utils.dart';
import '../bank_detail/bank_detail_controller.dart';

class AddEditBankDetailController extends GetxController {
  BankDetailController bankDetailController = Get.find<BankDetailController>();
  final _repo=ProfileRepository();

  RxString selectedBank = 'Bank Name'.obs;
  bool addBank=true;
  TextEditingController accountNoController = TextEditingController();
  TextEditingController confirmNoController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  FocusNode bankNameFocusNode = FocusNode();
  FocusNode accountNoFocusNode = FocusNode();
  FocusNode confirmNoFocusNode = FocusNode();
  FocusNode ifscCodeFocusNode = FocusNode();
  String bankId = '';
  String buttonTxt='';
  String appBarTitle='';
  @override
  void onInit() {
    var bankName=Get.arguments[0]??'';
   var  accountNumber=Get.arguments[1]??0;
   var ifceCode=Get.arguments[2]??'';
    if(bankName.isNotEmpty && accountNumber>0 && ifceCode.isNotEmpty){
      appBarTitle='Edit Bank Detail';
      selectedBank.value=bankName;
      accountNoController.text=accountNumber.toString();
      confirmNoController.text=accountNumber.toString();
      ifscCodeController.text=ifceCode.toString();
      buttonTxt='Save Changes';
    }
    else{
      addBank=true;
      buttonTxt='Done';
      appBarTitle='Add Bank Detail';
    }
    bankId=Get.arguments[3]??'';
    if (kDebugMode) {
      print('bank is is ${Get.arguments[3]??''}');
    }
    super.onInit();
  }

  void onContinueClicked() {
    String accountNo=accountNoController.text.trim();
    String confirmNo=confirmNoController.text.trim();
    String ifscCode=ifscCodeController.text.trim();
    BuildContext? context = Get.context;
    if(selectedBank!='Bank Name'){
    if(accountNo.isNotEmpty) {
      if (accountNo.length >= 8){
      if (confirmNo.isNotEmpty) {
        if (accountNo == confirmNo) {
          if (ifscCode.isNotEmpty) {
            var data = {
              "bankName": selectedBank.value,
              "accountNo": accountNo,
              "ifscCode": ifscCode,
            };

            if (Constants.apiWorking) {
              if (addBank) {
                data.addAll({"confirmAccountNo": confirmNo,  "stages": '7',});
                Utils.showDialogProgressDialog(context!, true);
                _repo.createBankDetail(data).then((value) {
                  if (kDebugMode) {
                    print("success createBankDetail");
                  }
                  bankDetailController.hitGetBankDetailApi();
                  Utils.showDialogProgressDialog(context, false);
                  changeUserProfileSetup();
                  Get.back();
                }).onError((error, stackTrace) {
                  Utils.showDialogProgressDialog(context, false);
                    Utils.snackBar('Error', error.toString());
                  if (kDebugMode) {
                    print("error:${error.toString()}");
                  }
                });
              }
              else {
                if (bankId.isNotEmpty) {
                  data.addAll({"bankId": bankId});
                  Utils.showDialogProgressDialog(context!, true);
                  _repo.editBankDetailApi(data).then((value) {
                    bankDetailController.hitGetBankDetailApi();
                    Utils.showDialogProgressDialog(context, false);
                    if (kDebugMode) {
                      print("success getBank Detail $value");
                    }
                    Get.back();
                  }).onError((error, stackTrace) {
                    Utils.showDialogProgressDialog(context, false);
                      Utils.snackBar('Error', error.toString());
                    if (kDebugMode) {
                      print("error:${error.toString()}");
                    }
                  });
                } else {
                  Utils.snackBar(
                      'Bank Id Empty', 'Please go back and come again.');
                }
              }
            } else {
              Get.back();
              Get.delete<AddEditBankDetailController>();
            }
          } else {
            Utils.snackBar('IFSC Code Empty', 'Please enter IFSC code filed.');
          }
        } else {
          Utils.snackBar('Account Not Match',
              'Please enter account number and confirm no. same.');
        }
      }
      else {
        Utils.snackBar('Confirm Account No. Empty',
            'Please enter confirm account no. filed.');
      }
    }else{
      Utils.snackBar('Invalid account number',
          'Please enter Minimum 8 digit account number.');
    }
    }else{
      Utils.snackBar('Account No. Empty', 'Please enter account no. filed.');
    }
    }else{
      Utils.snackBar('UnSelected Bank', 'Please select bank filed.');
    }

  }
  void changeUserProfileSetup(){
    var data = {
      "stages": '7',
    };
    _repo.ediProfileUpdateApi(data).then((value) {
      if (kDebugMode) {
        print("change stage success");
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print("change stage error:${error.toString()}");
      }
    });
  }
}
