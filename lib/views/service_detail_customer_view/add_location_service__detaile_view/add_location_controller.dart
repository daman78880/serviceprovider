import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import '../../../models/booking_service_send_data_model.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/loadsvg.dart';
import '../../../res/components/round_button.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../respository/add_service_repository.dart';
import '../../../utils/constants.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/share_pref.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import 'dart:async';
import 'dart:ui' as ui;

import '../../all_customerl_services_view/customer_service_list_detail_view/sub_category_controller.dart';
import '../../all_customerl_services_view/on_click_service_customer/on_click_service_controller.dart';
import '../select_service_detail_date_view/selected_service_detail_time_controller.dart';
import '../select_service_detail_view/selected_service_detail_controller.dart';
import '../service_detail_customer_controller.dart';

class AddLocationController extends GetxController {
  ServiceDetailCustomerController onClickServiceController =
      Get.find<ServiceDetailCustomerController>();
  SelectedServiceDetailController selectedServiceDetailController =
      Get.find<SelectedServiceDetailController>();
  SelectedServiceDetailDateController selectedServiceDetailDateController =
      Get.find<SelectedServiceDetailDateController>();
  OnClickServiceController _onClickServiceController =
      Get.find<OnClickServiceController>();

  final _myRepo = AddServiceRepository();
  TextEditingController pinCodeEditController = TextEditingController();
  TextEditingController landMarkEditController = TextEditingController();
  FocusNode pinCodeNode = FocusNode();
  FocusNode landMarkNode = FocusNode();
  RxString address = 'Address'.obs;
  double lat = 0;
  double lng = 0;
  RxSet<Marker> markers = <Marker>{}.obs;

  // final Completer<GoogleMapController> controller =
  // Completer<GoogleMapController>();
  late GoogleMapController controller;
  void clearResource({bool back = true}){
    Get.delete<SelectedServiceDetailController>(force: true);
    Get.delete<SelectedServiceDetailDateController>(force: true);
    Get.delete<AddLocationController>(force: true);
    if(back) {
      Get.back();
    }
  }

  void onClick() {
    // Get.toNamed(RoutesName.servicePaymentScreen);
    if (pinCodeEditController.text.trim().isNotEmpty) {
      if (landMarkEditController.text.trim().isNotEmpty) {
        if (address.isNotEmpty || address != 'Address') {
          // Get.offNamed(RoutesName.servicePaymentScreen);
          bookServiceApi();
        } else {
          Utils.snackBar('Address Empty', 'Please enter Address name');
        }
      } else {
        Utils.snackBar('LandMark Empty', 'Please enter LandMark name');
      }
    } else {
      Utils.snackBar('PinCode Empty', 'Please enter PinCode name');
    }
  }

