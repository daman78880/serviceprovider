import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import 'choose_sub_category_controller.dart';

class ChooseSubCategorySpecialtyScreen extends StatefulWidget {
  const ChooseSubCategorySpecialtyScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChooseSubCategoryState();
  }
}

class _ChooseSubCategoryState extends State<ChooseSubCategorySpecialtyScreen> {
  final ChooseSubCategoryController _chooseSubCategoryController =
      Get.put(ChooseSubCategoryController());
  var buttonPadding = ConstantSize.commonBtnPadding * 1.5;

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
                          Row(
                            children: [
                              Expanded(
                                child: TextBoldUrbanist(
                                    txt: StringUtils.addSubCategory,
                                    textAlign: TextAlign.start),
                              ),
                              InkWell(
                                onTap:  _chooseSubCategoryController.onEditClick,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(
                                          ConstantSize.containerWelcomeRadius),
                                      color: AppColor.backGroundColor
                                          .withOpacity(.3)),
                                  child: SizedBox(
                                    width: ConstantSize.checkBoxSize - 2,
                                    height: ConstantSize.checkBoxSize - 2,
                                    child: SvgPicture.asset(SvgAssets.searchIcon,
                                        semanticsLabel: StringUtils.searchLogo),
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * .05,
                          ),
                          TextBoldUrbanist(
                            txt: StringUtils.subCategory,
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
                                return Obx(
                                  () => InkWell(
                                    onTap: () {
                                      _chooseSubCategoryController
                                          .changeSubCategorySelection(
                                              _chooseSubCategoryController
                                                  .subCategoryList[index]);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          top: buttonPadding,
                                          bottom: buttonPadding,
                                          left: 0,
                                          right: 0),
                                      width: Get.width -
                                          ConstantSize.screenPadding * 2,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextBoldUrbanist(
                                              txt: _chooseSubCategoryController
                                                  .subCategoryList[index],
                                              textAlign: TextAlign.start,
                                              fontWeight:
                                                  AppFonts.urbanistMediumWeight,
                                              textSize:
                                                  ConstantSize.commonTxtSize,
                                              txtColor: AppColor.blackColor,
                                            ),
                                          ),
                                          SizedBox(
                                            width: ConstantSize.checkBoxSize,
                                            height: ConstantSize.checkBoxSize,
                                            child: SvgPicture.asset(
                                                _chooseSubCategoryController
                                                            .selectedSubCategory ==
                                                        _chooseSubCategoryController
                                                                .subCategoryList[
                                                            index]
                                                    ? SvgAssets.checkBox
                                                    : SvgAssets.unCheckBox,
                                                semanticsLabel: 'CheckBox'),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _chooseSubCategoryController
                                  .subCategoryList.length,
                            ),
                          )
                        ])))));
  }
}
