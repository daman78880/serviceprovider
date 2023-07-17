import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/res/components/TextBoldUrbanist.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/utils/string_utils.dart';
import 'package:service_provider_two/views/sign_in_view/sign_in_viewmodel.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SignInScreenState();
  }
}

class _SignInScreenState extends State<SignInScreen> {
  SignInViewModel signInViewModel = Get.put(SignInViewModel());
  bool fromSignUp = false;

  @override
  void initState() {
    fromSignUp = Get.arguments['fromSignUp'] ?? false;
    super.initState();
  }

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
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ConstantSize.commonTopPadding,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: ConstantSize.screenPadding,
                      right: ConstantSize.screenPadding),
                  child: TextBoldUrbanist(
                      txt: fromSignUp
                          ? StringUtils.signUpWithPhoneNb
                          : StringUtils.signWithPhoneNb,
                      textAlign: TextAlign.start),
                ),
                SizedBox(
                  height: Get.height * .06,
                ),
                Container(
                    width: Get.width,
                    height: Get.height * .35,
                    padding: const EdgeInsets.only(
                        right: ConstantSize.screenPadding * 3),
                    child: Image.asset(
                      ImageAssets.signInImage,
                      fit: BoxFit.fill,
                    )),
                SizedBox(
                  height: Get.height * .04,
                ),
                Center(
                  child: Container(
                    width: Get.width - (ConstantSize.screenPadding * 2),
                    padding: const EdgeInsets.only(
                        left: ConstantSize.commonBtnPadding,
                        right: ConstantSize.commonBtnPadding),
                    decoration: BoxDecoration(
                        color: AppColor.countryContainerColor,
                        // color: Colors.pink,
                        borderRadius: BorderRadius.circular(
                            ConstantSize.containerWelcomeRadius)),
                    child: Stack(
                      children: [
                        CountryCodePicker(
                          onInit: (value) {
                            signInViewModel.selectedCountryCode.value =
                                value?.dialCode ?? '';
                          },
                          padding: const EdgeInsets.all(0),
                          onChanged: (value) {
                            signInViewModel.selectedCountryCode.value =
                                value.dialCode ?? '';
                          },
                          initialSelection: 'Us',
                          hideMainText: true,
                          showFlagDialog: true,
                          showDropDownButton: false,
                          showFlagMain: true,
                          showFlag: true,
                          flagDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3)),
                          flagWidth: 30,
                        ),
                        SizedBox(
                          height: Get.height * .065,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: Get.width * .15,
                              ),
                              Obx(() => Text(
                                    '(${signInViewModel.selectedCountryCode.value})',
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  )),
                              SizedBox(
                                width: Get.width * .02,
                              ),
                              const LoadSvg(svgPath: SvgAssets.down_arrow),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 13),
                                child: VerticalDivider(
                                  color: AppColor.dividerColor,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(
                                width: Get.width * .02,
                              ),
                              Expanded(
                                  flex: 2,
                                  child: TextField(
                                    controller:
                                        signInViewModel.numberController,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      counter: SizedBox.shrink(),
                                    ),
                                    keyboardType: TextInputType.number,
                                    maxLines: 1,
                                    maxLength: 10,
                                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: ConstantSize.bottomScrollSize,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: 0.0,
            left: ConstantSize.screenPadding,
            right: ConstantSize.screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                  left: ConstantSize.commonBtnPadding * 2,
                  right: ConstantSize.commonBtnPadding * 2),
              child: RoundButton(
                  title: StringUtils.continuee,
                  onPress: () {
                    Utils.hideKeyBoard(context);
                    signInViewModel.onContinueClicked();
                  }),
            ),
            SizedBox(
              height: Get.height * .02,
            ),
            Container(
              width: Get.width,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(
                  left: ConstantSize.commonBtnPadding,
                  right: ConstantSize.commonBtnPadding),
              child: RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                    text: StringUtils.byTapingContinue,
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: ConstantSize.commonTxtSize,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        fontFamily: AppFonts.urbanistFamily),
                    children: <TextSpan>[
                      TextSpan(
                          text: StringUtils.terms,
                          style: TextStyle(
                              color: AppColor.backGroundColor,
                              fontSize: ConstantSize.commonTxtSize,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              fontFamily: AppFonts.urbanistFamily)),
                      TextSpan(
                          text: StringUtils.and,
                          style: TextStyle(
                              color: AppColor.blackColor,
                              fontSize: ConstantSize.commonTxtSize,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              fontFamily: AppFonts.urbanistFamily)),
                      TextSpan(
                          text: StringUtils.policy,
                          style: TextStyle(
                              color: AppColor.backGroundColor,
                              fontSize: ConstantSize.commonTxtSize,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              fontFamily: AppFonts.urbanistFamily)),
                    ]),
              ),
            ),
            SizedBox(
              height: ConstantSize.commonBottomPadding,
            ),
          ],
        ),
      ),
    );
  }
}
