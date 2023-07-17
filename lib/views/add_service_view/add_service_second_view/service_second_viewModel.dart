/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../respository/add_service_repository.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class ServiceSecondViewModel extends GetxController {
  final _myRepo = AddServiceRepository();

  RxBool checkBoxSelected = false.obs;
  RxList<String> dayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ].obs;
  RxList<String> selectedDays = <String>[].obs;
  RxInt selectedDayIndex = RxInt(0);
  RxString hintSelectedValue = ''.obs;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  Map<String, List<RxString>> dataList = {};
  String serviceId = '';

  @override
  void onInit() {
    getServiceIdApi();
    super.onInit();
  }
  void getServiceIdApi(){
    _myRepo.getServiceIdApi().then((value) {
      serviceId=value.data?[value.data!.length-1].sId??'';
      if (kDebugMode) {
        print("new sub category Id get i : $serviceId");
      }
    }).onError((error, stackTrace) {
        Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error getting subCategory :$error");
      }
    });
  }

  void preferTimingStatusChange() {
    if (checkBoxSelected.value == true) {
      String startTimeTemp = '';
      String endTimeTemp = '';
      for (int i = 0; i < selectedDays.length; i++) {
        List<RxString> list = dataList[selectedDays[i]] as List<RxString>;
        if (startTimeTemp.isNotEmpty && endTimeTemp.isNotEmpty) {
          if (startTimeTemp.isNotEmpty) {
            list[0].value = startTimeTemp;
          }
          if (endTimeTemp.isNotEmpty) {
            list[1].value = endTimeTemp;
          }
        } else {
          startTimeTemp = list[0].value;
          endTimeTemp = list[1].value;
        }
      }
    }
  }

  void setStartTime(String value) {
    List<RxString> list = dataList[hintSelectedValue.value] as List<RxString>;
    list[0].value = value;
  }

  void setEndTime(String value) {
    List<RxString> list = dataList[hintSelectedValue.value] as List<RxString>;
    list[1].value = value;
  }

  String getStartTimeValue() {
    var returnValue = 'Start Time';
    List<RxString>? list = dataList[hintSelectedValue.value];
    if (list?[0].value != null) {
      if (list![0].value == '') {
        returnValue = 'Start Time';
      } else {
        returnValue = Utils.fomateTwelveHourTime(list[0].value);
      }
    }
    return returnValue;
  }

  String getEndTimeValue() {
    var returnValue = 'End Time';
    List<RxString>? list = dataList[hintSelectedValue.value];
    if (list?[1].value != null) {
      if (list![1].value == '') {
        returnValue = 'End Time';
      } else {
        returnValue = Utils.fomateTwelveHourTime(list[1].value);
      }
    }
    return returnValue;
  }

  void changeIndexDropDown(String value) {
    for (int i = 0; i < selectedDays.length; i++) {
      if (selectedDays[i] == value) {
        selectedDayIndex.value = i;
        break;
      }
    }
  }

  void onDaySelect(String value) {
    if (selectedDays.contains(value)) {
      selectedDays.remove(value);
      dataList.remove(value);
    }
    else {
      if (selectedDays.isEmpty) {
        hintSelectedValue.value = value;
      }
      selectedDays.add(value);
      dataList[value] = [''.obs, ''.obs];
    }
    if (selectedDays.isEmpty) {
      hintSelectedValue.value = 'Select Day';
    }
  }

  void onContinueClicked() {
    preferTimingStatusChange();
    var status = true;
    for (int i = 0; i < selectedDays.length; i++) {
      List<RxString> value = dataList[selectedDays[i]] as List<RxString>;
      if (value[0].value.isEmpty) {
        Utils.snackBar('${selectedDays[i]} Start time empty', 'Please enter Start time of Monday');
        status = false;
        break;
      } else {
        if (value[1].value.isEmpty) {
          Utils.snackBar('${selectedDays[i]} End time empty',
              'Please enter End time of Monday');
          status = false;
          break;
        }
      }
    }
    if (status) {
      int count = 0;
      BuildContext? context = Get.context;
      if (selectedDays.isNotEmpty) {
        if (startTime.isNotEmpty) {
          if (endTime.isNotEmpty) {
            if (serviceId.isNotEmpty) {
              if (Constants.apiWorking) {
                Utils.showDialogProgressDialog(context!, true);
                for (int i = 0; i < selectedDays.length; i++) {
                  List<RxString> value = dataList[selectedDays[i]] as List<
                      RxString>;
                  String day = Utils.dayToNumber(selectedDays[i]);
                  String startTime = value[0].value;
                  String endTime = value[1].value;

                  var data = {
                    "serviceId": serviceId,
                    "availability":day,
                    "startTime": startTime,
                    "endTime": endTime
                  };
                  _myRepo.addServiceSecondApi(data).then((value) {

                    if (kDebugMode) {
                      print("success create speciality");
                    }
                    count++;
                    if (count == selectedDays.length) {
                      Utils.showDialogProgressDialog(context, false);
                      Get.offNamed(RoutesName.uploadImageScreen)?.then((value) => Get.delete<ServiceSecondViewModel>());
                    }
                  }).onError((error, stackTrace) {
                    Utils.showDialogProgressDialog(context, false);
                      Utils.snackBar('Error', error.toString());
                    if (kDebugMode) {
                      print("error:${error.toString()}");
                    }
                  });
                }
              } else {
                Get.offNamed(RoutesName.uploadImageScreen)?.then((value) => Get.delete<ServiceSecondViewModel>());
              }
            } else {
              Utils.snackBar('Service Id empty', 'Go back and come again');
            }
          } else {
            Utils.snackBar('Please Select EndTime', '');
          }
        } else {
          Utils.snackBar('Please Select StartTime', '');
        }
      } else {
        Utils.snackBar('Please select available days', '');
      }
    }else{
      if (kDebugMode) {
        print("consition else statas false");
      }
    }
  }


}*/



