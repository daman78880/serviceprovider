import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
class ProfileOptionWidget extends StatelessWidget{
  final String lable;
  final String leadingIcon;
  final IconData icon;
  final VoidCallback onPress;
  final bool endDividerShow;

   ProfileOptionWidget({Key? key,required this.leadingIcon,required this.lable,required this.icon,required this.onPress,this.endDividerShow=false}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Divider(color: AppColor.dividerColor),
      InkWell(onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 3,bottom: 3),
          child: Row(children: [
            SizedBox(
                width: ConstantSize.checkBoxSize ,
                height: ConstantSize.checkBoxSize ,
                child: SvgPicture.asset(leadingIcon)),
            SizedBox(width: Get.width*.03,),
            TextBoldUrbanist(
              txt: lable,
              textAlign: TextAlign.start,
              fontWeight: AppFonts.urbanistMediumWeight,
              fontFamily: AppFonts.urbanistFamily,
              textSize: ConstantSize.commonTxtSize,
              txtColor: AppColor.blackColor,
            ),
            Spacer(),
            Icon(icon,color: AppColor.iconArrowColor,size :ConstantSize.checkBoxSize+5)
          ],),
        ),
      ),
      endDividerShow?const Divider(color: AppColor.dividerColor):Container()
    ],);
  }

}