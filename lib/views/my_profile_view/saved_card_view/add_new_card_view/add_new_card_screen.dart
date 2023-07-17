import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/views/my_profile_view/saved_card_view/add_new_card_view/add_new_card_controller.dart';

import '../../../../res/colors/app_color.dart';
import '../../../../res/components/InputFieldCommon.dart';
import '../../../../res/components/TextBoldUrbanist.dart';
import '../../../../res/components/continer_with_dropdownbtn.dart';
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../utils/constants_size.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';
class AddNewCardScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _addNewCardState();
  }
}
class _addNewCardState extends State<AddNewCardScreen>{
  AddNewCardController _addNewCardController = Get.put(AddNewCardController());

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
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColor,
              size: ConstantSize.backIconSize,
            ),
          ),
          centerTitle: true,
          title: TextBoldUrbanist(
            txt: StringUtils.addNewCard,
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
                padding: EdgeInsets.only(
                    left: ConstantSize.screenPadding,
                    right: ConstantSize.screenPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * .047,
                      ),
                      _addNewCardController.addCardStatus?     TextBoldUrbanist(
                        txt: 'BankName',
                        textAlign: TextAlign.start,
                        textSize: ConstantSize.commonTxtTwelveSize,
                        txtColor: AppColor.blackColor,
                        fontFamily: AppFonts.poppinsFamily,
                        fontWeight: AppFonts.poppinsRagularWeight,
                      ):Container(),
                      _addNewCardController.addCardStatus?    InputDecorator(
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
                                  style: TextStyle(
                                      fontSize:  ConstantSize.commonTxtSize,
                                      color: AppColor.viewLineColor,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      fontFamily: AppFonts.urbanistFamily),
                                  hint: Text(_addNewCardController.selectedBank.value,style: TextStyle(
                                      fontSize:  ConstantSize.commonTxtSize,
                                      color: AppColor.viewLineColor,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      fontFamily: AppFonts.urbanistFamily),),
                                  // value: 'selected',
                                  // value: serviceSecondViewModel.selectedDays[serviceSecondViewModel.selectedDayIndex.value>-1?serviceSecondViewModel.selectedDayIndex.value:0],
                                  // value: serviceSecondViewModel.selectedDayIndex.value>-1?serviceSecondViewModel.selectedDays[ serviceSecondViewModel.selectedDayIndex.value]:'Select Day',
                                  items:  Utils.indianBanks
                                      .map((e) => DropdownMenuItem(
                                    child: Text(e),
                                    value: e,
                                  ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      _addNewCardController.selectedBank.value=value;
                                      print("onChange value is $value");
                                      // serviceSecondViewModel.changeIndexDropDown(value);
                                    }
                                  },
                                ),
                            ),
                          )):Container(),
                      _addNewCardController.addCardStatus?   SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ):Container(),
                      _addNewCardController.addCardStatus?     SizedBox(
                        height: Get.height * .02,
                      ):Container(),

                      TextBoldUrbanist(
                        txt: 'Account Holder Name',
                        textAlign: TextAlign.start,
                        textSize: ConstantSize.commonTxtTwelveSize,
                        txtColor: AppColor.blackColor,
                        fontFamily: AppFonts.poppinsFamily,
                        fontWeight: AppFonts.poppinsRagularWeight,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller:
                        _addNewCardController.accountNameHolderController,
                        hint: StringUtils.name,
                        focusNode: _addNewCardController.accountNameHolderNode,
                        nextFocusNode: _addNewCardController.cardNumberNode,
                        fontFamily: AppFonts.poppinsFamily,
                        fontWeight: AppFonts.poppinsRagularWeight,
                        fontSize: ConstantSize.commonTxtTwelveSize,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: StringUtils.cardNumber,
                        textSize: ConstantSize.commonTxtTwelveSize,
                        txtColor: AppColor.blackColor,
                        fontFamily: AppFonts.poppinsFamily,
                        fontWeight: AppFonts.poppinsRagularWeight,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      InputFieldCommon(
                        controller: _addNewCardController.cardNumberController,
                        hint: StringUtils.number,
                        focusNode: _addNewCardController.cardNumberNode,
                        nextFocusNode: _addNewCardController.cvvNode,
                        fontFamily: AppFonts.poppinsFamily,
                        fontWeight: AppFonts.poppinsRagularWeight,
                        fontSize: ConstantSize.commonTxtTwelveSize,
                        keyBoardType: TextInputType.number,
                        maxWords: 16,
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            TextBoldUrbanist(
                              txt: StringUtils.expireDate,
                              textSize: ConstantSize.commonTxtTwelveSize,
                              txtColor: AppColor.blackColor,
                              fontFamily: AppFonts.poppinsFamily,
                              fontWeight: AppFonts.poppinsRagularWeight,
                            ),
                                SizedBox(
                                  height: ConstantSize.commonBtwSpaceForForm,
                                ),
                            Obx(
                              ()=> ContainerWithDropDownBtn(
                                  title: _addNewCardController.expireDate.value==StringUtils.date?StringUtils.date:Utils.formatExpireDate(_addNewCardController.expireDate.value),
                                  onPress: () => {
                                  _addNewCardController.selectDatee(context)
                                  },
                                  width: Get.width  - (ConstantSize.screenPadding * 2),
                                  enableDropDownBtn: true,dropDownIcon: SvgAssets.calender,),
                            ),
                          // )
                              ],
                            ),
                          ),     SizedBox(width: Get.width*.03,),Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            TextBoldUrbanist(
                              txt: StringUtils.cvv,
                              textSize: ConstantSize.commonTxtTwelveSize,
                              txtColor: AppColor.blackColor,
                              fontFamily: AppFonts.poppinsFamily,
                              fontWeight: AppFonts.poppinsRagularWeight,
                            ),

                                SizedBox(
                                  height: ConstantSize.commonBtwSpaceForForm,
                                ),
                            InputFieldCommon(
                              controller: _addNewCardController.cvvController,
                              hint: StringUtils.tempNum,
                              focusNode: _addNewCardController.cvvNode,
                              fontFamily: AppFonts.poppinsFamily,
                              fontWeight: AppFonts.poppinsRagularWeight,
                              fontSize: ConstantSize.commonTxtTwelveSize,
                              keyBoardType: TextInputType.number,
                              maxWords: 3,
                            ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: ConstantSize.bottomScrollSize,),
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
                title: _addNewCardController.addCardStatus?StringUtils.addNewCard:StringUtils.saveDetails,
                onPress: () => _addNewCardController.savedDetailClick(),
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