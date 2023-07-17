import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/home_view/my_services_view/my_service_controller.dart';
import 'package:service_provider_two/views/home_view/my_services_view/service_show_widget.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../utils/constants_size.dart';

class MyServicesScreen extends StatefulWidget {
  const MyServicesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyServicesState();
  }
}

class _MyServicesState extends State<MyServicesScreen> {
  final MyServiceController _myServiceController = Get.put(MyServiceController());
  bool tempStatus = true;

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
                              alignment: Alignment.topLeft,
                              height: ConstantSize.homeImageSize - 10,
                              width: ConstantSize.homeImageSize - 10,
                              padding:const EdgeInsets.all(5),
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
                            Spacer(),
                            GestureDetector(
                              onTap: () => showPopupMenu(),
                              child: SvgPicture.asset(
                                SvgAssets.filterIconThreeDot,
                                width: ConstantSize.thirtySizeIcon,
                                height: ConstantSize.thirtySizeIcon,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      TextBoldUrbanist(
                        txt: 'Set up your profile, You are just few steps away',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.viewLineColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Obx(
                              () => ServiceShowWidget(
                                title: _myServiceController
                                        .serviceListTwo[index].speciality,
                                serviceActiveStatus: _myServiceController
                                        .serviceListTwo[index]
                                        .activeStatus
                                        .value ,
                                onServiceClick: () {
                                  Get.offNamed(RoutesName.reviewServiceScreen,arguments: {'showActionTitle':true,"selectedIndex":index});
                                },
                                onChangeValue: (p0) {
                                  _myServiceController.serviceActiveOrDeactiveClick(_myServiceController
                                      .serviceListTwo[index].serviceId,index);
                                  // _myServiceController.onServiceStatusChange(
                                  //     index, p0);
                                },
                              ),
                            );/*  return Obx(
                              () => ServiceShowWidget(
                                title: _myServiceController
                                        .serviceList[index].title,
                                serviceActiveStatus: _myServiceController
                                        .serviceList[index]
                                        .activeStatus
                                        .value ,
                                onServiceClick: () {
                                  Get.toNamed(RoutesName.reviewServiceScreen,arguments: {'showActionTitle':true});
                                },
                                onChangeValue: (p0) {
                                  _myServiceController.onServiceStatusChange(
                                      index, p0);
                                },
                              ),
                            );*/
                          },
                          // itemCount: _myServiceController.serviceList.length,
                          itemCount: _myServiceController.serviceListTwo.length,
                          physics:const NeverScrollableScrollPhysics(),
                        ),
                      ),
                    ])))));
  }
  showPopupMenu() {
    BuildContext? context = Get.context;
    showMenu<String>(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius)),
      context: context!,color: AppColor.whiteColor,surfaceTintColor: AppColor.whiteColor,
      position: RelativeRect.fromDirectional(textDirection: TextDirection.rtl,top: 75,end:  100, start:30, bottom: 0),
      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(value: '1', child:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextBoldUrbanist(
              txt: 'Pause all',
              textAlign: TextAlign.end,
              fontWeight: AppFonts.urbanistMediumWeight,
              textSize: ConstantSize.commonMediumTxtSize,
              txtColor: AppColor.viewLineColor,
            ),
          ],
        )),
        PopupMenuItem<String>(value: '2', child:  Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextBoldUrbanist(
              txt: 'Activate All',
              textAlign: TextAlign.end,
              fontWeight: AppFonts.urbanistMediumWeight,
              textSize: ConstantSize.commonMediumTxtSize,
              txtColor: AppColor.viewLineColor,
            ),
          ],
        )),
        PopupMenuItem<String>(value: '3', child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextBoldUrbanist(
              txt: 'Add New Service',
              textAlign: TextAlign.end,
              fontWeight: AppFonts.urbanistMediumWeight,
              textSize: ConstantSize.commonMediumTxtSize,
              txtColor: AppColor.viewLineColor,
            ),
          ],
        )),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == null) return;
      //
      if (value == "1") {
        // _myServiceController.pauseAllServiceClick();
        _myServiceController.deActiveAllService();
      } else if (value == "2") {
        // _myServiceController.activeAllServiceClick();
        _myServiceController.activeAllService();
        //   code here
      } else {
        Get.offNamed(RoutesName.specialtyScreen);
        //   code here
      }
    });

  }
}
