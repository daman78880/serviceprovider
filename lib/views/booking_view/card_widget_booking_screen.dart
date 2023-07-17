import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';

class CardWidgetBookingScreen extends StatelessWidget {
  final String image;
  final String name;
  final String distance;
  final String address;
  final String specialty;
  final String date;
  final String time;
  final int money;
  final VoidCallback onStartClick;
  final VoidCallback onCancel;
  final VoidCallback onMessage;
  final VoidCallback makeAsCompleteClick;
  final VoidCallback completedClick;
  final VoidCallback cancelledClick;
  final int buttonShowStatus;
  final bool customerLogin;

  const CardWidgetBookingScreen(
      {super.key,
      required this.image,
      required this.name,
      required this.distance,
      required this.address,
      required this.date,
      required this.time,
      required this.specialty,
      required this.money,
      required this.onStartClick,
      required this.onCancel,
      required this.onMessage,
      required this.makeAsCompleteClick,
      required this.completedClick,
      required this.cancelledClick,
        this.buttonShowStatus = 0,
        this.customerLogin=true

      });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.dividerColor),
        borderRadius:
            BorderRadius.circular(ConstantSize.containerWelcomeRadius + 4),
      ),
      padding: const EdgeInsets.all(8),
      width: Get.width,
      margin: const EdgeInsets.only(top: 15),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
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
                    txt: specialty,
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
                    txt: distance,
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
                        txt: '$date | ' ,
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

          buttonShowStatus != 1?
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                padding:
                const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
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
                      txtColor: AppColor.greenColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .015,
              ),
              buttonShowStatus == 0
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: onCancel,
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.redColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(
                                ConstantSize.commonBtnRadius * 210)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          SvgAssets.cancelIcon,
                          width: ConstantSize.thirtySizeIcon - 10,
                          height: ConstantSize.thirtySizeIcon - 10,
                        )),
                  ),
                  SizedBox(
                    width: Get.width * .04,
                  ),
                  InkWell(
                    onTap: onMessage,
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.backGroundColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                ConstantSize.commonBtnRadius * 210)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          SvgAssets.messageIcon,
                          width: ConstantSize.thirtySizeIcon - 10,
                          height: ConstantSize.thirtySizeIcon - 10,
                        )),
                  ),
                  Spacer(),

                  Expanded(
                    flex: 2,
                    child: RoundButton(
                      title:  !customerLogin?"Start Now":"Generate OTP",
                      onPress: onStartClick,
                      height: Get.height * .055,
                      buttonPadding: ConstantSize.commonBtnPadding,
                      fontFamily: AppFonts.urbanistFamily,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      fontSize: ConstantSize.commonTxtSize,
                      textColor:  !customerLogin?AppColor.whiteColor: AppColor.backGroundColor,
                      buttonColor:   !customerLogin?AppColor.backGroundColor: AppColor.liteBackGroundColor,
                    ),
                  ),
                ],
              )
                  : buttonShowStatus == 1
                  ? RoundButton(
                title: "Mark As Complete",
                onPress: makeAsCompleteClick,
                buttonColor: AppColor.greenColor,
                fontFamily: AppFonts.urbanistFamily,
                fontWeight: AppFonts.urbanistBoldWeight,
                fontSize: ConstantSize.commonTxtSize,
              )
                  : buttonShowStatus == 2
                  ? RoundButton(
                title: "Completed",
                onPress: completedClick,
                buttonColor: AppColor.liteGreen,
                textColor: AppColor.greenColor,
                fontFamily: AppFonts.urbanistFamily,
                fontWeight: AppFonts.urbanistBoldWeight,
                fontSize: ConstantSize.commonTxtSize,
              )
                  : buttonShowStatus ==3 ? RoundButton(title: "Canceled", onPress: cancelledClick,buttonColor: AppColor.liteRedColor,textColor: AppColor.redColor,    fontFamily: AppFonts.urbanistFamily,
                fontWeight: AppFonts.urbanistBoldWeight,
                fontSize: ConstantSize.commonTxtSize,):Container()
            ],
          ):
          // !customerLogin?Column(
        Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
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
                padding:
                const EdgeInsets.only(left: 25, right: 25, top: 5, bottom: 5),
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
                      txtColor: AppColor.greenColor,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * .015,
              ),
              buttonShowStatus == 0
                  ? Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: onCancel,
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.redColor.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(
                                ConstantSize.commonBtnRadius * 210)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          SvgAssets.cancelIcon,
                          width: ConstantSize.thirtySizeIcon - 10,
                          height: ConstantSize.thirtySizeIcon - 10,
                        )),
                  ),
                  SizedBox(
                    width: Get.width * .04,
                  ),
                  InkWell(
                    onTap: onMessage,
                    child: Container(
                        decoration: BoxDecoration(
                            color: AppColor.backGroundColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(
                                ConstantSize.commonBtnRadius * 210)),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          SvgAssets.messageIcon,
                          width: ConstantSize.thirtySizeIcon - 10,
                          height: ConstantSize.thirtySizeIcon - 10,
                        )),
                  ),
                  Spacer(),

                  Expanded(
                    flex: 2,
                    child: RoundButton(
                      title:  !customerLogin?"Start Now":"Generate OTP",
                      onPress: onStartClick,
                      height: Get.height * .055,
                      buttonPadding: ConstantSize.commonBtnPadding,
                      fontFamily: AppFonts.urbanistFamily,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      fontSize: ConstantSize.commonTxtSize,
                      textColor:  !customerLogin?AppColor.whiteColor: AppColor.backGroundColor,
                      buttonColor:   !customerLogin?AppColor.backGroundColor: AppColor.liteBackGroundColor,
                    ),
                  ),
                ],
              )
                  : buttonShowStatus == 1
                  ? RoundButton(
                title: "Mark As Complete",
                onPress: makeAsCompleteClick,
                buttonColor: AppColor.greenColor,
                fontFamily: AppFonts.urbanistFamily,
                fontWeight: AppFonts.urbanistBoldWeight,
                fontSize: ConstantSize.commonTxtSize,
              )
                  : buttonShowStatus == 2
                  ? RoundButton(
                title: "Completed",
                onPress: completedClick,
                buttonColor: AppColor.liteGreen,
                textColor: AppColor.greenColor,
                fontFamily: AppFonts.urbanistFamily,
                fontWeight: AppFonts.urbanistBoldWeight,
                fontSize: ConstantSize.commonTxtSize,
              )
                  : buttonShowStatus ==3 ? RoundButton(title: "Canceled", onPress: cancelledClick,buttonColor: AppColor.liteRedColor,textColor: AppColor.redColor,    fontFamily: AppFonts.urbanistFamily,
                fontWeight: AppFonts.urbanistBoldWeight,
                fontSize: ConstantSize.commonTxtSize,):Container()
            ],
          )
          // ):Container()

        ],
      ),
    );
  }
}