  void bookServiceApi() {
    String serviceId = onClickServiceController.serviceId.trim();
    int livingRoom = selectedServiceDetailController.itemList[0].selected.value;
    int bedRoom = selectedServiceDetailController.itemList[1].selected.value;
    int bathRoom = selectedServiceDetailController.itemList[2].selected.value;
    int kitchenRoom =
        selectedServiceDetailController.itemList[3].selected.value;
    String startTime = selectedServiceDetailDateController.startTime.value;
    String date = selectedServiceDetailDateController.selectedDatee.value;
    String pinCodeForService = pinCodeEditController.text.trim();
    String landmark = landMarkEditController.text.trim();
    String addressForService = address.value.trim();
    List<String> coordinates = [lat.toString(), lng.toString()];
    List<String> imagesList = [];
    List<Uint8List> imagesBitesList = [];
    List<String> imagesNameList = [];
    selectedServiceDetailController.imageList.forEach((element) {
      if (element != null) {
        imagesList.add(element.path);
      }
    });
    selectedServiceDetailController.bitesImageList.forEach((element) {
      if (element != null) {
        imagesBitesList.add(element);
      }
    });
    selectedServiceDetailController.bitesImageNameList.forEach((element) {
      if (element != null) {
        imagesNameList.add(element);
      }
    });
    if (serviceId.isNotEmpty) {
      if (lat != 0 &&
          lng != 0 &&
          address.value != 'Address' &&
          address.value != '') {
        if (Constants.apiWorking) {
          print('address is ${addressForService}');
         var dataModel = BookingServiceSendDataModel(
              serviceProviderServiceId: serviceId,
              livingRoom: livingRoom.toString(),
              bedRoom: bedRoom.toString(),
              bathRoom: bathRoom.toString(),
              kitchen: kitchenRoom.toString(),
              startTime: startTime,
              date: date,
              pinCodeForService: pinCodeForService,
              landmark: landmark,
              addressForService: addressForService,
              coordinates: coordinates,
              imagesList: imagesList,
              imagesBitesList: imagesBitesList,
              imagesNameList: imagesNameList);
          BuildContext? context=Get.context;
          Utils.showDialogProgressDialog(context!, true);
          _myRepo.bookingService(0,dataModel).then((value ) {
            Utils.showDialogProgressDialog(context, false);
            if (kDebugMode) {
              print("success service booked");
            }
            if(value.status==200) {
              showThanksForBookingDialog();
            }
          }).onError((error, stackTrace) {
            Utils.showDialogProgressDialog(context, false);
            Utils.snackBar('Error', error.toString());
            if (kDebugMode) {
              print("error:${error.toString()}");
            }
          });
        } else {
          showThanksForBookingDialog();
        }
      } else {
        Utils.snackBar('Location error', 'Please select location');
      }
    } else {
      Utils.snackBar('Something error', 'Service booking id empty');
    }
  }

  void addressClick() async {
    BuildContext? context = Get.context;
    if (kIsWeb) {
      lat = 30.5911;
      lng = 76.8332;
      address.value = 'Isapur in Dera Bassi, Patiala, Punjab';
    } else {
      // lat = 30.5911;
      // lng = 76.8332;
      // address.value = 'Isapur in Dera Bassi, Patiala, Punjab';
      Prediction? p = await PlacesAutocomplete.show(
          context: context!,
          apiKey: StringUtils.mapKey,
          radius: 10000000,
          types: [],
          logo: const SizedBox.shrink(),
          strictbounds: false,
          mode: Mode.fullscreen,
          // Mode.fullscreen
          language: "en",
          components: [
            Component(Component.country, "fr"),
            Component(Component.country, "in"),
            Component(Component.country, "UK")
          ]);
      displayPrediction(p, context);
    }
  }

