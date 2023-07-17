
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:service_provider_two/res/components/InputFieldCommon.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/continer_with_dropdownbtn.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../select_service_detail_date_view/selected_service_detail_time_controller.dart';
import '../select_service_detail_view/selected_service_detail_controller.dart';
import 'add_location_controller.dart';


class AddLocationServiceScreen extends StatefulWidget {
  const AddLocationServiceScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddLocationServiceState();
  }
}

class _AddLocationServiceState extends State<AddLocationServiceScreen> {
  final AddLocationController _addLocationController =
      Get.put(AddLocationController(),permanent: true);
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(30.596403, 76.843269),
    zoom: 8.4746,
  );
  final Set<Marker> _latLen = <Marker>{
  };


  //   @override
  //   void dispose() {
  //     _addLocationController.clearResource();
  //   super.dispose();
  // }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        _addLocationController.clearResource();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              _addLocationController.clearResource();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColor,
              size: ConstantSize.backIconSize,
            ),
          ),
          centerTitle: true,
          title: TextBoldUrbanist(
            txt: 'Your Address/Location',
            textAlign: TextAlign.center,
            fontWeight: AppFonts.urbanistMediumWeight,
            textSize: ConstantSize.commonMediumTxtSize,
            txtColor: AppColor.blackColor,
          ),
        ),
        body: Stack(
                children: [
                  Container(
                    height: Get.height,
                  ),
                   SizedBox(
                      width: Get.width,
                      height: Get.height * .43-AppBar().preferredSize.height,
                      child:Obx(
                            ()=>  GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: _kGooglePlex,
                                myLocationEnabled: true,
                                markers: _addLocationController.markers.value,
                              // markers: _latLen,
                                compassEnabled: false,
                                zoomControlsEnabled: false,
                                onMapCreated: (GoogleMapController controller) {
                                  // _addLocationController.controller.complete(controller);
                                  _addLocationController.controller =controller;
                                },

                      ),
                    ),

                  ),
                  Positioned(bottom: 0,left: 0,right: 0,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                        width: Get.width,
                        height:Get.height * .605-AppBar().preferredSize.height,
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(
                                  ConstantSize.containerWelcomeRadius),
                              topLeft: Radius.circular(
                                  ConstantSize.containerWelcomeRadius)),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.blackColor.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 10,
                              offset:
                              const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: ConstantSize.screenPadding),
                        child: GestureDetector(
                          onTap: () => Utils.hideKeyBoard(context),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height*.43,
                                child: ListView(
                                  children: [
                                    Center(child:    TextBoldUrbanist(
                                      txt: 'Location Details',
                                      textAlign: TextAlign.start,
                                      textSize: ConstantSize.commonMediumTxtSize,
                                      txtColor: AppColor.blackColor,
                                    ),),
                                    SizedBox(
                                      height: Get.height*.015,
                                    ),
                                    const Divider(color: AppColor.dividerColor,),
                                    SizedBox(
                                      height: Get.height*.015,
                                    ),
                                    TextBoldUrbanist(
                                      txt: 'Pin code',
                                      textAlign: TextAlign.start,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonTxtSize,
                                      txtColor: AppColor.blackColor,
                                    ),
                                    SizedBox(
                                      height: ConstantSize.commonBtwSpaceForForm,
                                    ),
                                    InputFieldCommon(
                                      controller:
                                      _addLocationController.pinCodeEditController,
                                      hint: "Pin code",
                                      focusNode: _addLocationController.pinCodeNode,
                                      nextFocusNode:
                                      _addLocationController.landMarkNode,
                                      keyBoardType: TextInputType.number,
                                    ),
                                    SizedBox(
                                      height: Get.height * .02,
                                    ),
                                    TextBoldUrbanist(
                                      txt: 'Landmark',
                                      textAlign: TextAlign.start,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonTxtSize,
                                      txtColor: AppColor.blackColor,
                                    ),
                                    SizedBox(
                                      height: ConstantSize.commonBtwSpaceForForm,
                                    ),
                                    InputFieldCommon(
                                      controller:
                                      _addLocationController.landMarkEditController,
                                      hint: "Landmark",
                                      focusNode: _addLocationController.landMarkNode,
                                    ),
                                    SizedBox(
                                      height: Get.height * .02,
                                    ),
                                    TextBoldUrbanist(
                                      txt: 'Address',
                                      textAlign: TextAlign.start,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonTxtSize,
                                      txtColor: AppColor.blackColor,
                                    ),
                                    SizedBox(
                                      height: ConstantSize.commonBtwSpaceForForm,
                                    ),
                                    Obx(()=> ContainerWithDropDownBtn(borderColor: AppColor.liteBorderColor,title: _addLocationController.address.value, onPress: _addLocationController.addressClick,enableDropDownBtn: false,)),

                                  ],
                                ),
                              ),
                              RoundButton(
                                title: "Continue",
                                onPress: _addLocationController.onClick,

                                  fontSize: ConstantSize.commonMediumTxtSize,
                                  fontWeight: AppFonts.poppinsMediumWeight,
                                  fontFamily: AppFonts.poppinsFamily
                              )
                            ],
                          ),
                        )),
                  ),
                ]),


      ),
    );
  }
}
