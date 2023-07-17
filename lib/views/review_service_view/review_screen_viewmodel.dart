import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/respository/add_service_repository.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../respository/home_repository.dart';
import '../../respository/profile_edit_repository.dart';
import '../../utils/constants.dart';
import '../../utils/constants_size.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';
import '../add_service_view/add_service_second_view/service_second_viewModel.dart';
import '../add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import '../addbankdetailview/controller.dart';
import '../home_view/home_controller.dart';
import '../specialty_view/specialty_view_model.dart';
import '../upload_image_view/uploadimageviewmodel.dart';





import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';

class ReviewScreenViewModel extends GetxController {
  final _myRepoo = HomeRepository();

  bool showTitleAction = false;
  RxBool active = false.obs;
  int selectedIndex = 0;
  SpecialtyViewModel? specialtyViewModel;
  ServiceFirstViewModel? serviceViewModel;
  ServiceSecondViewModel? serviceSecondViewModel;
  UploadImageViewModel? uploadImageViewModel;
  HomeController? homeController;
  List<String> imageListFromHome = [];
  final _myRepo = AddServiceRepository();
  RxString categoryName = ''.obs;
  RxString serviceName = ''.obs;
  RxString subSpecialty = ''.obs;
  RxInt chargePerService = 0.obs;
  RxString description = ''.obs;
  RxDouble areaPerRange = RxDouble(0);
  RxInt totalExperence = 0.obs;
  List<File> backImagesList = [];
  List<Uint8List> backBitesImageList = [];
  List<String> backBitesImageNameList = [];
  String serviceId = '';
  RxString preferTiming = ''.obs;
  RxString availablityDays = ''.obs;
  List<String> daysName=[];
  List<String> startTime=[];
  List<String> endTime=[];

  @override
  void onInit() {
    showTitleAction = Get.arguments['showActionTitle'] ?? false;
    selectedIndex = Get.arguments['selectedIndex'] ?? 0;
    if (showTitleAction == false) {
      specialtyViewModel = Get.find<SpecialtyViewModel>();
      serviceViewModel = Get.find<ServiceFirstViewModel>();
      serviceSecondViewModel = Get.find<ServiceSecondViewModel>();
      uploadImageViewModel = Get.find<UploadImageViewModel>();
      setupInfo();
    }else{
      homeController = Get.find<HomeController>();
      setupDataFromHomeScreen();
    }
    super.onInit();
  }


  void clearResource(){
    if (kDebugMode) {
      print('inside clear resource form review screen');
    }
    Get.delete<ReviewScreenViewModel>(force: true);
    Get.delete<ControllerBank>(force: true);
    Get.delete<ServiceFirstViewModel>(force: true);
    Get.delete<ServiceSecondViewModel>(force: true);
    Get.delete<UploadImageViewModel>(force: true);
    Get.delete<SpecialtyViewModel>(force: true);
  }
  void setupDataFromHomeScreen(){
    active.value=homeController?.allServiceList[selectedIndex].status=="active"?true:false;
    areaPerRange.value = double.parse(homeController?.allServiceList[selectedIndex].areaRange??'0');
    categoryName.value = homeController?.allServiceList[selectedIndex].categoriesName??'';
    serviceName.value = homeController?.allServiceList[selectedIndex].subCategoriesName??'';
    chargePerService.value = int.parse(homeController?.allServiceList[selectedIndex].chargePerService??'0');
    totalExperence.value = int.parse(homeController?.allServiceList[selectedIndex].totalExperience??'0');
    description.value = homeController?.allServiceList[selectedIndex].description??'';
    var tempTime = '';
    var tempDay = '';
    for (int i = 0; i < (homeController?.allServiceList[selectedIndex].availability?.length??0); i++) {
      var d=homeController?.allServiceList[selectedIndex].availability?[i]??'0';
      String day = Utils.numberToDay(homeController?.allServiceList[selectedIndex].availability?[i]??'0');
      tempTime += "$day ,";
      String startTime = Utils.fomateTwelveHourTime(homeController?.allServiceList[selectedIndex].startTime?[i]?? 'null value');
      String endTime = Utils.fomateTwelveHourTime(homeController?.allServiceList[selectedIndex].endTime?[i]?? 'null value');
      tempDay += '$startTime-$endTime, ';
    }

    preferTiming.value = tempDay;
    availablityDays.value = tempTime;
    backImagesList.clear();
    backBitesImageList.clear();
    backBitesImageNameList.clear();

      for (int i = 0; i < (homeController?.allServiceList[selectedIndex].images?.length??0); i++) {
        if (homeController?.allServiceList[selectedIndex].images != null) {
          imageListFromHome.add(homeController?.allServiceList[selectedIndex].images?[i]??'');
        }
    }
    for (int i = 0; i <  (homeController?.allServiceList[selectedIndex].availability?.length??0); i++) {
      var day = Utils.dayToNumber( (homeController?.allServiceList[selectedIndex].availability?[i]??'0'));
      print('day $day');
      daysName.add(day);
      startTime.add(homeController?.allServiceList[selectedIndex].startTime?[i]??'');
      endTime.add(homeController?.allServiceList[selectedIndex].endTime?[i]??'');
    }
  }

