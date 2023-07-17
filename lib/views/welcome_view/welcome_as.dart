import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/res/components/TextBoldUrbanist.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/utils/string_utils.dart';
import 'package:service_provider_two/views/welcome_view/welcome_as_controller.dart';
import '../../res/components/round_button.dart';
import '../../utils/utils.dart';

class WelcomeAsScreen extends StatefulWidget {
  const WelcomeAsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _WelcomeAsScreenState();
  }
}

class _WelcomeAsScreenState extends State<WelcomeAsScreen> {
  WelcomeAsController welcomeViewModel = Get.put(WelcomeAsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: Utils.commonAppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: AppColor.whiteColor,
          width: Get.width,
          padding: const EdgeInsets.all(ConstantSize.screenPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .15,
              ),
              SizedBox(
                  width: Get.width * .7 - (ConstantSize.commonBtnPadding * 2),
                  height: Get.height * .25,
                  child: Image.asset(
                    ImageAssets.welcomeImage,
                    fit: BoxFit.fill,
                  )),
            ],
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
            TextBoldUrbanist(txt: StringUtils.logIn),
            SizedBox(
              height: Get.height * .03,
            ),
            RoundButton(
                title: StringUtils.loginAsProvider,
                onPress: () {
                  welcomeViewModel.loginAsProvider();
                }),
            SizedBox(
              height: Get.height * .02,
            ),
            RoundButton(
                title: StringUtils.loginAsCustomer,
                onPress: () {
                  welcomeViewModel.loginAsCustomer();
                }),
            SizedBox(
              height: ConstantSize.commonBottomPadding,
            ),
          ],
        ),
      ),
    );
  }
}
