import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/constants_size.dart';
import '../colors/app_color.dart';

class AppBarCommon extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppColor.whiteColor,
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
    );
  }

}