import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';

class ServiceSecondViewModel extends GetxController {

  RxBool checkBoxSelected = false.obs;
  RxList<String> dayList = [
    "Monday",
    "Tuesday",
    "Wednesday",
    "Thursday",
    "Friday",
    "Saturday",
    "Sunday"
  ].obs;
  RxList<String> selectedDays = <String>[].obs;
  RxInt selectedDayIndex = RxInt(0);
  RxString hintSelectedValue = ''.obs;
  RxString startTime = ''.obs;
  RxString endTime = ''.obs;
  Map<String, List<RxString>> dataList = {};




  /*void onContinueClicked() {
    preferTimingStatusChange();
    var status = true;
    for (int i = 0; i < selectedDays.length; i++) {
      List<RxString> value = dataList[selectedDays[i]] as List<RxString>;
      if (value[0].value.isEmpty) {
        Utils.snackBar('${selectedDays[i]} Start time empty', 'Please enter Start time of Monday');
        status = false;
        break;
      } else {
        if (value[1].value.isEmpty) {
          Utils.snackBar('${selectedDays[i]} End time empty',
              'Please enter End time of Monday');
          status = false;
          break;
        }
      }
    }
    if (status) {
      int count = 0;
      BuildContext? context = Get.context;
      if (selectedDays.isNotEmpty) {
        if (startTime.isNotEmpty) {
          if (endTime.isNotEmpty) {
            if (serviceId.isNotEmpty) {
              if (Constants.apiWorking) {
                Utils.showDialogProgressDialog(context!, true);
                for (int i = 0; i < selectedDays.length; i++) {
                  List<RxString> value = dataList[selectedDays[i]] as List<
                      RxString>;
                  String day = Utils.dayToNumber(selectedDays[i]);
                  String startTime = value[0].value;
                  String endTime = value[1].value;

                  var data = {
                    "serviceId": serviceId,
                    "availability":day,
                    "startTime": startTime,
                    "endTime": endTime
                  };
                  _myRepo.addServiceSecondApi(data).then((value) {

                    if (kDebugMode) {
                      print("success create speciality");
                    }
                    count++;
                    if (count == selectedDays.length) {
                      Utils.showDialogProgressDialog(context, false);
                      Get.offNamed(RoutesName.uploadImageScreen)?.then((value) => Get.delete<ServiceSecondViewModel>());
                    }
                  }).onError((error, stackTrace) {
                    Utils.showDialogProgressDialog(context, false);
                    Utils.snackBar('Error', error.toString());
                    if (kDebugMode) {
                      print("error:${error.toString()}");
                    }
                  });
                }
              } else {
                Get.offNamed(RoutesName.uploadImageScreen)?.then((value) => Get.delete<ServiceSecondViewModel>());
              }
            } else {
              Utils.snackBar('Service Id empty', 'Go back and come again');
            }
          } else {
            Utils.snackBar('Please Select EndTime', '');
          }
        } else {
          Utils.snackBar('Please Select StartTime', '');
        }
      } else {
        Utils.snackBar('Please select available days', '');
      }
    }else{
      if (kDebugMode) {
        print("consition else statas false");
      }
    }
  }*/
  void onContinueClicked() {
    preferTimingStatusChange();
    var status = true;
    for (int i = 0; i < selectedDays.length; i++) {
      List<RxString> value = dataList[selectedDays[i]] as List<RxString>;
      if (value[0].value.isEmpty) {
        Utils.snackBar('${selectedDays[i]} Start time empty', 'Please enter Start time of Monday');
        status = false;
        break;
      } else {
        if (value[1].value.isEmpty) {
          Utils.snackBar('${selectedDays[i]} End time empty',
              'Please enter End time of Monday');
          status = false;
          break;
        }
      }
    }
    if (status) {
      if (selectedDays.isNotEmpty) {
        if (startTime.isNotEmpty) {
          if (endTime.isNotEmpty) {
              Get.offNamed(RoutesName.uploadImageScreen);
              // Get.toNamed(RoutesName.uploadImageScreen);
          } else {
            Utils.snackBar('Please Select EndTime', '');
          }
        } else {
          Utils.snackBar('Please Select StartTime', '');
        }
      } else {
        Utils.snackBar('Please select available days', '');
      }
    }else{
      if (kDebugMode) {
        print("consition else statas false");
      }
    }
  }

