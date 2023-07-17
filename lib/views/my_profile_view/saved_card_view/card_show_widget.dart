import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/loadsvg.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
class CardShowWidget extends StatelessWidget{
  final bool red;
  final String bankName;
  final String lastCardNumber;
  final String cardExpirationDate;
  final String cardHolderName;
  final VoidCallback onEditClick;
  final VoidCallback onDeleteClick;
  CardShowWidget({Key? key, required this.onEditClick,required this.onDeleteClick,required this.red,required this.bankName,required this.lastCardNumber,required this.cardExpirationDate,required this.cardHolderName});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      child:red?  Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(ImageAssets.bgCardRedColor,fit: BoxFit.cover,width: Get.width ,height:Get.height * .26 ,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Get.height*.042,),
                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    TextBoldUrbanist(
                      txt: bankName,
                      textAlign: TextAlign.start,
                      fontFamily: AppFonts.poppinsFamily,
                      fontWeight: AppFonts.poppinsRagularWeight,
                      textSize: ConstantSize.commonBoldTxtSize-3,
                      txtColor: AppColor.whiteColor,
                    ),
                  ],
                ),
                SizedBox(height: Get.height*.03,),
                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    SizedBox(width: Get.width*.03,),
                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    SizedBox(width: Get.width*.03,),
                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    SizedBox(width: Get.width*.03,),
                    TextBoldUrbanist(
                      txt: Utils.getLastFourDigit(lastCardNumber),
                      textAlign: TextAlign.start,
                      fontFamily: AppFonts.poppinsFamily,
                      fontWeight: AppFonts.poppinsRagularWeight,
                      textSize: ConstantSize.commonBoldTxtSize-8,
                      txtColor: AppColor.whiteColor,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldUrbanist(
                          txt: 'Expiration',
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.liteRedColor,
                        ),
                        TextBoldUrbanist(
                          txt: cardExpirationDate,
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(width: Get.width*.03,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldUrbanist(
                          txt: 'Card holder ',
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.liteRedColor,
                        ),
                        TextBoldUrbanist(
                          txt: cardHolderName,
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.whiteColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: Get.height*.05,),

                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onEditClick,
                        child: TextBoldUrbanist(
                          txt: StringUtils.edit,
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtTwelveSize,
                          txtColor: AppColor.redColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onDeleteClick,
                        child: TextBoldUrbanist(
                          txt: StringUtils.delete,
                          textAlign: TextAlign.end,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtTwelveSize,
                          txtColor: AppColor.redColor,
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*.13,),
                  ],
                )
              ])
        ],
      ):Stack(
        children: [
          Image.asset(ImageAssets.bgCardPurpleColor,fit: BoxFit.cover,width: Get.width ,height:Get.height * .26 ,),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: Get.height*.042,),
                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    TextBoldUrbanist(
                      txt: bankName,
                      textAlign: TextAlign.start,
                      fontFamily: AppFonts.poppinsFamily,
                      fontWeight: AppFonts.poppinsRagularWeight,
                      textSize: ConstantSize.commonBoldTxtSize-3,
                      txtColor: AppColor.whiteColor,
                    ),
                  ],
                ),
                SizedBox(height: Get.height*.03,),
                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    const LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const  LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),

                    SizedBox(width: Get.width*.03,),

                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    SizedBox(width: Get.width*.03,),

                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                    SizedBox(width: Get.width*.01,),
                    SizedBox(width: Get.width*.03,),
                    TextBoldUrbanist(
                      txt: lastCardNumber,
                      textAlign: TextAlign.start,
                      fontFamily: AppFonts.poppinsFamily,
                      fontWeight: AppFonts.poppinsRagularWeight,
                      textSize: ConstantSize.commonBoldTxtSize-8,
                      txtColor: AppColor.whiteColor,
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldUrbanist(
                          txt: 'Expiration',
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.liteBackGroundColor,
                        ),
                        TextBoldUrbanist(
                          txt: cardExpirationDate,
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.whiteColor,
                        ),
                      ],
                    ),
                    SizedBox(width: Get.width*.03,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextBoldUrbanist(
                          txt: 'Card holder ',
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.liteBackGroundColor,
                        ),
                        TextBoldUrbanist(
                          txt: cardHolderName,
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.whiteColor,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: Get.height*.05,),
                Row(
                  children: [
                    SizedBox(width: Get.width*.13,),
                    Expanded(
                      child: GestureDetector(
                         onTap: () => onEditClick,
                        child: TextBoldUrbanist(
                          txt: StringUtils.edit,
                          textAlign: TextAlign.start,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtTwelveSize,
                          txtColor: AppColor.backGroundColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => onDeleteClick,
                        child: TextBoldUrbanist(
                          txt: StringUtils.delete,
                          textAlign: TextAlign.end,
                          fontFamily: AppFonts.poppinsFamily,
                          fontWeight: AppFonts.poppinsRagularWeight,
                          textSize: ConstantSize.commonTxtTwelveSize,
                          txtColor: AppColor.backGroundColor,
                        ),
                      ),
                    ),
                    SizedBox(width: Get.width*.13,),
                  ],
                )
              ])
        ],
      ),
      // child: Container(color: Colors.green,height:Get.height * .26),
    );
  }

}