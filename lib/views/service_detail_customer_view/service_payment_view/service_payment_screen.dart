import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/service_detail_customer_view/service_payment_view/payment_list_option_widget.dart';
import 'package:service_provider_two/views/service_detail_customer_view/service_payment_view/service_payment_controller.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/round_button.dart';


class ServicePaymentScreen extends StatefulWidget {
  const ServicePaymentScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ServicePaymentState();
  }
}

class _ServicePaymentState extends State<ServicePaymentScreen> {
  final ServicePaymentController _servicePaymentController =
      Get.put(ServicePaymentController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        surfaceTintColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: AppColor.blackColor,
            size: ConstantSize.backIconSize,
          ),
        ),
        centerTitle: true,
        title: TextBoldUrbanist(
          txt: 'Payment Method',
          textAlign: TextAlign.center,
          fontWeight: AppFonts.urbanistMediumWeight,
          textSize: ConstantSize.commonMediumTxtSize,
          txtColor: AppColor.blackColor,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              color: AppColor.whiteColor,
              width: Get.width,
              padding: const EdgeInsets.only(
                  left: ConstantSize.screenPadding,
                  right: ConstantSize.screenPadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * .023,
                    ),
                    TextBoldUrbanist(
                      txt: 'Select the payment method you want to use',
                      textAlign: TextAlign.center,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonTxtSize,
                      txtColor: AppColor.blackColor,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Obx(() => GestureDetector(
                          onTap: () {
                            if(index==_servicePaymentController.paymentList.length-1){
                              // _servicePaymentController.startGooglePay();
                            }
                          },
                          child: PaymentListOptionWidget(
                              title: _servicePaymentController
                                      .paymentList[index].title ,
                              cardStatus: _servicePaymentController
                                      .paymentList[index].cardStatus ,
                              icon: _servicePaymentController
                                      .paymentList[index].icon ,
                              selected: _servicePaymentController
                                      .paymentList[index].selected.value ),
                        ));
                      },
                      itemCount: _servicePaymentController.paymentList.length,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.liteBackGroundColor,
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.containerWelcomeRadius + 5)),
                          padding:
                              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: TextBoldUrbanist(
                            txt: 'Apply Promocode',
                            textAlign: TextAlign.center,
                            textSize: ConstantSize.commonTxtTwelveSize,
                            txtColor: AppColor.backGroundColor,
                          ),
                        ),
                        TextBoldUrbanist(
                          txt: '+Add New Card',
                          textAlign: TextAlign.center,
                          textSize: ConstantSize.commonTxtTwelveSize,
                          txtColor: AppColor.blackColor,
                        )
                      ],
                    )
                  ]))),
      bottomNavigationBar: Container(
          height: 120,
          decoration: const BoxDecoration(
            color: AppColor.whiteColor,
          ),
          width: Get.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                color: AppColor.silverColor,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextBoldUrbanist(
                      txt: 'Total amount',
                      textAlign: TextAlign.center,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonMediumTxtSize,
                      txtColor: AppColor.blackColor,
                    ),
                    TextBoldUrbanist(
                      txt: '\$40.00',
                      textAlign: TextAlign.center,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonMediumTxtSize,
                      txtColor: AppColor.greenColor,
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: ConstantSize.screenPadding),
                child: RoundButton(
                  title: "Continue",
                  onPress: () {
                    showPromocodeDialog();
                    // Get.toNamed(RoutesName.selectServiceDetailDateCustomerView);
                  },
                ),
              ),
            ],
          )),
    );
  }

  void showPromocodeDialog() {
    List<String> promoCodeList = [
      'Save 15% On Every Order',
      'Save 15% On Every Order',
      'Save 15% On Every Order',
      'Save 15% On Every Order'
    ];
    Get.bottomSheet(
        isDismissible: true,
        Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .48,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: ListView(children: [
              TextBoldUrbanist(
                txt: 'Apply Promocode',
                textAlign: TextAlign.center,
                textSize: ConstantSize.commonBigTxtSize,
                txtColor: AppColor.blackColor,
              ),
              SizedBox(
                height: Get.height * .02,
              ),
              const Divider(
                color: AppColor.dividerColor,
              ),
              SizedBox(
                height: Get.height * .03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: ConstantSize.screenPadding),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => InkWell(onTap: () {
                    Get.back();
                    // showThanksForBookingDialog();
                  },
                    child: Container(margin: const EdgeInsets.only(bottom: 15),padding: const EdgeInsets.all(ConstantSize.commonBtnPadding),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              ConstantSize.containerWelcomeRadius),
                          color: AppColor.countryContainerColor),
                      child: Row(
                        children: [
                          LoadSvg(svgPath: index%2==0?SvgAssets.promo_icon:SvgAssets.green_promo_icon,width: ConstantSize.bigIconSize+5,height: ConstantSize.bigIconSize+5,fit: BoxFit.fill,),
                          SizedBox(width: Get.width*.02,),Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
                            TextBoldUrbanist(
                              txt: promoCodeList[index],
                              textAlign: TextAlign.start,
                              textSize: ConstantSize.commonTxtTwelveSize,
                              txtColor: AppColor.blackColor,
                            ),
                            TextBoldUrbanist(
                              txt: 'Use Axis Credit card',
                              textAlign: TextAlign.start,
                              fontWeight: AppFonts.urbanistMediumWeight,
                              textSize: ConstantSize.commonSmallTxtSize,
                              txtColor: AppColor.viewLineColor,
                            ),
                          ],),
                          Spacer(),
                          TextBoldUrbanist(
                            txt: 'Apply',
                            textAlign: TextAlign.start,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.backGroundColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  itemCount: promoCodeList.length,
                ),
              )
            ])));
  }
}
/*void showThanksForBookingDialog(){
  Get.bottomSheet(
      isDismissible: true,
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
                              Get.toNamed(RoutesName.chatScreen);
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
                            onPress: () {
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
     *//* Container(
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
          ]))*//*
  );
}*/
