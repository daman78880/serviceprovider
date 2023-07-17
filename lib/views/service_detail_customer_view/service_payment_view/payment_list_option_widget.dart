import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';

class PaymentListOptionWidget extends StatelessWidget{
  final String title;
  final bool cardStatus;
  final String icon;
  final bool selected;
  PaymentListOptionWidget({super.key,required this.title,required this.cardStatus,required this.icon , required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              color: AppColor.dividerColor, width: 1),
          color: AppColor.liteSilverColor,
          borderRadius: BorderRadius.circular(
              ConstantSize.containerWelcomeRadius)),
      padding: EdgeInsets.symmetric(vertical: ConstantSize.commonBtnPadding*1.5,horizontal: ConstantSize.commonBtnPadding*2),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(icon,width: ConstantSize.bigIconSize,height: ConstantSize.bigIconSize,fit: BoxFit.fill,),
          SizedBox(width: Get.width*.03,),
       cardStatus?   Row(children: [
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 10,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 10,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 2,),
            LoadSvg(svgPath: SvgAssets.hide__detaildot,width: ConstantSize.smallIconSize,height:  ConstantSize.smallIconSize,fit: BoxFit.fill,),
            SizedBox(width: 10,),
            TextBoldUrbanist(
              txt: title,
              textAlign: TextAlign.center,
              fontWeight: AppFonts.urbanistMediumWeight,
              textSize: ConstantSize.commonMediumTxtSize,
              txtColor: AppColor.blackColor,
            ),
          ],):    TextBoldUrbanist(
         txt: title,
         textAlign: TextAlign.center,
         fontWeight: AppFonts.urbanistMediumWeight,
         textSize: ConstantSize.commonMediumTxtSize,
         txtColor: AppColor.blackColor,
       ),
          Spacer(),
          LoadSvg(svgPath: selected?SvgAssets.selected_radio_button:SvgAssets.un_selected_radio_button)
        ],
      ),
    );
  }

}