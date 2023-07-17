import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/service_detail_view/service_detail_controller.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/network_image_widget.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';

class ServiceDetailScreen extends StatefulWidget {
  const ServiceDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ServiceDetailScreenState();
  }
}

class _ServiceDetailScreenState extends State<ServiceDetailScreen> {
  final ServiceDetailController _servieDetailController = Get.put(ServiceDetailController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Utils.commonAppBar(title: 'Service Details',centerTitle: true),
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.only(
              left: ConstantSize.screenPadding,
              right: ConstantSize.screenPadding),
          child: Container(
              width: Get.width,
              margin: EdgeInsets.only(
                  top: 5, bottom: ConstantSize.commonBottomPadding),
              decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(
                      ConstantSize.containerWelcomeRadius),
                  border: Border.all(color: AppColor.viewLineColor)),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: ConstantSize.screenPadding - 5,
                  right: ConstantSize.screenPadding - 5,
                  top: ConstantSize.screenPadding - 5,
                  bottom: ConstantSize.screenPadding - 5,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                        ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: Image.asset(
                                ImageAssets.demoImage,
                                fit: BoxFit.fill,
                                width: ConstantSize.bigIconSize * 2.5,
                                height: ConstantSize.bigIconSize * 2.5,
                              ),
                            ),

                    //       Obx(
                    //           ()=> NetworkImageWidget(borderRadius: BorderRadius.circular(40),
                    //             width: ConstantSize.bigIconSize * 2.5,
                    //                         height: ConstantSize.bigIconSize * 2.5,
                    //           fit: BoxFit.cover,imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',),
                    //       ),
                          SizedBox(
                            width: Get.width * .04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBoldUrbanist(
                                txt: _servieDetailController.serviceId.value.substring(0,10),
                                textAlign: TextAlign.center,
                                textSize: ConstantSize.commonSmallTxtSize,
                                fontWeight: AppFonts.poppinsMediumWeight,
                                txtColor: AppColor.backGroundColor,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Obx(
                                ()=> TextBoldUrbanist(
                                  txt: _servieDetailController.name.value,
                                  textAlign: TextAlign.center,
                                  fontWeight: AppFonts.poppinsMediumWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                              ),
                              Obx(
                                ()=> TextBoldUrbanist(
                                  txt: _servieDetailController.subCategory.value,
                                  textAlign: TextAlign.center,
                                  fontWeight: AppFonts.poppinsMediumWeight,
                                  textSize: ConstantSize.commonSmallTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 5, bottom: 5),
                            decoration: BoxDecoration(
                                color: _servieDetailController.buttonStatus != 3
                                    ? AppColor.liteGreen
                                    : AppColor.liteRedColor,
                                borderRadius: BorderRadius.circular(
                                    ConstantSize.containerWelcomeRadius - 2)),
                            child: Obx(
                                  ()=>TextBoldUrbanist(
                                txt: 'Price \$${_servieDetailController.price.value}.00',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistBoldWeight,
                                textSize: 12,
                                txtColor: _servieDetailController.buttonStatus != 3
                                    ? AppColor.greenColor
                                    : AppColor.redColor,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      const Divider(
                        color: AppColor.dividerColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),

                      /*Without ListView Code*/

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBoldUrbanist(
                            txt: 'Service',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          Obx(
                                ()=>TextBoldUrbanist(
                            txt:  _servieDetailController.subCategory.value,
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBoldUrbanist(
                            txt: 'Order Id',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          TextBoldUrbanist(
                            txt:  _servieDetailController.serviceId.value.substring(0,10),
                            textAlign: TextAlign.end,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBoldUrbanist(
                            txt: 'Date & Time',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          Obx(
                                ()=>  TextBoldUrbanist(
                            txt: _servieDetailController.dateTime.value,
                            textAlign: TextAlign.end,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextBoldUrbanist(
                            txt: 'Address',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          Expanded(
                            child: Obx(
                                  ()=>TextBoldUrbanist(
                              txt:  _servieDetailController.address.value,
                              textAlign: TextAlign.end,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              textSize: ConstantSize.commonTxtSize,
                              txtColor: AppColor.viewLineColor,
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      const Divider(
                        color: AppColor.dividerColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      TextBoldUrbanist(
                        txt: 'House Cleaning Details',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistBoldWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      Obx(
                            ()=>  _servieDetailController.livingRoom.value>0? Column(
                              children: [
                                Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBoldUrbanist(
                                txt: 'Living Room',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                          ),
                          TextBoldUrbanist(
                                txt: '${_servieDetailController.livingRoom.value} Living Room  ',
                                textAlign: TextAlign.end,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.viewLineColor,
                          ),
                        ],
                      ),
                                SizedBox(
                                  height: Get.height * .01,
                                )
                              ],
                            ):Container()),

                Obx(
                        ()=>  _servieDetailController.bedRoom.value>0?   Column(
                          children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBoldUrbanist(
                                txt: 'Bedroom',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                              TextBoldUrbanist(
                                txt: '${_servieDetailController.bedRoom.value} Bedroom',
                                textAlign: TextAlign.end,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                            ],
                      ),
                            SizedBox(
                              height: Get.height * .01,
                            )
                          ],
                        ):Container()),
                Obx(
                        ()=>  _servieDetailController.bathRoom.value>0?   Column(
                          children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBoldUrbanist(
                                txt: 'Bathroom',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                              TextBoldUrbanist(
                                txt: '${_servieDetailController.bathRoom.value} Bathroom',
                                textAlign: TextAlign.end,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                            ],
                      ), SizedBox(
                              height: Get.height * .01,
                            )
                          ],
                        ):Container()),
                Obx(
                        ()=>  _servieDetailController.kitchen.value>0?    Column(
                          children: [
                            Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBoldUrbanist(
                                txt: 'Kitchen',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                              TextBoldUrbanist(
                                txt: '${ _servieDetailController.kitchen.value} Kitchen',
                                textAlign: TextAlign.end,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                            ],
                      ),
                            SizedBox(
                              height: Get.height * .01,
                            )
                          ],
                        ):Container()),
                    Obx(()=> _servieDetailController.dinningRoom.value>0? Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBoldUrbanist(
                                txt: 'Dining Room',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                              TextBoldUrbanist(
                                txt: '${_servieDetailController.dinningRoom.value} Dining Room',
                                textAlign: TextAlign.end,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                            ],
                          ),
                        SizedBox(
                          height: Get.height * .01,
                        )
                      ],
                    ):Container()),
                      const Divider(
                        color: AppColor.dividerColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      TextBoldUrbanist(
                        txt: 'Description',
                        textAlign: TextAlign.start,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                Obx(
                        ()=>TextBoldUrbanist(
                        txt: _servieDetailController.description.value,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.viewLineColor,
                      )),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      const Divider(
                        color: AppColor.dividerColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      TextBoldUrbanist(
                        txt: 'Attachments',
                        textAlign: TextAlign.start,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextBoldUrbanist(
                            txt: 'Pictures',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          Obx(
                                ()=>TextBoldUrbanist(
                            txt: '${ _servieDetailController.imageListt.length} pictures',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                    /*  SizedBox(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.only(right: 15),
                            height: 90,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.containerWelcomeRadius),
                              child: Image.asset(
                                _servieDetailController.imageList[index],
                                fit: BoxFit.fill,
                                height: 90,
                              ),
                            ),
                          ),
                          itemCount: _servieDetailController.imageList.length,
                        ),
                      ),*/
                      SizedBox(
                        height: 100,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            padding: const EdgeInsets.only(right: 15),
                            height: 90,
                            width: Get.width/2-(ConstantSize.screenPadding*1.4),
                            // child: ClipRRect(
                            //   borderRadius: BorderRadius.circular(
                            //       ConstantSize.containerWelcomeRadius),
                            //   child: Image.asset(s
                            //     _servieDetailController.imageList[index],
                            //     fit: BoxFit.fill,
                            //     height: 90,
                            //   ),
                            // ),
                            child: NetworkImageWidget(borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                              // width: ConstantSize.bigIconSize * 2.5,
                              height: 90,
                              fit: BoxFit.fill,imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',),
                          ),
                          itemCount: _servieDetailController.imageListt.length,
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: ConstantSize.screenPadding),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBoldUrbanist(
                              txt: 'Total Earnings',
                              textAlign: TextAlign.start,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              textSize: 12,
                              txtColor: AppColor.blackColor,
                            ),
                            Obx(
                              ()=> TextBoldUrbanist(
                                txt: '\$${_servieDetailController.price}.00',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: 12,
                                txtColor: AppColor.backGroundColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      _servieDetailController.buttonStatus == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RoundButton(
                                  title: "Cancel",
                                  onPress: () {
                                    _servieDetailController.onCancelServiceClick();
                                  },
                                  buttonColor: AppColor.redColor,
                                  width: (Get.width / 2) -
                                      ConstantSize.screenPadding * 2.3,
                                    height: Get.height * .055,
                                  fontSize: ConstantSize.commonTxtTwelveSize,
                                  fontFamily: AppFonts.poppinsFamily,
                                  fontWeight: AppFonts.poppinsMediumWeight,
                                ),
                                _servieDetailController.bookingScreenController.customerLogin?
                                RoundButton(
                                  title: 'Gererate OTP',
                                  onPress: () {
                                    _servieDetailController.onStartGenerateOtpClick();
                                  },
                                  width: (Get.width / 2) -
                                      ConstantSize.screenPadding * 2.3,height: Get.height * .055
                                  , fontSize: ConstantSize.commonTxtTwelveSize,
                                  fontFamily: AppFonts.poppinsFamily,
                                  fontWeight: AppFonts.poppinsMediumWeight,) :
                                RoundButton(
                                title: _servieDetailController.comeFromBookingScreenStatus.value?'Start Now':'Confirm',
                                      onPress: () {
    if(_servieDetailController.comeFromBookingScreenStatus.value) {
      _servieDetailController.onStartGenerateOtpClick();
    }else{
      _servieDetailController.onConfirmBookingClick();

    }
                                      },
                                      width: (Get.width / 2) -
                                          ConstantSize.screenPadding * 2.3,height: Get.height * .055
                                      , fontSize: ConstantSize.commonTxtTwelveSize,
                                    fontFamily: AppFonts.poppinsFamily,
                                    fontWeight: AppFonts.poppinsMediumWeight,)
                              ],
                            )
                          :
                      _servieDetailController.buttonStatus == 1
                          ? RoundButton(
                              title: "Mark As Complete",
                              onPress: () {
                                   _servieDetailController.onMakerAsCompleteClick();
                                 },
                              buttonColor: AppColor.greenColor,
                            )
                          :
                      _servieDetailController.buttonStatus == 2
                          ? RoundButton(
                              title: "Completed",
                              onPress: () {
                                Utils.hideKeyBoard(context);
                                Get.back();
                              },
                              buttonColor: AppColor.liteGreen,
                              textColor: AppColor.greenColor,
                        fontSize: ConstantSize.commonTxtSize,
                            )
                          :
                      _servieDetailController.buttonStatus == 3
                          ? RoundButton(
                              title: "Canceled",
                              onPress: () {
                                Get.back();
                              },
                              buttonColor: AppColor.liteRedColor,
                              textColor: AppColor.redColor,
                            )
                          : Container(),
                    ]),
              )),
        )));
  }

}
