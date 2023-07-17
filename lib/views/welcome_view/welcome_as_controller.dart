import 'package:get/get.dart';
import 'package:service_provider_two/utils/constants.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/utils/share_pref.dart';

class WelcomeAsController extends GetxController{
  void loginAsCustomer(){
    SharePref.setBools(Constants.loginAsCustomer, true);
    Get.toNamed(RoutesName.welcomeScreen)?.then((value) =>     Get.delete<WelcomeAsController>());
  }
  void loginAsProvider(){
    SharePref.setBools(Constants.loginAsCustomer, false);
    Get.toNamed(RoutesName.welcomeScreen)?.then((value) =>     Get.delete<WelcomeAsController>());
  }
}