import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class ServiceFirstViewModel extends GetxController {

  TextEditingController serviceNameController = TextEditingController();
  TextEditingController totalExperienceController = TextEditingController();
  TextEditingController chargePerServiceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode serviceNameFocusNode = FocusNode();
  FocusNode totalExperienceFocusNode = FocusNode();
  FocusNode chargePerServiceFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();
  RxDouble valueRange = 10.0.obs;

  void onContinueClicked() {
    String serviceName=serviceNameController.text.trim();
    String totalExperience=totalExperienceController.text.trim();
    String chargePerService=chargePerServiceController.text.trim();
    String description=descriptionController.text.trim();
    if (serviceName.isNotEmpty) {
      if (totalExperience.isNotEmpty) {
        if (chargePerService.isNotEmpty) {
          if (description.isNotEmpty) {
            // Get.toNamed(RoutesName.addServiceSecondScreen);
            Get.offNamed(RoutesName.addServiceSecondScreen);
          }else {
            Utils.snackBar('Description Empty','Please enter Description field.');
          }
        } else {
          Utils.snackBar('ChargePer Service Empty','Please enter Charge per service field.');
        }
      } else {
        Utils.snackBar('Total Experience Empty','Please enter Total Experience field.');
      }
    } else {
      Utils.snackBar('Service Name Empty','Please enter Service field.');
    }
  }
}
