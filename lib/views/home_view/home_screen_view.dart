import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/booking_view/booking_screen_controller.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/network_image_widget.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';
import 'home_controller.dart';

class HomeScreenView extends StatefulWidget {
  const HomeScreenView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreenView> {
  HomeController homeController = Get.find<HomeController>();

  @override
  void initState() {
  /*  Future.delayed(const Duration(seconds: 3), () {
      serviceRequestDialog(name: 'daman',
          time: '10:00 AM',
          money: 541,
          date: '09 June 2023 | ',
          address: "S.S.Nagar Mohali",
          destination: '54KM',
          profileUrl: ImageAssets.demoImageSecond,speciality: 'Programming');
    });*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Container(
            color: AppColor.whiteColor,
            width: Get.width,
            padding: const EdgeInsets.only(
                left: ConstantSize.screenPadding,
                right: ConstantSize.screenPadding),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                alignment: Alignment.center,
                height: AppBar().preferredSize.height,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // ClipRRect(
                    //   borderRadius: BorderRadius.circular(200),
                    //   child: Image.network(
                    //     'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',
                    //     fit: BoxFit.fill,
                    //     width: ConstantSize.homeImageSize,
                    //     height: ConstantSize.homeImageSize,
                    //   ),
                    // ),
                    NetworkImageWidget(borderRadius: BorderRadius.circular(400),
                      width: ConstantSize.homeImageSize,
                          height: ConstantSize.homeImageSize,
                      fit: BoxFit.cover,imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',),


                    SizedBox(
                      width: Get.width * .04,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldUrbanist(
                          txt: 'Good Morning',
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonSmallTxtSize + 2,
                          txtColor: AppColor.viewLineColor,
                        ),
                        TextBoldUrbanist(
                          txt: 'Andrew Ainsleys',
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonMediumTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(
                      SvgAssets.notification,
                      semanticsLabel: 'notification logo',
                      width: ConstantSize.bigIconSize,
                      height: ConstantSize.bigIconSize,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(RoutesName.serviceMap,arguments: [0]);
                },
                child: SizedBox(
                    width: Get.width,
                    height: Get.height * .2,
                    child: Image.asset(
                      ImageAssets.homePromotionBanner,
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                height: Get.height * .023,
              ),
              TextBoldUrbanist(
                txt: 'My Services',
                textAlign: TextAlign.start,
                textSize: ConstantSize.commonMediumTxtSize,
                txtColor: AppColor.blackColor,
              ),
              SizedBox(
                height: Get.height * .008,
              ),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        homeController.changeBottonNavigationIndex(1);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ConstantSize.containerWelcomeRadius),
                            color: AppColor.backGroundColor
                                .withOpacity(ConstantSize.bannerOpacity)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      borderRadius: BorderRadius.circular(
                                          ConstantSize.commonBtnRadius)),
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 5, bottom: 5),
                                  child: Obx(
                                    ()=> TextBoldUrbanist(
                                      txt: '${homeController.bookingController.confirmBookingModelList.length>0?"${homeController.bookingController.confirmBookingModelList.length}+":"${homeController.bookingController.confirmBookingModelList.length}"} New Orders',
                                      textAlign: TextAlign.center,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonSmallTxtSize -
                                          2,
                                      txtColor: AppColor.backGroundColor,
                                    ),
                                  ),
                                ),
                                RotationTransition(
                                  turns: const AlwaysStoppedAnimation(30 / 360),
                                  child: Container(padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: AppColor.whiteColor.withOpacity(
                                            0.5),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              ConstantSize
                                                  .containerWelcomeRadius + 5),
                                          bottomRight: Radius.circular(
                                              ConstantSize
                                                  .containerWelcomeRadius + 5),
                                        )),
                                      child: const LoadSvg(
                                          svgPath: SvgAssets.receiptItem)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            TextBoldUrbanist(
                              txt: 'New Booking\nRequests',
                              textAlign: TextAlign.start,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              textSize: ConstantSize.commonMediumTxtSize,
                              txtColor: AppColor.blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: Get.width * .04,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        homeController.bookingController.tabIndex.value=1;
                        homeController.changeBottonNavigationIndex(3);
                      },
                      child: Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                ConstantSize.containerWelcomeRadius),
                            color: AppColor.backGroundColor
                                .withOpacity(ConstantSize.bannerOpacity)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RotationTransition(
                                  turns: const AlwaysStoppedAnimation(30 / 360),
                                  child: Container(padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                        color: AppColor.whiteColor.withOpacity(
                                            0.5),
                                        borderRadius: const BorderRadius.only(
                                          bottomLeft: Radius.circular(
                                              ConstantSize
                                                  .containerWelcomeRadius + 5),
                                          bottomRight: Radius.circular(
                                              ConstantSize
                                                  .containerWelcomeRadius + 5),
                                        )),
                                      child: const LoadSvg(
                                          svgPath: SvgAssets.swapIcon)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * .01,
                            ),
                            TextBoldUrbanist(
                              txt: 'Ongoing\nServices',
                              textAlign: TextAlign.start,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              textSize: ConstantSize.commonMediumTxtSize,
                              txtColor: AppColor.blackColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: Get.height * .03,),
              GestureDetector(
                onTap: () {
                  // int ran = Random().nextInt(2);
                  // if (ran == 1) {
                  //   Get.toNamed(RoutesName.emptyService);
                  // } else {
                  //   Get.toNamed(RoutesName.myService);
                  // }
                  homeController.onMyServiceClick();
                },
                child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        left: 13, right: 3, bottom: 0, top: 1),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ConstantSize.containerWelcomeRadius),
                        color: AppColor.yellowColor
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.containerWelcomeRadius)
                          ),
                          child: const LoadSvg(
                              svgPath: SvgAssets.homeBannerBookingIcon),
                        ),
                        SizedBox(width: Get.width * .04,),
                        TextBoldUrbanist(
                          txt: 'My Service',
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonMediumTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        Spacer(),
                        const LoadSvg(svgPath: SvgAssets.homeBannerYellowBoxes)
                      ],
                    )
                ),
              ),
              SizedBox(height: Get.height * .01,),
              GestureDetector(
                onTap: () => Get.toNamed(RoutesName.specialtyScreen),
                child: Container(alignment: Alignment.center,
                    padding: const EdgeInsets.only(
                        left: 13, right: 3, bottom: 0, top: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            ConstantSize.containerWelcomeRadius),
                        color: AppColor.liteGreen
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.containerWelcomeRadius)
                          ),
                          child: const LoadSvg(svgPath: SvgAssets.homeAddIconGreen),
                        ),
                        SizedBox(width: Get.width * .04,),
                        TextBoldUrbanist(
                          txt: 'Add New Services',
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonMediumTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        Spacer(),
                        const LoadSvg(svgPath: SvgAssets.homeBannerGreenPhoneIcon),
                        const LoadSvg(svgPath: SvgAssets.homeBannerGreenPhoneIcon)
                      ],
                    )
                ),
              )
            ])));
  }

  void serviceRequestDialog({
    required String profileUrl,
    required String name,
    required int money,
    required speciality,
    required String destination,
    required String address,
    required String date,
    required String time}) {
    Get.bottomSheet(
        isDismissible: true,
        Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .36,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft:
                    Radius.circular(ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                TextBoldUrbanist(
                  txt:'New Booking Requests' ,
                  textAlign: TextAlign.center,
                  textSize: ConstantSize.commonMediumTxtSize,
                  txtColor: AppColor.blackColor,
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                GestureDetector(
                  onTap: () {
                    Get.back();
                    Get.toNamed(RoutesName.serviceDetail,arguments: [0,false,0]);
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                    width: Get.width - 28,
                    decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        borderRadius: const BorderRadius.all(Radius.circular(
                            ConstantSize.commonBottomDialogRadius - 5)),
                        border: Border.all(color: AppColor.dividerColor)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(800),
                              child: Image.asset(
                                profileUrl,
                                fit: BoxFit.cover,
                                width: ConstantSize.homeImageSize,
                                height: ConstantSize.homeImageSize,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .025,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBoldUrbanist(
                                  txt: name,
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistMediumWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                                TextBoldUrbanist(
                                  txt: speciality,
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistMediumWeight,
                                  textSize: ConstantSize.commonSmallTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextBoldUrbanist(
                                  txt: destination,
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistMediumWeight,
                                  textSize: ConstantSize.commonSmallTxtSize,
                                  txtColor: AppColor.viewLineColor,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    const Icon(
                                      Icons.calendar_month,
                                      color: AppColor.backGroundColor,
                                      size: ConstantSize.smallIconSize * 1.5,
                                    ),
                                    TextBoldUrbanist(
                                      txt: '$date | ',
                                      textAlign: TextAlign.start,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonSmallTxtSize,
                                      txtColor: AppColor.viewLineColor,
                                    ),
                                    TextBoldUrbanist(
                                      txt: time,
                                      textAlign: TextAlign.start,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonSmallTxtSize,
                                      txtColor: AppColor.viewLineColor,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextBoldUrbanist(
                          txt: 'address',
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonSmallTxtSize,
                          txtColor: AppColor.viewLineColor,
                        ),
                        TextBoldUrbanist(
                          txt: address,
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonSmallTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        SizedBox(
                          height: Get.height * .01,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: AppColor.countryContainerColor,
                            borderRadius: BorderRadius.circular(
                                ConstantSize.containerWelcomeRadius + 4),
                          ),
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, top: 5, bottom: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBoldUrbanist(
                                txt: 'Total Earnings',
                                textAlign: TextAlign.start,
                                fontFamily: AppFonts.poppinsFamily,
                                fontWeight: AppFonts.poppinsMediumWeight,
                                textSize: ConstantSize.commonTxtTwelveSize,
                                txtColor: AppColor.blackColor,
                              ),
                              TextBoldUrbanist(
                                txt: '\$$money.00',
                                textAlign: TextAlign.start,
                                fontFamily: AppFonts.poppinsFamily,
                                fontWeight: AppFonts.poppinsMediumWeight,
                                textSize: ConstantSize.commonTxtTwelveSize,
                                txtColor: AppColor.backGroundColor
                                   ,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .015,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              flex: 1,
                              child: RoundButton(
                                title: "Cancel",
                                onPress: () {
                                  Get.back();
                                },
                                buttonColor: AppColor.redColor,
                                fontFamily: AppFonts.poppinsFamily,
                                fontWeight: AppFonts.poppinsMediumWeight,
                                fontSize: ConstantSize.commonTxtTwelveSize,
                                height: Get.height * .055,
                                buttonPadding:
                                ConstantSize.commonBtnPadding,
                              ),
                            ),
                            SizedBox(
                              width: Get.width * .04,
                            ),
                            Expanded(
                              flex: 1,
                              child: RoundButton(
                                title: "Confirm",
                                onPress: () {
                                  Get.back();
                                  Utils.hideKeyBoard(context);
                                  Get.toNamed(RoutesName.serviceMap,arguments: [0]);
                                },
                                fontFamily: AppFonts.poppinsFamily,
                                fontWeight: AppFonts.poppinsMediumWeight,
                                height: Get.height * .055,
                                buttonPadding:
                                ConstantSize.commonBtnPadding,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ])
            ])));
  }

}
