
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../utils/constants_size.dart';

class ImageShowContainer extends StatelessWidget {
  final File? title;
  final Uint8List? bitesImage;
  final VoidCallback onPress;
  final VoidCallback onDelete;
  final Color backgroundColor;
  final double borderRadius;
  final double leftRightPadding;
  final double topBottomPadding;

  const ImageShowContainer({
    Key? key,
    required this.title,
    required this.onPress,
    required this.onDelete,
    this.borderRadius = ConstantSize.containerWelcomeRadius,
    this.leftRightPadding = ConstantSize.commonBtnPadding,
    this.backgroundColor = AppColor.whiteColor,
    this.topBottomPadding = 0,
    this.bitesImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context)  {
    return InkWell(
      onTap: onPress,
      child:  title !=null ? Stack(fit: StackFit.expand,children: [
        Container(
          padding: EdgeInsets.only(top: 10,right: 8),
          child:   ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child:kIsWeb?Image.memory( bitesImage!,fit: BoxFit.fill,width: 200,height: 200,):Image.file(title!,fit: BoxFit.cover,)
          ),
        ),
        Positioned(top: 0,right: 0,child: InkWell(onTap: onDelete,
          child: SvgPicture.asset(
            SvgAssets.closeIcon,
            semanticsLabel: 'closeIcon',width: ConstantSize.backIconSize+3,height: ConstantSize.backIconSize+3,
          ),
        ),),
      ],
      )
          : Container(
        margin: const EdgeInsets.only(top: 10,right: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(color: AppColor.liteBorderColor),
            color: backgroundColor,
            borderRadius: BorderRadius.circular(borderRadius),
            shape: BoxShape.rectangle),

      ),
    );
  }
}
