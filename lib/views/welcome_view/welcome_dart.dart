import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/res/components/TextBoldUrbanist.dart';
import 'package:service_provider_two/res/components/container_with_icon_txt.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/utils/string_utils.dart';
import 'package:service_provider_two/views/welcome_view/welcomeviewmodel.dart';
import '../../res/components/round_button.dart';
import '../../utils/utils.dart';



class WelcomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  WelcomeViewModel welcomeViewModel = Get.put(WelcomeViewModel());


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        Constants.apiWorking=!Constants.apiWorking;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: Utils.commonAppBar(),
        body: SingleChildScrollView(
         scrollDirection: Axis.vertical,
         child: Container(
           color: AppColor.whiteColor,
           width: Get.width,
           padding: const EdgeInsets.all(ConstantSize.screenPadding),
           child: Column(
             children: [
               SizedBox(
                   width: Get.width * .7 - (ConstantSize.commonBtnPadding * 2),
                   height: Get.height * .25,
                   child: Image.asset(
                     ImageAssets.welcomeImage,
                     fit: BoxFit.fill,
                   )),
               SizedBox(
                 height: Get.height * .06,
               ),
               TextBoldUrbanist(txt: StringUtils.letsYouIn),
               SizedBox(
                 height: Get.height * .03,
               ),
               ContainerWithIconTxt(
                   image: ImageAssets.facebookIconImage,
                   title: StringUtils.continueWithFb,
                   onPress: () {
                     welcomeViewModel.onFacebookLoginClick();
                   }),
               SizedBox(
                 height: ConstantSize.commonBtwSpaceForForm,
               ),
               ContainerWithIconTxt(
                   image: ImageAssets.googleIconImage,
                   title:  StringUtils.continueWithGoogle,
                   onPress: () {
                     welcomeViewModel.onGoogleLoginClick();
                   }),
               kIsWeb?Container():Platform.isIOS==true? SizedBox(
                 height: ConstantSize.commonBtwSpaceForForm,):Container(),

               kIsWeb?Container():Platform.isIOS==true? ContainerWithIconTxt(
                   image: ImageAssets.appleIconImage,
                   title:  StringUtils.continueWithApple,
                   onPress: () {
                     welcomeViewModel.onAppleIdLoginClick();
                   }):Container(),
               SizedBox(
                 height: Get.height * .04,
               ),
               const Padding(
                 padding: EdgeInsets.only(
                     left: ConstantSize.screenPadding,
                     right: ConstantSize.screenPadding),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Expanded(
                         flex: 2,
                         child: Divider(
                           color: AppColor.viewLineColor,
                         )),
                     Expanded(
                       flex: 1,
                       child: Text(
                         'or',
                         style: TextStyle(
                             fontSize: ConstantSize.commonTxtSize,
                             color: AppColor.blackColor,
                             fontWeight: AppFonts.urbanistMediumWeight,
                             fontFamily: AppFonts.urbanistFamily),
                         textAlign: TextAlign.center,
                       ),
                     ),
                     Expanded(
                         flex: 2,
                         child: Divider(
                           color: AppColor.viewLineColor,
                         )),
                   ],
                 ),
               ),
               SizedBox(height: ConstantSize.bottomScrollSize,),

             ],
           ),
         ),
          ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 0.0, left: ConstantSize.screenPadding, right:ConstantSize.screenPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundButton(
                  title: StringUtils.signIn,
                  onPress: () {
                    welcomeViewModel.onSignInClick();
                  }),
              SizedBox(
                height:Get.height*.02,
              ),
              RichText(
                text:  TextSpan(
                    text: StringUtils.dontHaveAccount,
                    style: const TextStyle(
                        color: AppColor.blackColor,
                        fontSize: ConstantSize.commonTxtSize,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        fontFamily: AppFonts.urbanistFamily),
                    children: <TextSpan>[
                      TextSpan(
                          text:StringUtils.signUpSpace,
                          style: const TextStyle(
                              color: AppColor.backGroundColor,
                              fontSize: ConstantSize.commonTxtSize,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              fontFamily: AppFonts.urbanistFamily),
                          recognizer: TapGestureRecognizer()..onTap=(){
                            welcomeViewModel.onSignUpClick();
                          })
                    ]),
              ),
              SizedBox(
                height: ConstantSize.commonBottomPadding,
              ),
            ],),
        ),
      ),
    );
  }
}
