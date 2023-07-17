import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class SelectedServiceDetailDateController extends GetxController {
  RxString startTime = 'Set Time'.obs;
  RxString selectedDatee = ''.obs;


  void onClickContinue(String selectedDate) {
    if (selectedDate.isEmpty) {
      var format = DateFormat("yyyy-MM-dd");
      selectedDate= format.format(DateTime.now()).toString();
    };
    selectedDatee.value=selectedDate;
    if (startTime.value != 'Set Time') {
          Get.offNamed(RoutesName.addLocationServiceScreen);
    } else {
      Utils.snackBar('Time Empty', 'Please select time.');
    }
  }
}