  Future<void> displayPrediction(Prediction? p, BuildContext context) async {
    if (p == null) {
      return;
    }
    final _places = GoogleMapsPlaces(
      apiKey: StringUtils.mapKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    final detail = await _places.getDetailsByPlaceId(p.placeId!);
    final geometry = detail.result.geometry!;
    lat = geometry.location.lat;
    lng = geometry.location.lng;
    address.value = p.description ?? '';
    Utils.hideKeyBoard(context);
    getBytesFromAsset(ImageAssets.locationMarkerIcon, 90).then((onValue) {
      var customIcon = BitmapDescriptor.fromBytes(onValue);
      markers.add(Marker(
          markerId: MarkerId("dsfnsdfk"),
          position: LatLng(lat, lng),
          infoWindow: const InfoWindow(
            title: 'Booking location',
            snippet: 'Your location',
          ),
          icon: customIcon));
    });
    controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(lat, lng), zoom: 16.0)));
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
  void showThanksForBookingDialog(){
    Get.bottomSheet(
        isDismissible: false,
        Container(
            padding: const EdgeInsets.only(top: 20, bottom: 30),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .45,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: ListView(
                shrinkWrap: true,

                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  LoadSvg(
                    svgPath: SvgAssets.doneService,
                    width: Get.width * .3,
                    height: Get.width * .3,
                  ),
                  TextBoldUrbanist(
                    txt: 'Thank you\nYour Booking is successful',
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
                        horizontal:
                        ConstantSize.screenPadding * 1.5),
                    child: TextBoldUrbanist(
                      txt:
                      'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum',
                      textAlign: TextAlign.center,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonTxtSize,
                      txtColor: AppColor.viewLineColor,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal:
                        ConstantSize.screenPadding * 1.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: RoundButton(
                            title: "Go to Home Page",
                            onPress: () {
                              Get.delete<ServiceDetailCustomerController>(force: true);
                              Get.delete<OnClickServiceController>(force: true);
                              Get.delete<SubCategoryController>(force: true);
                              Get.delete<SelectedServiceDetailController>(force: true);
                              Get.delete<SelectedServiceDetailDateController>(force: true);
                              Get.delete<AddLocationController>(force: true);
                              Get.offNamed(RoutesName.homeCustomerScreen)?.then((value) => clearResource(back: false));
                            },
                            buttonColor: AppColor.liteBackGroundColor,
                            textColor: AppColor.backGroundColor,
                            width: (Get.width / 2) -
                                ConstantSize.screenPadding * 2.3,height: Get.height * .055,
                            fontWeight: AppFonts.poppinsMediumWeight,
                            fontFamily: AppFonts.poppinsFamily,
                            fontSize: ConstantSize.commonTxtTwelveSize,

                          ),
                        ),
                        SizedBox(width: Get.width*.02,),
                        Expanded(
                          child: RoundButton(
                            title: "Message Workers",
                            onPress: ()async {

                              var name = '${await SharePref.getString(Constants.firstName)} ${await SharePref.getString(Constants.lastName)}';
                              var receiverName='${_onClickServiceController.subCategoryList[onClickServiceController.serviceProviderIndex].firstName??''} ${_onClickServiceController.subCategoryList[onClickServiceController.serviceProviderIndex]?.lastName??''}';
                             var receiverId = _onClickServiceController.subCategoryList[onClickServiceController.serviceProviderIndex].sId??'';
                              var serviceId =_onClickServiceController.subCategoryList[onClickServiceController.serviceProviderIndex].serviceDetails?.sId??'';
                              var senderId = await SharePref.getString(Constants.loginId);
                              var userId =  Utils.getChatId(senderId, receiverId!,serviceId);
                              print('receiver name before send is $receiverName');
                              Get.delete<ServiceDetailCustomerController>(force: true);
                              Get.delete<OnClickServiceController>(force: true);
                              Get.delete<SubCategoryController>(force: true);
                              Get.delete<SelectedServiceDetailController>(force: true);
                              Get.delete<SelectedServiceDetailDateController>(force: true);
                              Get.delete<AddLocationController>(force: true);
                              Get.offNamed(RoutesName.chatScreen,
                              arguments: {
                              'name': name,
                              'serviceId': serviceId,
                              'id': userId,
                              'senderId': senderId,
                              'receiverId': receiverId,
                              "receiverName":receiverName,
                              });
                              // Get.offNamed(RoutesName.chatScreen)?.then((value) => clearResource(back: false));
                            },
                            width: (Get.width / 2) -
                                ConstantSize.screenPadding * 2.3,height: Get.height * .055,
                            buttonPadding: ConstantSize.commonBtnPadding,
                            horizontalPadding:ConstantSize.commonBtnPadding*2 ,
                            fontWeight: AppFonts.poppinsMediumWeight,
                            fontFamily: AppFonts.poppinsFamily,
                            fontSize: ConstantSize.commonTxtTwelveSize,
                          ),
                        ),
                      ],
                    ),
                  )

                ]))
      /* Container(
          padding: EdgeInsets.only(top: 15, bottom: 15),
          alignment: Alignment.bottomCenter,
          width: Get.width,
          height: Get.height * .48,
          decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft:
                  Radius.circular(ConstantSize.commonBottomDialogRadius),
                  topRight: Radius.circular(
                      ConstantSize.commonBottomDialogRadius))),
          child: ListView(children: [
          ]))*/
    );
  }

}
