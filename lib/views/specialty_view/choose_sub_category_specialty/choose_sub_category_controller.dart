import 'package:get/get.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../specialty_view_model.dart';


class ChooseSubCategoryController extends GetxController{
  SpecialtyViewModel specialtyViewModel = Get.find<SpecialtyViewModel>();

  RxList<String> subCategoryList = <String>[
    "House Cleaning",
    'Apartment Cleaning',
    'Commercial cleaning',
    'Dry cleaning',
    'Window cleaner',
    'Restroom cleaning',
    'Green cleaning',
    'Other Service'
  ].obs;
  RxString selectedSubCategory = ''.obs;
  @override
  void onInit() {
    selectedSubCategory.value=specialtyViewModel.subSpeciality.value;
    super.onInit();
  }
  void changeSubCategorySelection(String value) {
  if (value != selectedSubCategory.value) {
    selectedSubCategory.value = value;
    specialtyViewModel.subSpeciality.value=value;
  }
  }
  void onEditClick(){
    print('clicked');
    Get.offNamed(RoutesName.chooseSpecialtyScreen);
  }

}