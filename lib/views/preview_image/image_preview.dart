import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/colors/app_color.dart';

import '../../res/components/network_image_widget.dart';

class ImagePreviewC extends StatelessWidget {
  String path = Get.arguments[0];
  Uint8List? bitesImage = Get.arguments[1];
  bool onlinePreview = Get.arguments[2];
  bool assetImage = Get.arguments[3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      body: Stack(
        children: [
          Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                  onTap: () => Get.back(),
                  child: const Icon(
                    Icons.clear,
                    color: AppColor.whiteColor,
                    size: 25,
                  ))),
          Center(
            child: Container(
              width: Get.width,
              height: Get.height * .55,
              child: onlinePreview
                  ? NetworkImageWidget(
                      fit: BoxFit.cover,
                      imageUrl: path,
                    )
                  : kIsWeb
                      ? Image.memory(
                          bitesImage!,
                          fit: BoxFit.cover,
                        )
                      : assetImage?Image.asset(
                path,
                fit: BoxFit.cover,
              ):Image.file(
                          File(path),
                          fit: BoxFit.cover,
                        ),
            ),
          )
        ],
      ),
    );
  }
}
