import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/res/components/round_button.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/string_utils.dart';


class IntroScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _introScreenState();
  }
}

class _introScreenState extends State<IntroScreen> {
  final List<Widget> imgList = [
    Image.asset(
      ImageAssets.introFirstImage,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.introSecondImage,
      fit: BoxFit.fill,
    ),
    Image.asset(
      ImageAssets.introThirdImage,
      fit: BoxFit.fill,
    )
  ];
  final List<String> imgListTxt = [
  StringUtils.introFirstTitle,
  StringUtils.introSecondTitle,
  StringUtils.introThirdTitle
  ];
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
          if(currentIndex.value>0){
            currentIndex.value--;
            controller.jumpToPage(currentIndex.value);
          }
        } else if (details.velocity.pixelsPerSecond.dx < 0) {
          if(currentIndex.value<2){
            currentIndex.value++;
            controller.jumpToPage(currentIndex.value);
          }
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(ConstantSize.screenPadding),
                color: AppColor.whiteColor,
                width: Get.width,
                  child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .15,
                    ),
                    Container(
                      color:AppColor.whiteColor,
                        width: Get.width-(ConstantSize.commonBtnPadding*2),
                        height: Get.height * .3,
                        child: PageView(
                          scrollBehavior:   ScrollConfiguration.of(context).copyWith(
                            dragDevices: {
                              PointerDeviceKind.touch,
                              PointerDeviceKind.mouse,
                            },
                          ),
                          allowImplicitScrolling: true,
                          scrollDirection: Axis.horizontal,
                          controller: controller,
                          onPageChanged: (index) {
                            currentIndex.value = index;
                          },
                          children: imgList,
                        )),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    ValueListenableBuilder(
                        valueListenable: currentIndex,
                        builder: (context, value, child) => Text(
                          imgListTxt[value],
                          style: const TextStyle(
                              fontSize: 25,
                              color: AppColor.blackColor,
                              fontWeight: AppFonts.urbanistBoldWeight,
                              fontFamily: AppFonts.urbanistFamily),
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(height: ConstantSize.bottomScrollSize,),
                  ],
                ),
              ),
            ]
          ),
        ),
        bottomNavigationBar: GestureDetector(
          onHorizontalDragEnd: (details) {
            if (details.velocity.pixelsPerSecond.dx > 0) {
              if(currentIndex.value>0){
                currentIndex.value--;
                controller.jumpToPage(currentIndex.value);
              }
            } else if (details.velocity.pixelsPerSecond.dx < 0) {
              if(currentIndex.value<2){
                currentIndex.value++;
                controller.jumpToPage(currentIndex.value);
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(bottom: 0.0, left: ConstantSize.screenPadding, right:ConstantSize.screenPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ValueListenableBuilder(
                    valueListenable: currentIndex,
                    builder: (context, value, child) => SmoothPageIndicator(
                      controller: controller,
                      onDotClicked: (index) {
                        currentIndex.value = index;
                        controller.jumpToPage(index);
                      },
                      count: imgList.length,
                      axisDirection: Axis.horizontal,
                      effect: ExpandingDotsEffect(
                          dotHeight: 12,
                          dotWidth: 16,
                          activeDotColor: AppColor.backGroundColor                                  .withOpacity(
                              ConstantSize.backGroundColorOpacity),
                          dotColor: AppColor.inactiveDotColor),
                    )),
                SizedBox(
                  height: Get.height * .04 ,
                ),
                RoundButton(title: "Next", onPress: () {
                  if(currentIndex.value<2){
                    currentIndex.value++;
                    controller.jumpToPage(currentIndex.value);
                  }else
                  {
                    Get.toNamed(RoutesName.welcomeAsScreen);
                  }
                }),
                SizedBox(
                  height: ConstantSize.commonBottomPadding,
                ),
              ],),
          ),
        ),
      ),
    );
  }
}
