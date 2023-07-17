import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/round_button.dart';
import '../../../res/components/selection_text_icon_with_viewline.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import 'change_language_controller.dart';

class ChangeLanguageScreen extends StatefulWidget {
  const ChangeLanguageScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChangeLanguageScreenState();
  }
}

class _ChangeLanguageScreenState extends State<ChangeLanguageScreen> {
  final ChangeLanguageController _changeLanguageController =
      Get.put(ChangeLanguageController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          txt: 'Change Language',
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
                      height: Get.height * .047,
                    ),
                    TextBoldUrbanist(
                      txt: 'Please select the Language',
                      textAlign: TextAlign.start,
                      textSize: ConstantSize.commonMediumTxtSize,
                      txtColor: AppColor.blackColor,
                    ),
                    SizedBox(
                      height: Get.height * .026,
                    ),
                       ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Obx( () =>
                             SelectionTextIconWithViewline(
                              title: _changeLanguageController.languageList[index],
                              selected: _changeLanguageController.selectedLanguage == _changeLanguageController.languageList[index] ? true : false,
                              onPress: () {
                                _changeLanguageController.changeLanguageSelection(
                                    _changeLanguageController.languageList[index]);
                              },
                            )
                          );
                        },
                        itemCount: _changeLanguageController.languageList.length,
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
              title: 'Done',
              onPress: () => _changeLanguageController.onContinueClicked(),
            ),
            SizedBox(
              height: ConstantSize.commonBottomPadding,
            )
          ],
        ),
      ),
    );
  }
}
