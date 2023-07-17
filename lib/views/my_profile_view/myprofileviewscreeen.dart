import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/views/profile_setup_second_view/profile_option_widget.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/network_image_widget.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import 'my_profile_controller.dart';

class MyProfileViewScreen extends StatelessWidget {
  const MyProfileViewScreen({super.key});
  @override
  Widget build(BuildContext context) {
    MyProfileController myProfileController = Get.put(MyProfileController());
    return SingleChildScrollView(
      child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: ConstantSize.screenPadding,
                right: ConstantSize.screenPadding),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(alignment: Alignment.center,
                      height: AppBar().preferredSize.height,
                      width: Get.width,
                      child: TextBoldUrbanist(
                        txt: 'My Profile',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      )),
                  SizedBox(height: Get.height * .04,),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Obx(() => NetworkImageWidget(borderRadius: BorderRadius.circular(400),
                        height: ConstantSize.myProfileImageSize,
                        width: ConstantSize.myProfileImageSize,
                        fit: BoxFit.cover,imageUrl: myProfileController.userProfile.value,)),
                      GestureDetector(
                        onTap: () => myProfileController.pickImage(),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            SvgAssets.captureImageIcon,
                            semanticsLabel: 'captureImageIcon logo',
                            width: ConstantSize.bigIconSize,
                            height: ConstantSize.bigIconSize,
                          ),
                        ),
                      ),
                    ],
                  )
                  ,
                  SizedBox(height: Get.height * .015,),
                  Obx(
                    ()=> TextBoldUrbanist(
                      txt: myProfileController.userName.value,
                      textAlign: TextAlign.start,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      fontFamily: AppFonts.urbanistFamily,
                      textSize: ConstantSize.commonTxtSize,
                      txtColor: AppColor.blackColor,
                    ),
                  ),
                  SizedBox(height: Get.height * .03,),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Obx(() =>
                        Column(
                          children: [
                            ProfileOptionWidget(leadingIcon: myProfileController.options[index][0],
                              lable: myProfileController.options[index][1],
                              icon: Icons.chevron_right,
                              onPress: () {
                                myProfileController.onMenuClick(index);
                              },
                                endDividerShow:    index==myProfileController.options.length-1?true:false),
                          ],
                        ),
                      );
                    }, itemCount:myProfileController.options.length,),
                  SizedBox(height: ConstantSize.bottomScrollSize,),
                ]),
          )
      ),
    );
  }

}