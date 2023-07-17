import 'package:get/get.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class SpecialtyViewModel extends GetxController {

  RxString speciality = ''.obs;
  RxString subSpeciality = ''.obs;
  void onContinueClick() {
    var speciality = this.speciality.value.trim();
    var subSpeciality = this.subSpeciality.value.trim();
    if (speciality.isNotEmpty) {
      if (subSpeciality.isNotEmpty) {
      Get.offNamed(RoutesName.addServiceFirstScreen);
      // Get.toNamed(RoutesName.addServiceFirstScreen);
      } else {
        Utils.snackBar('Please select SubSpeciality', '');
      }
    } else {
      Utils.snackBar('Please select Speciality', '');
    }
  }

  void onChooseSpecialtyClick() {
    Get.toNamed(RoutesName.chooseSpecialtyScreen);
  }
  void onSubCategoryClick() {
    Get.toNamed(RoutesName.chooseSubCategorySpecialtyScreen);
  }

}
