import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/round_button.dart';
import 'package:service_provider_two/views/profile_setup_view/profile_view_model.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/InputFieldCommon.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ProfileSetupScreenState();
  }
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  ProfileViewModel modelController = Get.put(ProfileViewModel());



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.hideKeyBoard(context),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                          height: ConstantSize.commonBtwSpaceForForm,
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
                          txt: StringUtils.firstName,
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,
                        ),

                        SizedBox(
                          height: ConstantSize.commonBtwSpaceForForm,
                        ),
                        InputFieldCommon(
                          controller: modelController.firstNameController,
                          hint: StringUtils.firstName,
                          focusNode: modelController.firstNameFocusNode,
                          nextFocusNode: modelController.lastNameFocusNode,
                          keyBoardType: TextInputType.name,
                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        TextBoldUrbanist(
                          txt: StringUtils.lastName,
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,
                        ),

                        SizedBox(
                          height: ConstantSize.commonBtwSpaceForForm,
                        ),
                        InputFieldCommon(
                          controller: modelController.lastNameController,
                          hint: StringUtils.lastName,
                          focusNode: modelController.lastNameFocusNode,
                          nextFocusNode: modelController.emailNameFocusNode,
                          keyBoardType: TextInputType.name,

                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        TextBoldUrbanist(
                          txt: StringUtils.gender,
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        SizedBox(
                          height: ConstantSize.commonBtwSpaceForForm,
                        ),
                        InputDecorator(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: ConstantSize.commonBtnPadding * 2,vertical: 0),
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(ConstantSize.containerWelcomeRadius)),
                                  borderSide: BorderSide(
                                      color: AppColor.dividerColor, strokeAlign: 1)
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(()=>
                                  DropdownButton(icon: SvgPicture.asset(
                                      SvgAssets.dropDownArrow,
                                      semanticsLabel: 'Droup list Arrow'
                                  ),
                                    style: const TextStyle(
                                        fontSize:  ConstantSize.commonTxtSize,
                                        color: AppColor.viewLineColor,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        fontFamily: AppFonts.urbanistFamily),
                                    hint: Text(modelController.hintGender.value.isNotEmpty?modelController.hintGender.value:'Select Gender',style: const TextStyle(
                                        fontSize:  ConstantSize.commonTxtSize,
                                        color: AppColor.viewLineColor,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        fontFamily: AppFonts.urbanistFamily),),
                                    items:  modelController.genderList
                                        .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                        .toList(),
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        modelController.hintGender.value=value;
                                      }
                                    },
                                  ),
                              ),
                            )),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        TextBoldUrbanist(
                          txt: StringUtils.email,
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,

                        ),
                        SizedBox(
                          height: ConstantSize.commonBtwSpaceForForm,
                        ),
                        InputFieldCommon(
                          controller: modelController.emailNameController,
                          hint: StringUtils.email,
                          focusNode: modelController.emailNameFocusNode,
                          keyBoardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: ConstantSize.bottomScrollSize,),
                      ])
              )
          ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 0.0, left: ConstantSize.screenPadding, right:ConstantSize.screenPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundButton(title: StringUtils.continuee, onPress: () =>modelController.onContinueClicked(),),
              SizedBox(height: ConstantSize.commonBottomPadding,)
            ],),
        ),
      ),
    );
  }
}
