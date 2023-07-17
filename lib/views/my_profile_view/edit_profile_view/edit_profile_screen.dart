import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/InputFieldCommon.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/continer_with_dropdownbtn.dart';
import '../../../res/components/round_button.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/utils.dart';
import 'edit_profile_controller.dart';


class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EditProfileScreenState();
  }
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  EditProfileController editProfileController =
      Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Utils.hideKeyBoard(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColor,
              size: ConstantSize.backIconSize,
            ),
          ),
          centerTitle: true,
          title: TextBoldUrbanist(
            txt: 'Edit Profile',
            textAlign: TextAlign.center,
            fontWeight: AppFonts.urbanistMediumWeight,
            textSize: ConstantSize.commonMediumTxtSize,
            txtColor: AppColor.blackColor,
          ),
        ),
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
                        height: Get.height * .023,
                      ),
                      TextBoldUrbanist(
                        txt: 'First Name',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: editProfileController.firstNameController,
                        hint: "First Name",
                        focusNode: editProfileController.firstNameFocusNode,
                        nextFocusNode: editProfileController.lastNameFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Last Name',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: editProfileController.lastNameController,
                        hint: "Last Name",
                        focusNode: editProfileController.lastNameFocusNode,
                        nextFocusNode: editProfileController.emailNameFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Email',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: editProfileController.emailNameController,
                        hint: "Email",
                        focusNode: editProfileController.emailNameFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Gender',
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
                                  hint: Text(editProfileController.hintGender.value.isNotEmpty?editProfileController.hintGender.value:'Select Gender',style: const TextStyle(
                                      fontSize:  ConstantSize.commonTxtSize,
                                      color: AppColor.viewLineColor,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      fontFamily: AppFonts.urbanistFamily),),
                                  items:  editProfileController.genderList
                                      .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      editProfileController.hintGender.value=value;
                                    }
                                  },
                                ),
                            ),
                          )),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'address',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      Obx(()=> ContainerWithDropDownBtn(borderColor: AppColor.liteBorderColor,title: editProfileController.address.value, onPress: editProfileController.addressClick,enableDropDownBtn: false,)),

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
                title: "Save Changes",
                onPress: () => editProfileController.onContinueClicked(),
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
