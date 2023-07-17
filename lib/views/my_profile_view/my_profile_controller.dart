import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/respository/profile_edit_repository.dart';
import 'package:service_provider_two/utils/constants.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/authentication.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';
import '../booking_view/booking_screen_controller.dart';
import '../home_customer_view/home_customer_controller.dart';
import '../home_view/home_controller.dart';

class MyProfileController extends GetxController {
  final _myRepo = ProfileRepository();
  RxList<RxList<String>> options = [
    [SvgAssets.pensil, "Edit Profile"].obs,
    [SvgAssets.bankIcon, "Bank Details"].obs,
    [SvgAssets.reviewIcon, "Reviews"].obs,
    [SvgAssets.languageIcon, "Change Language"].obs,
    [SvgAssets.messageQuestionsIcon, "Help & Support"].obs,
    [SvgAssets.messageQuestionsIcon, "Terms & Conditions"].obs,
    [SvgAssets.messageQuestionsIcon, "Privacy Policies"].obs,
    [SvgAssets.logoutIcon, "Logout"].obs,
  ].obs;
  RxString userName = ''.obs;
  RxString userProfile = ''.obs;
  bool customerLogin = false;

  @override
  void onInit() {
    setupData();
    super.onInit();
  }

  void setupData() async {
    var customerLogin = await SharePref.getBoolean(Constants.loginAsCustomer);
    int userLoginType = customerLogin ? 2 : 1;
    if (userLoginType == 2) {
      this.customerLogin = true;
      options[1].value = [SvgAssets.bankIcon, "Saved Cards"];
    }
    var firstName = await SharePref.getString(Constants.firstName);
    var lastName = await SharePref.getString(Constants.lastName);
    userName.value = '$firstName $lastName';
  }

  void hitProfileUpdateApi(String path, Uint8List? data, String name) {
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.uploadProfileImageApi(path, data, name).then((value) {
      if (value['status'] == 200) {
        Utils.showDialogProgressDialog(context, false);
        getProfilePicApi();
      }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error getting subCategory :$error");
      }
    });
  }

  void pickImage() async {
    try {
      if (kIsWeb) {
        var output = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            'png',
            'jpeg',
            'jpg',
          ],
          allowMultiple: false,
        );
        FilePickerResult? finalOutput = output;
        var importFile = finalOutput!.files[0];
        var fileName = importFile.name;
        var fileType = '';
        if (fileName.contains(".png")) {
          fileType = "png";
        } else if (fileName.contains(".jpeg")) {
          fileType = "jpeg";
        } else if (fileName.contains(".jpg")) {
          fileType = "jpg";
        }
        PlatformFile platformFile = importFile;
        onAddImage(null, platformFile.bytes, platformFile.name);
      } else {
        var result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            'png',
            'jpeg',
            'jpg',
          ],
          allowMultiple: false,
        );
        if (result != null) {
          File file = File(result.files.single.path ?? '');
          onAddImage(file, null, '');
        } else {
          // User canceled the picker
        }
      }
    } catch (e) {
      print('inside printing image picker errro $e');
    }
  }

  void onAddImage(File? file, Uint8List? data, String name) async {
    hitProfileUpdateApi(file?.path ?? '', data, name);
  }

  void onMenuClick(int index) {
    switch (index) {
      case 0:
        Get.toNamed(RoutesName.editProfileScreen);
        break;
      case 1:
        if (customerLogin) {
          Get.toNamed(RoutesName.savedCardScreen);
        } else {
          Utils.snackBar('Service not available', 'This service is not in use this time.');
          // Get.toNamed(RoutesName.bankDetailScreen);
        }
        break;
      case 2:
        Get.toNamed(RoutesName.ratingReview);
        break;
      case 3:
        Get.toNamed(RoutesName.changeLanguage);

        break;
      case 4:
        Get.toNamed(RoutesName.helpSupport);
        break;
      case 5:
        Get.toNamed(RoutesName.termCondition);
        break;
      case 6:
        Get.toNamed(RoutesName.privacyPolicy);
        break;
      case 7:
        showLogoutDialog();
        break;
      default:
        Get.snackbar("Service not available", 'Try some time later');
    }
  }

  void showLogoutDialog() {
    BuildContext? context = Get.context;
    showDialog(
      context: context!,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const LoadSvg(svgPath: SvgAssets.warningIcon),
              TextBoldUrbanist(
                txt: 'Are you sure you want to Logout?',
                textAlign: TextAlign.center,
                fontWeight: AppFonts.urbanistMediumWeight,
                textSize: ConstantSize.commonMediumTxtSize,
                txtColor: AppColor.viewLineColor,
              ),
            ],
          ),
          actions: [
            Column(
              children: [
                RoundButton(
                  title: 'Logout',
                  onPress: () async{
                    var id=await SharePref.getString(Constants.loginId);
                    Authentication.unSubscribeTopic('user_$id');
                    Get.offAllNamed(RoutesName.welcomeAsScreen)?.then((value) {
                      Get.delete<HomeCustomerController>(force: true);
                      Get.delete<HomeController>(force: true);
                      Get.delete<BookingScreenController>(force: true);
                    });
                  },
                ),
                RoundButton(
                  buttonColor: AppColor.whiteColor,
                  textColor: AppColor.viewLineColor,
                  title: 'Cancel',
                  onPress: () => Get.back(),
                ),
              ],
            )
          ],
          actionsPadding:
              const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 15),
          contentPadding:
              const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 15),
        );
      },
    );
  }

  void getProfilePicApi() {
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.getProfilePicApi().then((value) {
      if (value['status'] == 200) {
        var profileImage = value['data'];
        if (kDebugMode) {
          print('profile pic From server is $profileImage');
        }
        var url =
            'https://media.istockphoto.com/id/1454818631/photo/a-woman-responding-to-a-customer-at-a-call-center.jpg?s=1024x1024&w=is&k=20&c=ivHAoB9qiun9vkPuynXn11bsW2amKVzEqjaFNq71hLY=';
        SharePref.setString(Constants.userProfileImage, url);
        userProfile.value = url;
      }
      Utils.showDialogProgressDialog(context, false);
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error getting subCategory :$error");
      }
    });
  }
}
