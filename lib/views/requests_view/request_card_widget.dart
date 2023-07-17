import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
class RequestCardWidget extends StatelessWidget{
  final String image;
  final String name;
  final String distance;
  final String address;
  final String specialty;
  final String date;
  final String time;
  final int money;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const RequestCardWidget(
      {super.key,
        required this.image,
        required this.name,
        required this.distance,
        required this.address,
        required this.date,
        required this.time,
        required this.specialty,
        required this.money,
        required this.onConfirm,
        required this.onCancel,
        });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.dividerColor),
        borderRadius: BorderRadius.circular(
            ConstantSize.containerWelcomeRadius + 4),
      ),
      padding: EdgeInsets.all(8),
      width: Get.width,
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                 image ,
                  fit: BoxFit.fill,
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
              color:AppColor.countryContainerColor,
              borderRadius: BorderRadius.circular(
                  ConstantSize.containerWelcomeRadius + 4),
            ),
            padding: const EdgeInsets.only(left: 25, right: 25,top: 5,bottom: 5),
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
                  txtColor: AppColor.backGroundColor,
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
                  onPress: onCancel,
                  buttonColor: AppColor.redColor,
                  fontSize: ConstantSize.commonTxtTwelveSize,
                  fontFamily: AppFonts.poppinsFamily,
                  fontWeight: AppFonts.poppinsMediumWeight,
                  height: Get.height * .055,
                  buttonPadding: ConstantSize.commonBtnPadding,
                ),
              ),
              SizedBox(
                width: Get.width * .04,
              ),
              Expanded(
                flex: 1,
                child: RoundButton(
                  title: "Confirm",
                  onPress: onConfirm,
                  fontSize: ConstantSize.commonTxtTwelveSize,
                  fontFamily: AppFonts.poppinsFamily,
                  fontWeight: AppFonts.poppinsMediumWeight,
                  height: Get.height * .055,
                  buttonPadding: ConstantSize.commonBtnPadding,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

}