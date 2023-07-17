import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class ProfileViewModel extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailNameFocusNode = FocusNode();
  RxList<String> genderList = <String>['Male','Female'].obs;
 RxString hintGender = 'Select Gender'.obs;

  void onContinueClicked() {
        var firstName=firstNameController.text.trim();
        var lastName=lastNameController.text.trim();
        var email=emailNameController.text.trim();
      if (firstName.isNotEmpty) {
        if (lastName.isNotEmpty) {
          if (email.isNotEmpty) {
            if (Utils.isEmail(email)) {
              if(hintGender.value!='Select Gender') {
                var data = {
                  'gender': hintGender.value=='Male'?'1':'2',
                  'firstName': firstName,
                  'lastName': lastName,
                  'email': email
                };
                Get.toNamed(RoutesName.profileSetupSecondScreen, arguments:
                data
                )?.then((value) {
                  Get.delete<ProfileViewModel>();
                });
              }else{
              Utils.snackBar('Gender empty', 'Please select gender');
              }
            } else {
              Utils.snackBar('Email is invalid', 'Please enter valid email');
            }
          } else {
            Utils.snackBar('Email Empty', 'Please provide lastname');
          }
        } else {
          Utils.snackBar('Last Name Empty', 'Please provide lastname');
        }
      } else {
        Utils.snackBar('First Name Empty', 'Please provide firstname');
      }
    }

}
