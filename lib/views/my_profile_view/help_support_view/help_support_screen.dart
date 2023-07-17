import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/InputFieldCommon.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/round_button.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/utils.dart';
import 'help_support_controller.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HelpSupportScreenState();
  }
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  final HelpSupportController _helpSupportController =
      Get.put(HelpSupportController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
         Utils.hideKeyBoard(context);
       },
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
            txt: 'Help & Support',
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
                        controller: _helpSupportController.emailController,
                        hint: "Email",
                        focusNode: _helpSupportController.emailFocusNode,
                        nextFocusNode: _helpSupportController.subjectFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Subject',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: _helpSupportController.subjectController,
                        hint: "Subject",
                        focusNode: _helpSupportController.subjectFocusNode,
                        nextFocusNode:
                            _helpSupportController.descriptionFocusNode,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Description',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: _helpSupportController.descriptionController,
                        hint: "Description",
                        focusNode: _helpSupportController.descriptionFocusNode,
                        maxLines: 5,
                        keyBoardType: TextInputType.multiline,
                        topBottomPadding: ConstantSize.commonBtnPadding * 2,
                      ),
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
                title: 'Send',
                onPress: () => _helpSupportController.onContinueClicked(),
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
