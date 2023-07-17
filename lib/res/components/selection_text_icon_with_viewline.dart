import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../utils/constants_size.dart';
import '../assets/svg_assets.dart';
import '../colors/app_color.dart';
import '../fonts/app_fonts.dart';
import 'TextBoldUrbanist.dart';
class SelectionTextIconWithViewline extends StatelessWidget{
  final String title;
  final bool selected;
  final VoidCallback onPress;


  const SelectionTextIconWithViewline({super.key,required this.title,required this.selected,required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Padding(
        padding:  EdgeInsets.only(top:8,bottom:  selected?0:8),
        child: Column(
          children: [
            selected?Divider(color: AppColor.dividerColor,):Container(),
            selected?SizedBox(height: 5,):Container(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextBoldUrbanist(
                  txt: title,
                  textAlign: TextAlign.start,
                  fontWeight: AppFonts.urbanistMediumWeight,
                  textSize: ConstantSize.commonTxtSize,
                  txtColor: AppColor.blackColor,
                ),
                Container(
                  width: ConstantSize.checkBoxSize,
                  height: ConstantSize.checkBoxSize,
                  child: SvgPicture.asset(
                      selected
                          ? SvgAssets.checkBox
                          : SvgAssets.unCheckBox,
                      semanticsLabel: 'CheckBox'),
                )
              ],
            ),
            selected?SizedBox(height: 5,):Container(),

            selected?Divider(color: AppColor.dividerColor,):Container(),
          ],
        ),
      ),
    );
  }

}