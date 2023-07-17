import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/views/service_map_view/service_mapview_controller.dart';
import '../../res/assets/image_assets.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/loadsvg.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';

class ServiceMapView extends StatefulWidget {
  const ServiceMapView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ServiceMapViewState();
  }
}

class _ServiceMapViewState extends State<ServiceMapView> {
  final ServiceMapViewController _serviceMapViewController =
      Get.put(ServiceMapViewController());


  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(28.644800, 77.216721),
    zoom:   15.0,
  );

  TextEditingController otpController = TextEditingController();
  int comingStatus=0;

  @override
  void dispose() {
    print('cleaning streaming map dispose');
    _serviceMapViewController.positionStream?.cancel()?.then((value) => print('streaming cancel')).onError((error, stackTrace) => print('streaming cancel error :$error'));
    _serviceMapViewController.positionStream=null;

    // _serviceMapViewController.positionStream?.cancel();
    super.dispose();
  }




  @override
  void initState() {
    comingStatus=Get.arguments[0]??0;
    _serviceMapViewController.status.value=comingStatus;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Stack(
          children: [
            Container(
              height: Get.height,
            ),
            // Google map code below
            Obx(
              ()=>!_serviceMapViewController.mapReady.value? Container(
                alignment: Alignment.center,
                  width: Get.width,
                  height: _serviceMapViewController.status.value == 4? Get.height * .871 : Get.height * .66,
                child: TextBoldUrbanist(
                  txt: 'Loading....',
                  textAlign: TextAlign.center,
                  textSize: ConstantSize.commonMediumTxtSize,
                  txtColor: AppColor.blackColor,
                ),
              ): SizedBox(
                width: Get.width,
                height: _serviceMapViewController.status.value == 4? Get.height * .871:Get.height * .66,
                child: GoogleMap(
                  mapType: MapType.normal,
                  initialCameraPosition: _kGooglePlex,
                  myLocationEnabled: false,
                  compassEnabled: false,
                  zoomControlsEnabled: false,
                  markers: _serviceMapViewController.markers.value,
                  polylines: Set<Polyline>.of(_serviceMapViewController.polylines.values),
                  padding: EdgeInsets.only(top: Get.height/1.8 ),
                  myLocationButtonEnabled: true,
                  mapToolbarEnabled: true,
                  tiltGesturesEnabled: true,
                  onMapCreated: (GoogleMapController controller) {
                    _serviceMapViewController.controller=controller;
                  },
                ),
              ),
            ),

            //2 Bottom navigation view with interchanging when it need.
            // Showing status 4 dialog.
        Obx(() => _serviceMapViewController.status.value == 4
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                        width: Get.width,
                        height: Get.height * .14,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54.withOpacity(0.1),
                                  blurRadius: 15.0,
                                  offset: const Offset(0.0, 0.75))
                            ],
                            color: AppColor.whiteColor,
                            borderRadius: BorderRadius.circular(
                                ConstantSize.commonBottomDialogRadius)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.center,crossAxisAlignment: CrossAxisAlignment.center,children: [
                                InkWell(
                                  onTap: () {
                                    _serviceMapViewController.onMessageClick();
                                  },
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: AppColor.backGroundColor.withOpacity(0.4),
                                          borderRadius: BorderRadius.circular(
                                              ConstantSize.commonBtnRadius * 210)),
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(14),
                                      child: SvgPicture.asset(
                                        SvgAssets.messageIcon,
                                        width: ConstantSize.thirtySizeIcon - 8,
                                        height: ConstantSize.thirtySizeIcon - 8,
                                      )),
                                ),
                                SizedBox(width: Get.width*.06,),
                                InkWell(
                                  onTap: () {
                                    _serviceMapViewController.loadMap();
                               _serviceMapViewController.status.value=1;
                               Future.delayed(
                                   const Duration(
                                       seconds: 5), () {
                                 _serviceMapViewController.startTimer();
                               });
                                  },
                                  /*child: SvgPicture.asset(
                                    SvgAssets.startServiceGreenIcon,
                                    width: 50,
                                    height:50,
                                    fit: BoxFit.fill,
                                  ),*/
                                  child: SvgPicture.asset(
                                    SvgAssets.startServiceGreenIcon,
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.fill,
                                  ),
                                ),

                              ],)
                            ])))
                : Container()),
           // Showing  status 0-1 dialog
           Obx(() => _serviceMapViewController.status.value == 0 ||
                    _serviceMapViewController.status.value == 1
                ? Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Obx(
                      () => GestureDetector(
                        onDoubleTap: () {
                          // only for debug mode
                          _serviceMapViewController.showOtpEnderDialog();
                        },
                        child: Container(
                          width: Get.width,
                          height: Get.height * .35,
                          padding: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54.withOpacity(0.1),
                                    blurRadius: 15.0,
                                    offset: const Offset(0.0, 0.75))
                              ],
                              color: AppColor.whiteColor,
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.commonBottomDialogRadius)),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Obx(
                              ()=> TextBoldUrbanist(
                                    txt: _serviceMapViewController.specialtyName.value,
                                    textAlign: TextAlign.center,
                                    textSize: ConstantSize.commonMediumTxtSize,
                                    txtColor: AppColor.blackColor,
                                  ),
                                ),
                                SizedBox(
                                  height: Get.height * .01,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 20),
                                  width: Get.width - 28,
                                  decoration: BoxDecoration(
                                      color: AppColor.whiteColor,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(ConstantSize
                                                  .commonBottomDialogRadius -
                                              5)),
                                      border: Border.all(
                                          color: AppColor.dividerColor)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(800),
                                            child: Image.asset(
                                              ImageAssets.demoImageSecond,
                                              fit: BoxFit.fill,
                                              width: ConstantSize.homeImageSize,
                                              height: ConstantSize.homeImageSize,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * .025,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Obx(
                                                    ()=> TextBoldUrbanist(
                                                  txt: _serviceMapViewController.name.value,
                                                  textAlign: TextAlign.start,
                                                  fontWeight:
                                                      AppFonts.urbanistMediumWeight,
                                                  textSize:
                                                      ConstantSize.commonTxtSize,
                                                  txtColor: AppColor.blackColor,
                                                ),
                                              ),
                                              Obx(
                                                    ()=> TextBoldUrbanist(
                                                  txt: _serviceMapViewController.specialtyName.value,
                                                  textAlign: TextAlign.start,
                                                  fontWeight:
                                                      AppFonts.urbanistMediumWeight,
                                                  textSize: ConstantSize
                                                      .commonSmallTxtSize,
                                                  txtColor: AppColor.blackColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Obx(
                                                    ()=> TextBoldUrbanist(
                                                  txt: _serviceMapViewController.distance.value,
                                                  textAlign: TextAlign.start,
                                                  fontWeight:
                                                      AppFonts.urbanistMediumWeight,
                                                  textSize: ConstantSize
                                                      .commonSmallTxtSize,
                                                  txtColor: AppColor.viewLineColor,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Icon(
                                                    Icons.calendar_month,
                                                    color:
                                                        AppColor.backGroundColor,
                                                    size: ConstantSize
                                                            .smallIconSize *
                                                        1.5,
                                                  ),
                                                  Obx(
                                                        ()=> TextBoldUrbanist(
                                                      txt: _serviceMapViewController.dateTime.value,
                                                      textAlign: TextAlign.start,
                                                      fontWeight: AppFonts
                                                          .urbanistMediumWeight,
                                                      textSize: ConstantSize
                                                          .commonSmallTxtSize,
                                                      txtColor:
                                                          AppColor.viewLineColor,
                                                    ),
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
                                      Obx(
                                            ()=> TextBoldUrbanist(
                                          txt: _serviceMapViewController.address.value,
                                          textAlign: TextAlign.start,
                                          fontWeight: AppFonts.urbanistMediumWeight,
                                          textSize: ConstantSize.commonSmallTxtSize,
                                          txtColor: AppColor.blackColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * .01,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.countryContainerColor,
                                          borderRadius: BorderRadius.circular(
                                              ConstantSize
                                                      .containerWelcomeRadius +
                                                  4),
                                        ),
                                        padding: const EdgeInsets.only(
                                            left: 25,
                                            right: 25,
                                            top: 5,
                                            bottom: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextBoldUrbanist(
                                              txt: 'Total Earnings',
                                              textAlign: TextAlign.start,
                                              fontFamily: AppFonts.poppinsFamily,
                                              fontWeight:
                                                  AppFonts.poppinsMediumWeight,
                                              textSize: ConstantSize
                                                  .commonTxtTwelveSize,
                                              txtColor: AppColor.blackColor,
                                            ),
                                            Obx(
                                                  ()=> TextBoldUrbanist(
                                                txt: '${_serviceMapViewController.amount.value}.00',
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight:
                                                    AppFonts.poppinsMediumWeight,
                                                textSize: ConstantSize
                                                    .commonTxtTwelveSize,
                                                txtColor: (_serviceMapViewController
                                                                .status.value ==
                                                            0 ||
                                                        _serviceMapViewController
                                                                .status.value ==
                                                            2)
                                                    ? AppColor.backGroundColor
                                                    : AppColor.greenColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * .015,
                                      ),
                                      _serviceMapViewController.status.value == 0
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: RoundButton(
                                                    // title: "Cancel",
                                                    title: "Chat",
                                                    onPress: () {
                                                      Get.back();
                                                    },
                                                    buttonColor: AppColor
                                                        .liteBackGroundColor,
                                                    fontFamily:
                                                        AppFonts.poppinsFamily,
                                                    fontWeight: AppFonts
                                                        .poppinsMediumWeight,
                                                    height: Get.height * .055,
                                                    buttonPadding: ConstantSize
                                                        .commonBtnPadding,
                                                    textColor:
                                                        AppColor.backGroundColor,
                                                    fontSize: ConstantSize.commonTxtTwelveSize,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * .04,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: RoundButton(
                                                    // title: "Confirm",
                                                    title: "Start Now",
                                                    onPress: () {
                                                      _serviceMapViewController.loadMap();
                                                      _serviceMapViewController.onChangeButtonStatus(1);
                                                      // Future.delayed(
                                                      //     const Duration(
                                                      //         seconds: 5), () {
                                                      //   _serviceMapViewController
                                                      //       .onChangeButtonStatus(
                                                      //           2);
                                                      // });
                                                    },
                                                    fontFamily:
                                                        AppFonts.poppinsFamily,
                                                    fontWeight: AppFonts
                                                        .poppinsMediumWeight,
                                                    height: Get.height * .055,
                                                    buttonPadding: ConstantSize
                                                        .commonBtnPadding,
                                                    textColor:
                                                        AppColor.whiteColor,
                                                  ),
                                                ),
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: RoundButton(
                                                    title: "Chat",
                                                    onPress: () {
                                                      _serviceMapViewController.onMessageClick();
                                                    },
                                                    buttonColor:
                                                        AppColor.backGroundColor,
                                                    fontFamily:
                                                        AppFonts.poppinsFamily,
                                                    fontWeight: AppFonts
                                                        .poppinsMediumWeight,
                                                    height: Get.height * .055,
                                                    buttonPadding: ConstantSize
                                                        .commonBtnPadding,
                                                    textColor:
                                                        AppColor.whiteColor,
                                                    fontSize: ConstantSize.commonTxtTwelveSize,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Get.width * .04,
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      const LoadSvg(
                                                          svgPath: SvgAssets
                                                              .onWayIcon),
                                                      SizedBox(
                                                        width: Get.width * .01,
                                                      ),
                                                      TextBoldUrbanist(
                                                        txt: 'On the Way',
                                                        textAlign:
                                                            TextAlign.start,
                                                        fontFamily: AppFonts
                                                            .poppinsFamily,
                                                        fontWeight: AppFonts
                                                            .poppinsMediumWeight,
                                                        textSize: ConstantSize
                                                            .commonTxtTwelveSize,
                                                        txtColor:
                                                            AppColor.blackColor,

                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  )
                : Container()),
            // Showing  status 2 dialog
            // Back Button which is visible to left corner.
            Positioned(
              top: 40,
              left: 18,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(
                  ImageAssets.mapLeftArrow,
                  width: ConstantSize.homeImageSize,
                  height: ConstantSize.homeImageSize,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//_serviceMapViewController Status
//0 -> for Dialog box for chat and start now  service
//1 -> for Dialog box for chat and onTheWay  service
//2 -> for Dialog box for Otp Enter  service
//3 -> for Dialog box For service started Dialog
//4 ->  For showing dialog come from booking screen only two options message icon or start service .
