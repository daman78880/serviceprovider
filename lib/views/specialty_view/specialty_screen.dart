import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/string_utils.dart';
import 'package:service_provider_two/views/specialty_view/specialty_view_model.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/continer_with_dropdownbtn.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants.dart';
import '../../utils/constants_size.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';
import '../add_service_view/add_service_second_view/service_second_viewModel.dart';
import '../add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import '../addbankdetailview/controller.dart';
import '../home_view/home_controller.dart';
import '../upload_image_view/uploadimageviewmodel.dart';

class SpecialtyScreen extends StatefulWidget {
  const SpecialtyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SpecialtyScreenState();
  }
}

class _SpecialtyScreenState extends State<SpecialtyScreen> {
  SpecialtyViewModel specialtyViewModel = Get.put(SpecialtyViewModel(), permanent: true);

  @override
  void initState() {
    printdata();
    super.initState();
  }
  void printdata()async{
    var token = await SharePref.getString(Constants.token);
    print('token paseed:$token');
  }

  void cleanResource(){
    Get.delete<SpecialtyViewModel>(force: true);
    Get.delete<ServiceFirstViewModel>(force: true);
    Get.delete<ServiceSecondViewModel>(force: true);
    Get.delete<UploadImageViewModel>(force: true);
    Get.delete<ControllerBank>(force: true);
    Get.back();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        cleanResource();
        return false;
      },
      child: Scaffold(
        appBar:  AppBar(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Utils.hideKeyBoard(context);
              cleanResource();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColor,
              size: ConstantSize.backIconSize,
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: GestureDetector(
                onTap: () {
                  Utils.hideKeyBoard(context);
                },
                child: Container(
                    color: AppColor.whiteColor,
                    width: Get.width,
                    padding: const EdgeInsets.only(
                        left: ConstantSize.screenPadding,
                        right: ConstantSize.screenPadding),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: ConstantSize.commonTopPadding,
                          ),
                          TextBoldUrbanist(
                              txt: StringUtils.chooseYourSpecialty,
                              textAlign: TextAlign.start),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          TextBoldUrbanist(
                            txt: StringUtils.specialty,
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          SizedBox(
                            height: ConstantSize.commonBtwSpaceForForm,
                          ),
                          Obx(() => ContainerWithDropDownBtn(
                                title:
                                    specialtyViewModel.speciality.value.isNotEmpty
                                        ? specialtyViewModel.speciality.value
                                        : StringUtils.chooseSpecialty,
                                onPress: () =>
                                    specialtyViewModel.onChooseSpecialtyClick(),
                              )),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          TextBoldUrbanist(
                            txt: StringUtils.subSCategory,
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          SizedBox(
                            height: ConstantSize.commonBtwSpaceForForm,
                          ),
                          Obx(() => ContainerWithDropDownBtn(
                              title: specialtyViewModel
                                      .subSpeciality.value.isNotEmpty
                                  ? specialtyViewModel.subSpeciality.value
                                  : StringUtils.chooseSubCategory,
                              onPress: () =>
                                  specialtyViewModel.onSubCategoryClick())),
                          // Spacer(),
                          SizedBox(
                            height: ConstantSize.bottomScrollSize,
                          ),
                        ])))),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
              bottom: 0.0,
              left: ConstantSize.screenPadding,
              right: ConstantSize.screenPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundButton(
                  title:StringUtils.continuee,
                  onPress: () => specialtyViewModel.onContinueClick()),
              SizedBox(
                height: ConstantSize.commonBottomPadding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
