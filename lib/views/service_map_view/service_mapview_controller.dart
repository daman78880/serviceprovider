import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/loadsvg.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../respository/home_repository.dart';
import '../../utils/constants.dart';
import '../../utils/constants_size.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';
import '../booking_view/booking_screen_controller.dart';
import 'dart:ui' as ui;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class ServiceMapViewController extends GetxController {
  final _myRepo = HomeRepository();
  late StreamSubscription<Position>? positionStream = null;
  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.bestForNavigation,
    distanceFilter: 0,
  );
  final BookingScreenController _bookingScreenController =
      Get.find<BookingScreenController>();
  RxInt status = 0.obs;
  RxBool mapReady = false.obs;
  GoogleMapController? controller = null;

  // RxSet<Polyline> polyline = <Polyline>{}.obs;
  // Rx<Map<PolylineId, Polyline>> polylines = <Map<PolylineId, Polyline>>{}.obs;
  RxMap<PolylineId, Polyline> polylines = <PolylineId, Polyline>{}.obs;
  PolylinePoints polylinePoints = PolylinePoints();
  final RxSet<Marker> markers = <Marker>{}.obs;

  RxDouble lat = (0.0).obs;
  RxDouble lng = (0.0).obs;
  RxString name = ''.obs;
  RxString specialtyName = ''.obs;
  RxString address = ''.obs;
  RxString dateTime = ''.obs;
  RxString distance = ''.obs;
  RxInt amount = 0.obs;
  int selectedIndex = -1;
  bool firstTime = true;
  late Timer _timer;
  RxInt start = 60.obs;

  @override
  void onInit() {
    print('inside  map controller');

    // testPosition();
    setDate();

    super.onInit();
  }

  @override
  void onClose() {
    print('cleaning streaming map onClose');

    positionStream?.cancel()?.then((value) => print('streaming cancel')).onError((error, stackTrace) => print('streaming cancel error :$error'));
    positionStream=null;
    super.onClose();
  }

  void loadMap() {
    getPermissionForLatLang();
  }

  void setDate() {
    selectedIndex = Get.arguments[1] ?? -1;
    if (selectedIndex >= 0) {
      lat.value = _bookingScreenController
              .upComingBookingModelList[selectedIndex]
              .customer?[0]
              .customerServiceDetails
              ?.location
              ?.coordinates?[0] ??
          0;
      lng.value = _bookingScreenController
              .upComingBookingModelList[selectedIndex]
              .customer?[0]
              .customerServiceDetails
              ?.location
              ?.coordinates?[1] ??
          0;
      name.value = _bookingScreenController.customerLogin
          ? "${_bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.firstName} ${_bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.lastName}"
          : "${_bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.firstName} ${_bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.lastName}";
      specialtyName.value = _bookingScreenController
              .upComingBookingModelList[selectedIndex]
              .serviceProvider?[0]
              .serviceProviderDetails
              ?.categoriesName ??
          '';
      address.value = _bookingScreenController
              .upComingBookingModelList[selectedIndex]
              .customer![0]
              .customerServiceDetails
              ?.addressForService ??
          '';
      dateTime.value =
          "${Utils.formatApiExpireDate(_bookingScreenController.upComingBookingModelList[selectedIndex].customer![0].customerServiceDetails?.date ?? '')} | ${Utils.fomateTwelveHourTime(_bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0] ?? '')}";
      distance.value = Utils.convertMetersToKm(_bookingScreenController
              .upComingBookingModelList[selectedIndex]
              .serviceProvider![0]
              .calculatedDistance ??
          0);
      amount.value = int.parse(_bookingScreenController
              .upComingBookingModelList[selectedIndex]
              .serviceProvider?[0]
              .amount ??
          '0');
    }
  }

  void onChangeButtonStatus(int value) {
    status.value = value;
  }

  void getPermissionForLatLang() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      Get.snackbar("Permission Denied", 'Location permissions are denied');
      permission = await Geolocator.requestPermission();
    }
    if (permission == LocationPermission.deniedForever) {
      Get.snackbar("Permission Permanently Denied", 'Location Permanently permissions are denied');
    }
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      // _handleLocationPermission();
      _getCurrentPosition();
      print('permission granted');
      // Get.snackbar("Permission Granted", 'Permission Granted Successful');
    }
  }

  Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar("GPS OFF",
          'Location services are disabled. Please enable the services');
      return await Geolocator.openLocationSettings();
    } else {
      print('getting cureen location');
      // _getCurrentPosition();
      return true;
    }
  }

  Future<void> _getCurrentPosition() async {
    final hasPermission = await _handleLocationPermission();
    if (!hasPermission) return;
    if (firstTime) {
      firstTime = false;
      await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high)
          .then((Position position) async {
        List<LatLng> polylineCoordinates = [];
        var lat = LatLng(position.latitude, position.longitude);
    /*    getBytesFromAsset(ImageAssets.locationMarkerIcon, 80).then((value) {
          var myLat = LatLng(this.lat.value, this.lng.value);
          var customIcon = BitmapDescriptor.fromBytes(value);
          markers.add(Marker(
              markerId: MarkerId(myLat.toString()),
              position: myLat,
              infoWindow: InfoWindow(
                title: 'Desination',
                snippet: 'Customer location',
              ),
              icon: customIcon));
        });*/
        PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          'AIzaSyDOGwVObwVRbB7ue1rqkvyFbarZFDBHeuM',
          PointLatLng(this.lat.value, this.lng.value),
          PointLatLng(lat.latitude, lat.longitude),
        );
        if (result.points.isNotEmpty) {
          result.points.forEach((PointLatLng point) {
            polylineCoordinates.add(LatLng(point.latitude, point.longitude));
          });
        } else {
          print("error creating polygon:${result.errorMessage}");
        }
        _addPolyLine(polylineCoordinates);
        streamLocation();
      }).catchError((e) {
        debugPrint(e);
      });
    }
  }

  void streamLocation() {
    mapReady.value = true;
    positionStream = Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      print('inside streaming location');
      // do what you want to do with the position here
      var lat = LatLng(position!.latitude, position!.longitude);
      getBytesFromAsset(ImageAssets.locationMarkerCurrent, 80).then((value) {
        var customIcon = BitmapDescriptor.fromBytes(value);
        markers.add(Marker(
            markerId: MarkerId('currentUser'),
            position: lat,
            infoWindow: InfoWindow(
              title: 'Me',
              snippet: 'Your location',
            ),
            icon: customIcon));
      });
      if (positionStream != null) {
        controller?.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: lat, zoom: 15.0, bearing: 0, tilt: 0)));
        calculateDistance(
            lat.latitude, lat.longitude, this.lat.value, this.lng.value);
      }
    });
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      color: AppColor.backGroundColor,
      width: 5,
    );
    polylines[id] = polyline;
    // onAutoUpdate();
    // setState(() {});
  }

  void onMessageClick() async {
    var name =
        '${await SharePref.getString(Constants.firstName)} ${await SharePref.getString(Constants.lastName)}';
    var receiverName = _bookingScreenController.customerLogin
        ? "${_bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.firstName} ${_bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.lastName}"
        : "${_bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.firstName} ${_bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.lastName}";
    var senderId = await SharePref.getString(Constants.loginId);
    var receiverId = _bookingScreenController.customerLogin
        ? "${_bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.sId}"
        : _bookingScreenController.upComingBookingModelList[selectedIndex]
            .customer?[0].customerProfileDetails?.sId;
    var serviceId = _bookingScreenController
            .upComingBookingModelList[selectedIndex].serviceProvider?[0].sId ??
        '';
    var userId = Utils.getChatId(senderId, receiverId!, serviceId);
    print('receiver name before send is $receiverName');
    Get.toNamed(RoutesName.chatScreen, arguments: {
      'name': name,
      'serviceId': serviceId,
      'id': userId,
      'senderId': senderId,
      'receiverId': receiverId,
      "receiverName": receiverName,
    });
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  void enterOtp(String otp) {
    var serviceId = _bookingScreenController
            .upComingBookingModelList[selectedIndex].serviceProvider?[0].sId ??
        '';
    print('otp si :$otp service is :$serviceId');
    print('booking get api called');
    var data = {'otp': otp, '_id': serviceId};
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.bookingStartOtpApi(data).then((value) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("success start service api");
      }
      Get.back();
      serviceStartedDialog();
      // onChangeButtonStatus(3);
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      print('booking start service api');
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

  void onDetailPageClick() {
    // _bookingScreenController.getDataWithoutLoader();
    Get.offNamed(RoutesName.serviceDetail,
        arguments: [1, true, selectedIndex, 1]);
  }

  void generateOtp() {
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo
        .generateOtpBookingApi(_bookingScreenController
                .upComingBookingModelList[selectedIndex]
                .serviceProvider?[0]
                .sId ??
            '')
        .then((value) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("Opt Gernate successfully ${value.data}");
      }
      if (value.status == 200) {
        Utils.snackBar(value.data ?? '', 'Your Otp is');
      }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

  void showOtpEnderDialog() {
    BuildContext? context = Get.context!;
    var otpController = TextEditingController();
    Get.bottomSheet(
        isDismissible: true,
        Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .44,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: SingleChildScrollView(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextBoldUrbanist(
                      txt: 'Good Job Gurrr!',
                      textAlign: TextAlign.center,
                      textSize: ConstantSize.commonMediumTxtSize,
                      txtColor: AppColor.blackColor,
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
                          borderRadius: const BorderRadius.all(Radius.circular(
                              ConstantSize.commonBottomDialogRadius - 5)),
                          border: Border.all(color: AppColor.dividerColor)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextBoldUrbanist(
                            txt: 'You arrived at your destination',
                            textAlign: TextAlign.center,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                children: [
                                  TextBoldUrbanist(
                                    txt:
                                        'Now enter the security code below to start your service',
                                    textAlign: TextAlign.center,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtTwelveSize,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextBoldUrbanist(
                                        txt: 'Enter Code',
                                        textAlign: TextAlign.start,
                                        fontWeight:
                                            AppFonts.urbanistMediumWeight,
                                        textSize: ConstantSize.commonTxtSize,
                                        txtColor: AppColor.blackColor,
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 0),
                                    child: PinCodeTextField(
                                      errorTextSpace: 0,
                                      appContext: context,
                                      pastedTextStyle: TextStyle(
                                        color: Colors.green.shade600,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      length: 4,
                                      obscureText: false,
                                      obscuringCharacter: '*',
                                      animationType: AnimationType.fade,
                                      validator: (v) {
                                        return null;
                                      },
                                      keyboardType: TextInputType.number,
                                      pinTheme: PinTheme(
                                        shape: PinCodeFieldShape.box,
                                        borderRadius: BorderRadius.circular(5),
                                        fieldHeight: 45,
                                        fieldWidth: 45,
                                        activeFillColor:
                                            AppColor.countryContainerColor,
                                        inactiveFillColor:
                                            AppColor.countryContainerColor,
                                        activeColor:
                                            AppColor.countryContainerColor,
                                        inactiveColor:
                                            AppColor.countryContainerColor,
                                        selectedColor:
                                            AppColor.countryContainerColor,
                                        selectedFillColor:
                                            AppColor.countryContainerColor,
                                        // hasError ? Colors.orange : Colors.white,
                                      ),
                                      hintCharacter: '-',
                                      cursorColor: AppColor.blackColor,
                                      animationDuration:
                                          const Duration(milliseconds: 300),
                                      textStyle: const TextStyle(
                                          fontSize: ConstantSize.commonTxtSize,
                                          height: 1.6),
                                      backgroundColor: AppColor.whiteColor,
                                      enableActiveFill: true,
                                      // errorAnimationController: errorPinController,
                                      controller: otpController,
                                      onCompleted: (v) {
                                        if (kDebugMode) {
                                          print("Completed");
                                        }
                                      },
                                      onTap: () {
                                        if (kDebugMode) {
                                          print("Pressed");
                                        }
                                      },
                                      onChanged: (value) {
                                        if (kDebugMode) {
                                          print(value);
                                        }
                                      },

                                      beforeTextPaste: (text) {
                                        if (kDebugMode) {
                                          print("Allowing to paste $text");
                                        }
                                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                        return true;
                                      },
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => TextBoldUrbanist(
                                          txt: '00.${start.value}',
                                          textAlign: TextAlign.start,
                                          fontWeight:
                                              AppFonts.urbanistMediumWeight,
                                          textSize: ConstantSize.commonTxtSize,
                                          txtColor: AppColor.redColor,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => onResendClick(),
                                        child: TextBoldUrbanist(
                                          txt: 'Resend',
                                          textAlign: TextAlign.end,
                                          fontWeight:
                                              AppFonts.urbanistMediumWeight,
                                          textSize: ConstantSize.commonTxtSize,
                                          txtColor: AppColor.viewLineColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          TextBoldUrbanist(
                            txt:
                                'The security code has been sent to your Customer',
                            textAlign: TextAlign.center,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonSmallTxtSize,
                            txtColor: AppColor.backGroundColor,
                          ),
                          SizedBox(
                            height: Get.height * .015,
                          ),
                          RoundButton(
                            title: "Submit",
                            onPress: () {
                              if (otpController.text.length < 4) {
                                Get.snackbar('Invalid OPT', 'Please enter otp');
                              } else {
                                enterOtp(otpController.text.trim());
                                // _serviceMapViewController.onChangeButtonStatus(3);
                              }
                            },
                            width: Get.width - ConstantSize.screenPadding * 2.5,
                            buttonColor: AppColor.backGroundColor,
                            textColor: AppColor.whiteColor,
                          ),
                        ],
                      ),
                    ),
                  ]),
            )));
  }

  void serviceStartedDialog() {
    Get.bottomSheet(
        isDismissible: false,
        Container(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .44,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoadSvg(
                    svgPath: SvgAssets.doneService,
                    width: Get.width * .4,
                    height: Get.width * .4,
                  ),
                  TextBoldUrbanist(
                    txt: 'Your service is started',
                    textAlign: TextAlign.center,
                    fontWeight: AppFonts.poppinsMediumWeight,
                    fontFamily: AppFonts.poppinsFamily,
                    textSize: ConstantSize.commonMediumTxtSize,
                    txtColor: AppColor.blackColor,
                  ),
                  SizedBox(
                    height: Get.height * .01,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: ConstantSize.screenPadding * 1.5),
                    child: TextBoldUrbanist(
                      txt:
                          'Finish your service as fast as you can and come back to get more services offers',
                      textAlign: TextAlign.center,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonTxtSize,
                      txtColor: AppColor.viewLineColor,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .02,
                  ),
                  RoundButton(
                    title: "Go To Service Details Page",
                    onPress: () {
                      onDetailPageClick();
                      Utils.snackBar('errro', 'Implementation pending');
                      // comingStatus==4?Get.offNamed(RoutesName.homeScreen):Get.offNamed(RoutesName.serviceDetail,
                      //     arguments: [1,false]);
                    },
                    width: Get.width - ConstantSize.screenPadding * 2.5,
                    buttonColor: AppColor.backGroundColor,
                    textColor: AppColor.whiteColor,
                  ),
                ])));
  }

  void onResendClick() {
    if (start.value == 0) {
      start.value = 60;
      startTimer();
    } else {
      generateOtp();
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
        } else {
          start.value--;
        }
      },
    );
  }

  void getDistanceBetween(LatLng current, LatLng destination) {}

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void calculateDistance(
      double lat, double lng, double userLat, double usrLng) async {
    var dis = await Geolocator.distanceBetween(lat, lng, userLat, usrLng);
    int distance = dis.toInt();
    if (distance <= 200) {
      showOtpEnderDialog();
    } else {}
  }
}
