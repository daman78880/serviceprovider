import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/string_utils.dart';
import 'package:service_provider_two/views/otp_view/otp_viewmode.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OptScreenState();
  }
}

class _OptScreenState extends State<OtpScreen> {
  OtpViewModel optViewModel=Get.put(OtpViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.commonAppBar(),
        body: SingleChildScrollView(
            child: GestureDetector(
              onTap: () =>Utils.hideKeyBoard(context),
              child: Container(
                  color: AppColor.whiteColor,
                  width: Get.width,
                  padding: const EdgeInsets.only(
                      left: ConstantSize.screenPadding,
                      right: ConstantSize.screenPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ConstantSize.commonTopPadding,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextBoldUrbanist(
                              txt: StringUtils.otpVerification,
                              textAlign: TextAlign.start),
                        ),
                        SizedBox(
                          height: Get.height * .25,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextBoldUrbanist(
                              txt:StringUtils.enterOpt,
                              textAlign: TextAlign.start,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              textSize: ConstantSize.commonTxtSize),
                        ),
                        SizedBox(
                          height: ConstantSize.commonTopPadding,
                        ),
                        PinCodeTextField(
                          appContext: context,
                          pastedTextStyle: TextStyle(
                            color: Colors.green.shade600,
                            fontWeight: FontWeight.normal,
                          ),
                          // errorTextSpace: 0,
                          length: 6,
                          obscureText: false,
                          obscuringCharacter: '*',
                          animationType: AnimationType.fade,
                          validator: (v) {
                            // if (v.length < 3) {
                            //   return "I'm from validator";
                            // } else {
                            //   return null;
                            // }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(5),
                            fieldHeight: 45,
                            fieldWidth: 45,
                            activeFillColor: AppColor.countryContainerColor,
                            inactiveFillColor: AppColor.countryContainerColor,
                            activeColor: AppColor.countryContainerColor,
                            inactiveColor: AppColor.countryContainerColor,
                            selectedColor: AppColor.countryContainerColor,
                            selectedFillColor: AppColor.countryContainerColor,
                          ),

                          hintCharacter: '-',
                          cursorColor: AppColor.blackColor,
                          animationDuration: const Duration(milliseconds: 300),
                          textStyle: const TextStyle(
                              fontSize: ConstantSize.commonTxtSize, height: 1.6),
                          backgroundColor: Colors.white,
                          enableActiveFill: true,
                          controller: optViewModel.pinController,
                          onCompleted: (v) {
                            if (kDebugMode) {
                              print("Completed");
                            }
                          },
                          onTap: () {
                            if (kDebugMode) {
                              print("Pressed");
                            }
                          },
                          onChanged: (value) {
                            if (kDebugMode) {
                              print(value);
                            }
                          },

                          beforeTextPaste: (text) {
                            if (kDebugMode) {
                              print("Allowing to paste $text");
                            }
                            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                            //but you can show anything you want here, like your pop up saying wrong paste format or etc
                            return true;
                          },
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(
                            ()=> TextBoldUrbanist(
                                  txt: '00.${optViewModel.start.value}',
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistMediumWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor:Colors.red),
                            ),
                            GestureDetector(
                              onTap: () => optViewModel.onResendClick(),
                              child: TextBoldUrbanist(
                                  txt: StringUtils.resend,
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistMediumWeight,
                                  textSize: ConstantSize.commonTxtSize),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        RoundButton(title: StringUtils.submit, onPress: () {
                          Utils.hideKeyBoard(context);
                          optViewModel.onSubmitClicked();
                        }),
                      ])),
            )));
  }
}
