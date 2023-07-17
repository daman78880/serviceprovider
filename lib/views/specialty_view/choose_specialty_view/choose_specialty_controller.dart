import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../specialty_view_model.dart';


class ChooseSpecialtyController extends GetxController{
  SpecialtyViewModel specialtyViewModel = Get.find<SpecialtyViewModel>();
  RxList<String> specialtyList = <String>[
    "Cleaning",
    'Massage',
    'Architect',
    'Construction',
    'Pet Trainer',
    'Carpenter',
    'Artist',
    'Other Service'
  ].obs;
  RxString selectedSpecialty = ''.obs;

  @override
  void onInit() {
    selectedSpecialty.value=specialtyViewModel.speciality.value;
    super.onInit();
  }
  void changeLanguageSelction(String value) {
  if (value != selectedSpecialty.value) {
    selectedSpecialty.value = value;
    specialtyViewModel.speciality.value=value;
  }
  }
}