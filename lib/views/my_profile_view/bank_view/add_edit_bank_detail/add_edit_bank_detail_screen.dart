import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../../res/assets/svg_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/InputFieldCommon.dart';
import '../../../../res/components/TextBoldUrbanist.dart';
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../utils/constants_size.dart';
import '../../../../utils/utils.dart';
import 'add_edit_bank_detail_controller.dart';
class AddEditBankDetail extends StatefulWidget{
  const AddEditBankDetail({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddEditBankDetailState();
  }
}
class _AddEditBankDetailState extends State<AddEditBankDetail>{

  final AddEditBankDetailController _addEditBankDetailController = Get.put(AddEditBankDetailController());

  @override
  void dispose() {
    Get.delete<AddEditBankDetailController>();
    super.dispose();
  }

  @override
  void initState() {

    super.initState();
  }
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
            txt: _addEditBankDetailController.appBarTitle,
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
                        txt: 'Bank Name',
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
                                  hint: Text(_addEditBankDetailController.selectedBank.value,style: const TextStyle(
                                      fontSize:  ConstantSize.commonTxtSize,
                                      color: AppColor.viewLineColor,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      fontFamily: AppFonts.urbanistFamily),),
                                  // value: 'selected',
                                  // value: serviceSecondViewModel.selectedDays[serviceSecondViewModel.selectedDayIndex.value>-1?serviceSecondViewModel.selectedDayIndex.value:0],
                                  // value: serviceSecondViewModel.selectedDayIndex.value>-1?serviceSecondViewModel.selectedDays[ serviceSecondViewModel.selectedDayIndex.value]:'Select Day',
                                  items:  Utils.indianBanks
                                      .map((e) => DropdownMenuItem(
                                    value: e,
                                    child: Text(e),
                                  ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      _addEditBankDetailController.selectedBank.value=value;
                                    }
                                  },
                                ),
                            ),
                          )),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Account No',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),

                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: _addEditBankDetailController.accountNoController,
                        hint: "Account No",
                        focusNode: _addEditBankDetailController.accountNoFocusNode,
                        nextFocusNode: _addEditBankDetailController.confirmNoFocusNode,
                        keyBoardType: TextInputType.number,
                        maxWords: 16,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Confirm Account No',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),

                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: _addEditBankDetailController.confirmNoController,
                        hint: "Confirm Account No",
                        focusNode: _addEditBankDetailController.confirmNoFocusNode,
                        nextFocusNode: _addEditBankDetailController.ifscCodeFocusNode,
                        keyBoardType: TextInputType.number,
                        maxWords: 16,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'IFSC code',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: _addEditBankDetailController.ifscCodeController,
                        hint: "IFSC code",
                        focusNode: _addEditBankDetailController.ifscCodeFocusNode,
                        keyBoardType: TextInputType.text,
                      ),

                      SizedBox(height: ConstantSize.bottomScrollSize,),


                    ]))),bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0.0, left: ConstantSize.screenPadding, right:ConstantSize.screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundButton(title:  _addEditBankDetailController.buttonTxt, onPress:() => _addEditBankDetailController.onContinueClicked(),),
            SizedBox(height: ConstantSize.commonBottomPadding,)
          ],),
      ),),
    );
  }
}