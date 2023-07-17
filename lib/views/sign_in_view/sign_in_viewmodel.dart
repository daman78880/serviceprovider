import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import '../../respository/auth_repository.dart';
import '../../utils/constants.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class SignInViewModel extends GetMaterialController {
  final _myRepo = AuthRepository();
  TextEditingController numberController = TextEditingController();
  RxString selectedCountryCode = '+1'.obs;

  void onContinueClicked() async{
    BuildContext? context = Get.context;
    bool customerLogin = await SharePref.getBoolean(Constants.loginAsCustomer);
    int userLoginType = customerLogin ? 2 : 1;
    var number=numberController.text.trim();
    if (number.isNotEmpty) {
      if (number.length == 10) {
        if (Constants.apiWorking) {
          Utils.showDialogProgressDialog(context!, true);
          var data = {
            'phoneNo': number.toString(),
            'countryCode': selectedCountryCode.value.toString(),
            'userType': userLoginType.toString()
          };
          _myRepo.loginApi(data).then((value) {
            Utils.showDialogProgressDialog(context, false);
            Get.toNamed(RoutesName.otpScreen,arguments: {'phoneNo':number,'countryCode':selectedCountryCode.value})
                ?.then((value) => Get.delete<SignInViewModel>());
          }).onError((error, stackTrace) {
            Utils.showDialogProgressDialog(context, false);
              Utils.snackBar('Error', error.toString());
            if (kDebugMode) {
              print("error:${error.toString()}");
            }
          });
        } else {
          Get.toNamed(RoutesName.otpScreen,arguments: {'phoneNo':number,'countryCode':selectedCountryCode.value})
              ?.then((value) => Get.delete<SignInViewModel>());
        }
      } else {
        Utils.snackBar('Enter valid number', 'Please enter 10 digit number');
      }
    } else {
      Utils.snackBar('Enter number', 'Please mobile number');
    }

  }
}
