import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/string_utils.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/utils.dart';
import 'choose_specialty_controller.dart';

class ChooseSpecialtyScreen extends StatefulWidget {
  const ChooseSpecialtyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseSpecialtyScreenState();
  }
}

class _ChooseSpecialtyScreenState extends State<ChooseSpecialtyScreen> {
  final ChooseSpecialtyController _chooseSpecialtyController = Get.put(ChooseSpecialtyController());
  var buttonPadding =  ConstantSize.commonBtnPadding*1.5;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.commonAppBar(),
        body: SingleChildScrollView(
            child: GestureDetector(
                onTap: () {
                  Utils.hideKeyBoard(context);
                },
                child: Container(
                    color: AppColor.whiteColor,
                    height: Get.height - Get.height * .13,
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
                            height: Get.height * .05,
                          ),
                          TextBoldUrbanist(
                            txt:StringUtils.allCategory,
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistBoldWeight,
                            textSize: ConstantSize.commonMediumTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          SizedBox(
                            height: ConstantSize.commonBtwSpaceForForm,
                          ),
                          Expanded(
                            child: ListView.builder(
                              itemBuilder: (context, index) {
                                return Obx( () => InkWell(
                                  onTap: () =>  _chooseSpecialtyController.changeLanguageSelction(_chooseSpecialtyController.specialtyList[index]),
                                  child: Container(
                                      padding: EdgeInsets.only(top: buttonPadding,bottom: buttonPadding,left: 0,right: 0),
                                      width: Get.width-ConstantSize.screenPadding*2,
                                      child: Row(
                                        children: [
                                          Expanded(child:   TextBoldUrbanist(
                                            txt: _chooseSpecialtyController.specialtyList[index],
                                            textAlign: TextAlign.start,
                                            fontWeight: AppFonts.urbanistMediumWeight,
                                            textSize: ConstantSize.commonTxtSize,
                                            txtColor: AppColor.blackColor,
                                          ), ),
                                          SizedBox(
                                            width: ConstantSize.checkBoxSize,
                                            height: ConstantSize.checkBoxSize,
                                            child: SvgPicture.asset(
                                                _chooseSpecialtyController.selectedSpecialty.value== _chooseSpecialtyController.specialtyList[index] ? SvgAssets.checkBox: SvgAssets.unCheckBox,
                                                semanticsLabel: 'CheckBox'
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                ),
                                );
                              },
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount:  _chooseSpecialtyController.specialtyList.length,
                            ),
                          )
                        ])))));
  }
}
