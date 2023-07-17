import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/continer_with_dropdownbtn.dart';
import 'package:service_provider_two/res/components/round_button.dart';
import 'package:service_provider_two/utils/string_utils.dart';
import 'package:service_provider_two/views/profile_setup_second_view/profile_second_view_model.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/InputFieldCommon.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';

class ProfileSetupSecondScreen extends StatefulWidget {
  const ProfileSetupSecondScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileSetupSecondScreenState();
  }
}

class _ProfileSetupSecondScreenState extends State<ProfileSetupSecondScreen> {
  ProfileSecondViewModel modelController = Get.put(ProfileSecondViewModel());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.hideKeyBoard(context),
      child: Scaffold(
        appBar: Utils.commonAppBar(),
        body: SingleChildScrollView(
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
                          txt: StringUtils.profileSetup, textAlign: TextAlign.start),
                      SizedBox(
                        height: ConstantSize.commonTopPadding,
                      ),
                      TextBoldUrbanist(
                        txt: StringUtils.setYourProfileSetup,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.viewLineColor,
                      ),
                      SizedBox(
                        height: Get.height * .04,
                      ),
                      TextBoldUrbanist(
                        txt: StringUtils.state,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: modelController.stateNameController,
                        hint: StringUtils.state,
                        focusNode: modelController.stateNameFocusNode,
                        nextFocusNode: modelController.cityNameFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: StringUtils.city,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: modelController.cityNameController,
                        hint: StringUtils.city,
                        focusNode: modelController.cityNameFocusNode,
                        nextFocusNode: modelController.pinCodeNameFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: StringUtils.pinCode,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: modelController.pinCodeNameController,
                        hint: StringUtils.pinCode,
                        focusNode: modelController.pinCodeNameFocusNode,
                        nextFocusNode: modelController.landMarkNameFocusNode,
                        keyBoardType: TextInputType.number,

                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: StringUtils.landMark,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: modelController.landMarkNameController,
                        hint: StringUtils.landMark,
                        focusNode: modelController.landMarkNameFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: StringUtils.address,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),

                    Obx(()=> ContainerWithDropDownBtn(borderColor: AppColor.liteBorderColor,title: modelController.address.value, onPress: modelController.addressClick,enableDropDownBtn: false,)),

                      SizedBox(
                        height: ConstantSize.bottomScrollSize,
                      ),
                    ]))),
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
                onPress: () => modelController.onContinueClicked(),
              ),
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
