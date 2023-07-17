import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/continer_with_dropdownbtn.dart';
import 'package:service_provider_two/res/components/round_image.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/utils.dart';

class ChatUserProfileScreen extends StatefulWidget {
  const ChatUserProfileScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatUserProfileState();
  }
}

class _ChatUserProfileState extends State<ChatUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Utils.hideKeyBoard(context);
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColor.blackColor,
            size: ConstantSize.backIconSize,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          padding: const EdgeInsets.symmetric(horizontal: ConstantSize.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .01,
              ),
              RoundUserImage(
                path: ImageAssets.demoImageSecond,
                fromNetwork: false,
                widthHeight: Get.height * .2,
              ),
              SizedBox(
                height: Get.height * .014,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextBoldUrbanist(
                    txt: 'Andrew Chadwick',
                    textAlign: TextAlign.start,
                    textSize: ConstantSize.commonMediumTxtSize,
                    txtColor: AppColor.blackColor,
                  ),
                  SizedBox(
                    width: Get.width * .015,
                  ),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 15,
                  ),
                  TextBoldUrbanist(
                    txt: '4.0',
                    textAlign: TextAlign.start,
                    fontWeight: AppFonts.urbanistMediumWeight,
                    textSize: ConstantSize.commonMediumTxtSize,
                    txtColor: AppColor.viewLineColor,
                  ),
                ],
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              ContainerWithDropDownBtn(
                title: 'Member since October 2022',
                onPress: () {},
                enableDropDownBtn: false,
                backgroundColor: AppColor.liteSilverColor,
                borderColor: AppColor.liteSilverColor,
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              ContainerWithDropDownBtn(
                title: 'Report this member',
                textColor: AppColor.redColor,
                onPress: () {
                  Get.toNamed(RoutesName.chatReportUser);
                },
                enableDropDownBtn: false,
                backgroundColor: AppColor.liteSilverColor,
                borderColor: AppColor.liteSilverColor,
              )
            ],
          ),
        ),
      ),
    );
  }
}