  void setupInfo() {
    areaPerRange.value = serviceViewModel!.valueRange.value;
    categoryName.value = specialtyViewModel!.speciality.value.trim();
    serviceName.value = serviceViewModel!.serviceNameController.text.trim();
    chargePerService.value =
        int.parse(serviceViewModel!.chargePerServiceController.text.trim());
    totalExperence.value =
        int.parse(serviceViewModel!.totalExperienceController.text.trim());
    description.value = serviceViewModel!.descriptionController.text.trim();
    var tempTime = '';
    var tempDay = '';
    for (int i = 0; i < serviceSecondViewModel!.selectedDays.length; i++) {
      String day = Utils.dayToNumber(serviceSecondViewModel!.selectedDays[i]);
      tempTime += '${Utils.numberToDay(day)}, ';
      print('data is ${serviceSecondViewModel!.dataList[Utils.numberToDay(
          day)]}');
      String startTime = Utils.fomateTwelveHourTime(
          serviceSecondViewModel!.dataList[Utils.numberToDay(day)]?[0].value ??
              'null value');
      String endTime = Utils.fomateTwelveHourTime(
          serviceSecondViewModel!.dataList[Utils.numberToDay(day)]?[1].value ??
              "null value");
      tempDay += '$startTime-$endTime, ';
    }

    preferTiming.value = tempTime;
    availablityDays.value = tempDay;
    backImagesList.clear();
    backBitesImageList.clear();
    backBitesImageNameList.clear();
    if(kIsWeb){
      for (int i = 0; i < uploadImageViewModel!.bitesImageList.length; i++) {
        if (uploadImageViewModel!.bitesImageList[i] != null) {
          backBitesImageList.add(uploadImageViewModel!.bitesImageList[i]!);
          backBitesImageNameList.add(uploadImageViewModel!.bitesImageNameList[i]!);
        }
      }
    }else{
      for (int i = 0; i < uploadImageViewModel!.imageList.length; i++) {
        if (uploadImageViewModel!.imageList[i] != null) {
          backImagesList.add(uploadImageViewModel!.imageList[i]!);
        }
      }
    }
    for (int i = 0; i < serviceSecondViewModel!.selectedDays.length; i++) {
      var day = Utils.dayToNumber(serviceSecondViewModel!.selectedDays[i]);
      print('day $day');
      var aplhaName = Utils.numberToDay(day);
      print('alpha name day is :$aplhaName');
      daysName.add(day);
      List<RxString> value = serviceSecondViewModel!
          .dataList[aplhaName] as List<RxString>;
      startTime.add(value[0].value);
      endTime.add(value[1].value);
    }
  }

  void onContinueClicked(bool fromHomeComming) async {
    if (fromHomeComming) {
      // Get.snackbar("Service Activated", 'Conguratulations');
      serviceActiveOrDeactiveClick();
    }
    else {
      var toek=await SharePref.getString(Constants.token);
      print('token is ${toek}');
      BuildContext? context=Get.context;
      Utils.showDialogProgressDialog(context!, true);
      _myRepo.addService(
        categoryName.value,
        specialtyViewModel!.subSpeciality.value.trim(),
        serviceViewModel!.serviceNameController.text.trim(),
        totalExperence.value.toString(), 'INR',
        chargePerService.value.toString(),
        serviceViewModel!.valueRange.value.toInt().toString(),
        description.value,
        daysName,startTime,endTime,backImagesList,backBitesImageList,backBitesImageNameList).then((value ) {
        Utils.showDialogProgressDialog(context, false);
        if (kDebugMode) {
          print("success upload servicr token ${value.status} and data is ${value.data}");
        }
        showServiceCreatedDialog();
      }).onError((error, stackTrace) {
        Utils.showDialogProgressDialog(context, false);
        Utils.snackBar('Error', error.toString());
        if (kDebugMode) {
          print("error:${error.toString()}");
        }
      });
    }
  }

  void showServiceCreatedDialog() {
    Get.bottomSheet(isDismissible: false,Container(
      padding: const EdgeInsets.only(
          left: ConstantSize.screenPadding,
          right: ConstantSize.screenPadding,
          bottom: 0),
      alignment: Alignment.bottomCenter,
      width: Get.width,
      decoration: const BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(18), topRight: Radius.circular(18))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SvgPicture.asset(
            SvgAssets.conguratulation,
            semanticsLabel: 'A red up arrow',
          ),
          TextBoldUrbanist(
            txt: 'Congratulations!',
            textAlign: TextAlign.center,
            fontWeight: AppFonts.poppinsMediumWeight,
            fontFamily: AppFonts.poppinsFamily,
            textSize: ConstantSize.commonBoldTxtSize,
            txtColor: AppColor.blackColor,
          ),
          TextBoldUrbanist(
            txt:
            'Your service is now live & Users in your area can now  book your services',
            textAlign: TextAlign.center,
            fontFamily: AppFonts.urbanistFamily,
            fontWeight: AppFonts.urbanistMediumWeight,
            textSize: ConstantSize.commonTxtSize,
            txtColor: AppColor.viewLineColor,
          ),
          RoundButton(
            title: "Continue",
            onPress: () async {
              clearResource();
              Get.back();
              Get.back();
            },
            textColor: AppColor.backGroundColor,
            buttonColor: AppColor.daysSelectedColor,
            width: Get.width - ConstantSize.screenPadding * 2,
            fontSize: ConstantSize.commonTxtTwelveSize,
            fontFamily: AppFonts.poppinsFamily,
            fontWeight: AppFonts.poppinsMediumWeight,
          ),
        ],
      ),
    ));
  }
  void serviceActiveOrDeactiveClick()async{
    var data={
      'serviceId':homeController?.allServiceList[selectedIndex].sId
    };
    BuildContext? context= Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepoo.serviceActiveDeActive(data).then((value) {
      if (kDebugMode) {
      }
      Utils.showDialogProgressDialog(context, false);
      Get.back();
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

}


