import 'package:flutter/material.dart';
import 'package:service_provider_two/res/colors/app_color.dart';

import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';

class DaysContainer extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final Color textColor;
  final Color backgroundColor;
  final double fontSize;
  final String fontFamily;
  final double borderRadius;
  final double leftRightPadding;
  final double topBottomPadding;

   DaysContainer({
    Key? key,
    required this.title,
    required this.onPress,
    this.fontSize = ConstantSize.commonTxtSize,
    this.textColor = AppColor.viewLineColor,
    this.borderRadius = ConstantSize.containerWelcomeRadius,
    this.leftRightPadding = ConstantSize.commonBtnPadding ,
    this.backgroundColor = AppColor.whiteColor,
    this.fontFamily = AppFonts.urbanistFamily,
    this.topBottomPadding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: backgroundColor,borderRadius: BorderRadius.circular(borderRadius),shape: BoxShape.rectangle),
        padding: EdgeInsets.only(
            top: topBottomPadding,
            bottom: topBottomPadding,
            left: leftRightPadding,
            right: leftRightPadding),
        child: Text(
          title,
          style: TextStyle(
              fontSize: fontSize,
              fontFamily: fontFamily,color: textColor),
        ),
      ),
    );
  }
}
