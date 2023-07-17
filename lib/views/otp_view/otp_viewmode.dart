import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/authentication.dart';
import 'package:service_provider_two/utils/constants.dart';
import '../../respository/auth_repository.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';

class OtpViewModel extends GetxController {
  final _myRepo = AuthRepository();
  final pinController = TextEditingController();
  final errorPinController = TextEditingController();
  late Timer _timer;
  RxInt start = 60.obs;
  @override
  void onInit() {
    startTimer();
    super.onInit();
  }

  void onSubmitClicked() async{

    // SharePref.setBools(Constants.loginAsCustomer,false);
    // SharePref.setBools(Constants.homeLogin,true);
    // Get.offAllNamed(RoutesName.homeScreen)
    String phoneNumber=Get.arguments['phoneNo'];
    String countryCode=Get.arguments['countryCode'];
    bool customerLogin = await SharePref.getBoolean(Constants.loginAsCustomer);
    int userLoginType = customerLogin ? 2 : 1;

    if (pinController.text.length == 6) {
      var data = {
        'phoneNo':phoneNumber,
        'countryCode': countryCode,
        'userType': userLoginType.toString(),
        'otp': pinController.text
      };
      if (Constants.apiWorking) {
        BuildContext? context = Get.context;
        Utils.showDialogProgressDialog(context!, true);
        _myRepo.loginWithOtpApi(data).then((value ) {
          Utils.showDialogProgressDialog(context, false);
          if (kDebugMode) {
            print("success login token ${value.data?.token}:Name${value.data?.firstName} and id ${value.data?.sId}");
          }
          SharePref.setString(Constants.token,'Bearer ${value.data?.token??''}');
          SharePref.setString(Constants.loginId,value.data?.sId??'');
          print('loginiddddddddddddddddddddddd ${value.data?.token}');

          // 1 for provider , 2 for customer
          if(value.data?.userType!=null && value.data?.userType=='1'){
            if(value.data?.isProfileStatus??false){
              SharePref.setBools(Constants.loginAsCustomer,false);
              SharePref.setBools(Constants.homeLogin,true);
              String gender=value.data?.gender??'1';
              Utils.saveUserProfileData(value.data?.firstName, value.data?.lastName, value.data?.email, gender=="1"?'Male':'Female', value.data?.address,value.data?.location?.coordinates?[0]??0,value.data?.location?.coordinates?[1]??0);
              Authentication.subscribeTopic(value.data?.sId??'');
              Get.offAllNamed(RoutesName.homeScreen)?.then((valuee) async {
                Get.delete<OtpViewModel>();
              });
            }else{
              Get.offNamed(RoutesName.profileSetupScreen)?.then((value) async {
                Get.delete<OtpViewModel>();
              });
            }
          }
          else{
            if(value.data?.isProfileStatus??false){
              SharePref.setBools(Constants.loginAsCustomer,true);
              SharePref.setBools(Constants.homeLogin,true);
              String gender=value.data?.gender??'1';
              SharePref.setString(Constants.loginId,value.data?.sId??'');
              print('loginiddddddddddddddddddddddd ${value.data?.sId}');
              Utils.saveUserProfileData(value.data?.firstName, value.data?.lastName, value.data?.email, gender=="1"?'Male':'Female', value.data?.address,value.data?.location?.coordinates?[0]??0,value.data?.location?.coordinates?[1]??0);
              Authentication.subscribeTopic(value.data?.sId??'');
              Get.offAllNamed(RoutesName.homeCustomerScreen)?.then((valuee) async {
                Get.delete<OtpViewModel>();
              });
            }else{
              Get.offNamed(RoutesName.profileSetupScreen)?.then((value) async {
                Get.delete<OtpViewModel>();
              });
            }
          }

        }).onError((error, stackTrace) {
          Utils.showDialogProgressDialog(context, false);
            Utils.snackBar('Error', error.toString());
          if (kDebugMode) {
            print("error:${error.toString()}");
          }
        });
      } else {
        // 6499764e8a08c1dcbcbe5fca
        SharePref.setString(Constants.firstName, 'Damanpreet');
        SharePref.setString(Constants.lastName,'Singh');
        SharePref.setString(Constants.loginId,'6499764e8a08c1dcbcbe5fca');
        Get.offNamed(RoutesName.homeScreen)?.then((value) async {
          await SharePref.setString(Constants.token, "Token mil gea");
          SharePref.setString(Constants.loginId,value.data?.sId??'');
          Get.delete<OtpViewModel>();
        });
      }
    } else {
      Utils.snackBar('Enter otp', 'Please enter otp number');
    }
  }
  void onResendClick(){
    if(start.value==0){
      start.value=60;
      startTimer();
    }
  }
  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
            timer.cancel();
        } else {
            start.value--;
        }
      },
    );
  }
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

}