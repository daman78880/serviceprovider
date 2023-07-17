import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/utils.dart';
import 'package:service_provider_two/views/addbankdetailview/controller.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/InputFieldCommon.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../add_service_view/add_service_second_view/service_second_viewModel.dart';
import '../add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import '../specialty_view/specialty_view_model.dart';
import '../upload_image_view/uploadimageviewmodel.dart';

class AddBankDetailScreen extends StatefulWidget {
  const AddBankDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddBankDetailScreenState();
  }
}

class _AddBankDetailScreenState extends State<AddBankDetailScreen> {
  ControllerBank controllerBank = Get.put(ControllerBank(),permanent: true);



 void cleanResource(){
   Get.delete<ControllerBank>(force: true);
   Get.delete<ServiceFirstViewModel>(force: true);
   Get.delete<ServiceSecondViewModel>(force: true);
   Get.delete<UploadImageViewModel>(force: true);
   Get.delete<SpecialtyViewModel>(force: true);
   Get.back();
 }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        cleanResource();
        return false;
      },
      child: GestureDetector(
        onTap: () => Utils.hideKeyBoard(context),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            surfaceTintColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                cleanResource();
                Utils.hideKeyBoard(context);
              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColor.blackColor,
                size: ConstantSize.backIconSize,
              ),
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
                          height: ConstantSize.commonTopPadding,
                        ),
                        TextBoldUrbanist(
                            txt: 'Add Bank Details', textAlign: TextAlign.start),
                        SizedBox(
                          height: Get.height * .1,
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
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: ConstantSize.commonBtnPadding * 2,
                                  vertical: 0),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      ConstantSize.containerWelcomeRadius)),
                                  borderSide: BorderSide(
                                      color: AppColor.dividerColor,
                                      strokeAlign: 1)),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(
                                () => DropdownButton(
                                  icon: SvgPicture.asset(SvgAssets.dropDownArrow,
                                      semanticsLabel: 'Droup list Arrow'),
                                  style: const TextStyle(
                                      fontSize: ConstantSize.commonTxtSize,
                                      color: AppColor.viewLineColor,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      fontFamily: AppFonts.urbanistFamily),
                                  hint: Text(
                                    controllerBank.selectedBank.value,
                                    style: const TextStyle(
                                        fontSize: ConstantSize.commonTxtSize,
                                        color: AppColor.viewLineColor,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        fontFamily: AppFonts.urbanistFamily),
                                  ),
                                  items: Utils.indianBanks
                                      .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e),
                                          ))
                                      .toList(),
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      controllerBank.selectedBank.value = value;
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
                          controller: controllerBank.accountNoController,
                          hint: "Account No",
                          focusNode: controllerBank.accountNoFocusNode,
                          nextFocusNode: controllerBank.confirmAccountNoFocusNode,
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
                          controller: controllerBank.confirmAccountNoController,
                          hint: "Confirm Account No",
                          focusNode: controllerBank.confirmAccountNoFocusNode,
                          nextFocusNode: controllerBank.ifscCodeFocusNode,
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
                          controller: controllerBank.ifscCodeController,
                          hint: "IFSC code",
                          focusNode: controllerBank.ifscCodeFocusNode,
                          keyBoardType: TextInputType.text,
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
                  title: "Continue",
                  onPress: () => controllerBank.onContinueClicked(),
                ),
                SizedBox(
                  height: ConstantSize.commonBottomPadding,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
