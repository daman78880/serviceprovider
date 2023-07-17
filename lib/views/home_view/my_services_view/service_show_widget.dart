import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';

class ServiceShowWidget extends StatelessWidget {
  final double width;
  final double radius;
  final bool serviceActiveStatus;
  final String title;
  final FontWeight fontWeight;
  final String fontFamily;
  final Color titleTextColor;
  final Color backgroundColor;
  final double switchSize;
  final double titleTextSize;
  final Color switchActiveColor;
  final Color switchInActiveColor;
  final VoidCallback onServiceClick;
  final Function(bool) onChangeValue;

  ServiceShowWidget({super.key, this.width = 0, this.backgroundColor = AppColor
      .backGroundColor, this.radius = ConstantSize
      .containerWelcomeRadius, required this.title, this.fontWeight = AppFonts
      .urbanistMediumWeight, this.fontFamily = AppFonts.urbanistFamily,
    this.switchSize= 0.75, required this.serviceActiveStatus,
    this.titleTextColor=AppColor.blackColor,this.titleTextSize=ConstantSize.commonTxtSize
  ,this.switchActiveColor=AppColor.backGroundColor,this.switchInActiveColor=AppColor.switchOfColor,required this.onServiceClick,required this.onChangeValue});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onServiceClick,
      child: Container(
        width: width>0?width:Get.width -
            ConstantSize.screenPadding * 2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                radius),
            border: Border.all(color: serviceActiveStatus?AppColor.backGroundColor:AppColor.switchOfColor)),
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 15),
        child: Row(
          children: [
            SizedBox(width: 40, height: 40,
              child: Image.asset(
                serviceActiveStatus?ImageAssets.serviceActive: ImageAssets.serviceInActive, fit: BoxFit.fill,),),
            SizedBox(width: Get.width * .025,),
            TextBoldUrbanist(
              txt: title,
              textAlign: TextAlign.start,
              fontWeight: fontWeight,
              textSize: titleTextSize,
              txtColor: titleTextColor,
            ),
            Spacer(),
            Transform.scale(
              scale:switchSize,
              child:
              CupertinoSwitch(
                trackColor:switchInActiveColor ,
                activeColor:switchActiveColor ,
                value: serviceActiveStatus,
                onChanged: (value) =>
                {
                  onChangeValue(value)
                },
              ),
            )
          ],
        ),
      ),
    );
  }

}