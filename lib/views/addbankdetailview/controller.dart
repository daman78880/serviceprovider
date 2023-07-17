import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class ControllerBank extends GetxController {
  TextEditingController accountNoController = TextEditingController();
  TextEditingController confirmAccountNoController = TextEditingController();
  TextEditingController ifscCodeController = TextEditingController();
  FocusNode accountNoFocusNode = FocusNode();
  FocusNode confirmAccountNoFocusNode = FocusNode();
  FocusNode ifscCodeFocusNode = FocusNode();
  RxString selectedBank = 'Bank Name'.obs;
  void onContinueClicked() {
    String accountNumber = accountNoController.text.trim();
    String confirmAccountNumber = confirmAccountNoController.text.trim();
    String ifscCode = ifscCodeController.text.trim();
    String bank=selectedBank.value;
    if (bank.isNotEmpty && bank != 'Bank Name') {
      if (accountNumber.isNotEmpty) {
        if (accountNumber.length >= 8){
          if (confirmAccountNumber.isNotEmpty) {
            if (accountNumber == confirmAccountNumber) {
              if (ifscCode.isNotEmpty) {
                Get.offNamed(RoutesName.reviewServiceScreen, arguments: {'showActionTitle': false,"selectedIndex":-1});
              } else {
                Utils.snackBar('Please Enter IfscCode', 'Ifsc code is empty');
              }
            } else {
              Utils.snackBar('Account number not matched',
                  'Account number and ConfirmAccount not matched');
            }
          } else {
            Utils.snackBar('Please Enter ConfirmAccount number',
                'ConfirmAccount number is empty');
          }
        }else{
          Utils.snackBar('Invalid account number',
              'Please enter Minimum 8 digit account number.');
        }

      } else {
        Utils.snackBar(
            'Please Enter Account number', 'Account number is empty');
      }
    } else {
      // Utils.snackBar('Select Bank', 'Bank name not selected');
      Get.offNamed(RoutesName.reviewServiceScreen, arguments: {'showActionTitle': false,"selectedIndex":-1});
    }
  }
}
