import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/round_button.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../utils/constants_size.dart';

class HomeEmptyServiceScreen extends StatefulWidget {
  const HomeEmptyServiceScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeEmptyState();
  }
}

class _HomeEmptyState extends State<HomeEmptyServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  alignment: Alignment.center,
                  color: AppColor.whiteColor,
                  width: Get.width,
                  padding: const EdgeInsets.only(
                      left: ConstantSize.screenPadding,
                      right: ConstantSize.screenPadding),
                  child: Column(children: [
                    SizedBox(
                      height: AppBar().preferredSize.height,
                      child: Row(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            height: ConstantSize.homeImageSize - 10,
                            width: ConstantSize.homeImageSize - 10,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    ConstantSize.containerWelcomeRadius),
                                color: AppColor.backGroundColor),
                            child: Image.asset(
                              ImageAssets.splashImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: Get.width * .04,
                          ),
                          TextBoldUrbanist(
                            txt: 'My Services',
                            textAlign: TextAlign.start,
                            textSize: ConstantSize.commonMediumTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .2,
                    ),
                    SizedBox(
                        height: Get.height * .3,
                        width: Get.width - ConstantSize.screenPadding * 6,
                        child: Image.asset(
                          ImageAssets.emptyService,
                          fit: BoxFit.fill,
                        )),
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    TextBoldUrbanist(
                      txt: 'No services Yet!!!',
                      textAlign: TextAlign.start,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: 20,
                      txtColor: AppColor.blackColor,
                    ),
                    TextBoldUrbanist(
                      txt:
                          'Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.',
                      textAlign: TextAlign.center,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonMediumTxtSize,
                      txtColor: AppColor.viewLineColor,
                    ),
                    SizedBox(
                      height: Get.height * .02,
                    ),
                    RoundButton(
                      title: 'Add Services Now',
                      onPress: () {},
                      width: Get.width * .6,
                      textColor: AppColor.backGroundColor,
                      buttonColor: AppColor.liteBackGroundColor,
                    )
                  ])))),
    );
  }
}
