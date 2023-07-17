import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/components/round_button.dart';

import '../colors/app_color.dart';

class InterNetExceptionWidget extends StatefulWidget {
  final VoidCallback onPress;

  InterNetExceptionWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _internetExceptionWidgetState();
  }
}

class _internetExceptionWidgetState extends State<InterNetExceptionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .2,
              ),
              Icon(Icons.cloud_off,
                  color: AppColor.backGroundColor, size: Get.width * .5),
              SizedBox(
                height: Get.height * .05,
              ),
              Text(
                "internet_exception".tr,
                style: TextStyle(fontSize: 16, color: Colors.red),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Get.height * .05,
              ),
              ElevatedButton(
                onPressed: widget.onPress,
                child: Text(
                  "Retry".tr,style: TextStyle(color: Colors.white,fontSize: 14),
                ),
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14)),
                    backgroundColor: Colors.blue),
              ),
              RoundButton(
                  title: "Retry",
                onPress: () {

              },)
            ],
          ),
        ),
      ),
    );
  }
}
