import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:service_provider_two/utils/authentication.dart';
import 'package:service_provider_two/utils/constants.dart';
import '../../respository/auth_repository.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';

class WelcomeViewModel extends GetxController {
  final _myRepo = AuthRepository();

  void onFacebookLoginClick() {
    // hitSocialMediaApi(user.uid,2);
  }

  void onGoogleLoginClick() async {
    User? user = await Authentication.signInWithGoogle();
    bool customerLogin =
    await SharePref.getBoolean(Constants.loginAsCustomer);
    int userLoginType = customerLogin ? 2 : 1;
    if (Constants.apiWorking) {
      if (user != null && user.uid.isNotEmpty) {
        hitSocialMediaApi(user.uid, 1, user.email ?? '',userLoginType);
      }else{
     {
          if (userLoginType==1) {
            Get.offNamed(RoutesName.homeScreen)?.then((valuee) async {
              Get.delete<WelcomeViewModel>();
            });
          } else {
            Get.offNamed(RoutesName.homeCustomerScreen)?.then((value) async {
              Get.delete<WelcomeViewModel>();
            });
          }
        }
        Utils.snackBar('Error', 'Something Error try some time later');
      }
    } else {

    }
    print('inside userLogin viewModel $user');
  }

  void hitSocialMediaApi(String uid, int socialMediaType, String email,int userLoginType) async {
      BuildContext? context = Get.context;
      Utils.showDialogProgressDialog(context!, true);


      var data = {
        'email': email,
        'socialMediaType': socialMediaType.toString(),
        'googleId': uid,
        'userType': userLoginType.toString()
      };
      print('api hinting start $data');
      _myRepo.socialMediaLogin(data).then((value) async {
        Utils.showDialogProgressDialog(context, false);
        await SharePref.setString(Constants.token, 'Bearer ${value.data?.token ?? ''}');
        SharePref.setString(Constants.loginId,value.data?.sId??'');

        if (value.data?.userType != null && value.data?.userType == '1') {
          if (value.data?.stages != null &&
              value.data?.stages!.isNotEmpty == true) {
            if (value.data?.stages == '1') {
              Get.offNamed(RoutesName.specialtyScreen)?.then((valuee) async {
                Get.delete<WelcomeViewModel>();
              });
            } else if (value.data?.stages == '2') {
              Get.offNamed(RoutesName.addServiceFirstScreen)
                  ?.then((valuee) async {
                Get.delete<WelcomeViewModel>();
              });
            } else if (value.data?.stages == '3') {
              Get.offNamed(RoutesName.addServiceSecondScreen)
                  ?.then((valuee) async {
                Get.delete<WelcomeViewModel>();
              });
            } else if (value.data?.stages == '4') {
              Get.offNamed(RoutesName.uploadImageScreen)?.then((valuee) async {
                Get.delete<WelcomeViewModel>();
              });
            } else if (value.data?.stages == '5') {
              Get.offNamed(RoutesName.addBankDetailScreen)
                  ?.then((valuee) async {
                Get.delete<WelcomeViewModel>();
              });
            } else if (value.data?.stages == '6') {
              Get.offNamed(RoutesName.reviewServiceScreen, arguments: {
                'showActionTitle': false,
              })
                  ?.then((valuee) async {
                Get.delete<WelcomeViewModel>();
              });
            } else {
              Get.offNamed(RoutesName.homeScreen)?.then((valuee) async {
                await SharePref.setString(
                    Constants.token, value.data?.token ?? '');
                Get.delete<WelcomeViewModel>();
              });
            }
          } else {
            Get.offNamed(RoutesName.profileSetupScreen)?.then((value) async {
              Get.delete<WelcomeViewModel>();
            });
          }
        } else {
          if (value.data?.stages != null &&
              value.data?.stages!.isNotEmpty == true) {
            Get.offNamed(RoutesName.homeScreen)?.then((valuee) async {
              Get.delete<WelcomeViewModel>();
            });
          } else {
            Get.offNamed(RoutesName.profileSetupScreen)?.then((value) async {
              Get.delete<WelcomeViewModel>();
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

  }

  void onAppleIdLoginClick() {}

  void onSignInClick() {
    Get.toNamed(RoutesName.signInScreen, arguments: {'fromSignUp': false})
        ?.then((value) => Get.delete<WelcomeViewModel>());
  }

  void onSignUpClick() {
    Get.toNamed(RoutesName.signInScreen, arguments: {'fromSignUp': true})
        ?.then((value) {
      Get.delete<WelcomeViewModel>();
    });
  }
}