  void preferTimingStatusChange() {
    if (checkBoxSelected.value == true) {
      String startTimeTemp = '';
      String endTimeTemp = '';
      for (int i = 0; i < selectedDays.length; i++) {
        List<RxString> list = dataList[selectedDays[i]] as List<RxString>;
        if (startTimeTemp.isNotEmpty && endTimeTemp.isNotEmpty) {
          if (startTimeTemp.isNotEmpty) {
            list[0].value = startTimeTemp;
          }
          if (endTimeTemp.isNotEmpty) {
            list[1].value = endTimeTemp;
          }
        } else {
          startTimeTemp = list[0].value;
          endTimeTemp = list[1].value;
        }
      }
    }
  }
  void setStartTime(String value) {
    print("setting start time is ${value}");
    List<RxString> list = dataList[hintSelectedValue.value] as List<RxString>;
    list[0].value = value;
  }
  void setEndTime(String value) {
    print("setting end time is ${value}");
    List<RxString> list = dataList[hintSelectedValue.value] as List<RxString>;
    list[1].value = value;
  }
  String getStartTimeValue() {
    var returnValue = 'Start Time';
    List<RxString>? list = dataList[hintSelectedValue.value];
    if (list?[0].value != null) {
      if (list![0].value == '') {
        returnValue = 'Start Time';
      } else {
        returnValue = Utils.fomateTwelveHourTime(list[0].value);
      }
    }
    return returnValue;
  }
  String getEndTimeValue() {
    var returnValue = 'End Time';
    List<RxString>? list = dataList[hintSelectedValue.value];
    if (list?[1].value != null) {
      if (list![1].value == '') {
        returnValue = 'End Time';
      } else {
        returnValue = Utils.fomateTwelveHourTime(list[1].value);
      }
    }
    return returnValue;
  }
  void changeIndexDropDown(String value) {
    for (int i = 0; i < selectedDays.length; i++) {
      if (selectedDays[i] == value) {
        selectedDayIndex.value = i;
        break;
      }
    }
  }
  void onDaySelect(String value) {
    if (selectedDays.contains(value)) {
      selectedDays.remove(value);
      dataList.remove(value);
    }
    else {
      if (selectedDays.isEmpty) {
        hintSelectedValue.value = value;
      }
      selectedDays.add(value);
      dataList[value] = [''.obs, ''.obs];
    }
    if (selectedDays.isEmpty) {
      hintSelectedValue.value = 'Select Day';
    }
  }
}