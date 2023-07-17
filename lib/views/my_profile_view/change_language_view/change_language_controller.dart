import 'package:get/get.dart';
import '../../../../utils/constants.dart';

class ChangeLanguageController extends GetxController {
  RxList<String> languageList = <String>[
    'English - EN',
    'Estonia',
    'Arabic',
    'Aramaic',
    'Azeri',
    'Hebrew',
    'Persian'
  ].obs;
  RxString selectedLanguage = 'English - EN'.obs;

  void changeLanguageSelection(String value) {
    if (value != selectedLanguage.value) {
      selectedLanguage.value = value;
    }
  }


  void onContinueClicked() {
    if (Constants.apiWorking) {
    } else {
      Get.back();
      Get.delete<ChangeLanguageController>();
    }
  }
}
