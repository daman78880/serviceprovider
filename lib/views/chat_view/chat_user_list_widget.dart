import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_image.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';

class ChatUserListWidget extends StatelessWidget {
  final String profilePath;
  final bool fromNetwork;
  final String name;
  final String lastMsg;
  final int msgCound;
  final String time;
  final VoidCallback onClick;

  ChatUserListWidget({super.key, required this.profilePath, required this.fromNetwork, required this.name, required this.lastMsg, required this.msgCound, required this.time,required this.onClick});

  @override
  Widget build(BuildContext context) {
    print('time is ${time}');
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: Get.width,
        color: AppColor.whiteColor,
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:
          CrossAxisAlignment.end,
          children: [
            RoundUserImage(
                fromNetwork: false,
                // path: ImageAssets.demoImageSecond),
                path: profilePath),
            SizedBox(
              width: 8,
            ),
            SizedBox(
              // width: Get.width-(ConstantSize.chatImageSize*2),
              width: Get.width-ConstantSize.chatImageSize*2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextBoldUrbanist(
                          txt: name,
                          textAlign: TextAlign.start,
                          textSize:
                          ConstantSize.commonTxtSize,fontWeight:
                        AppFonts.urbanistMediumWeight,
                          txtColor: AppColor.blackColor,
                          textOverFlow: TextOverflow.ellipsis,
                        ),
                      ),
                      msgCound>0?    CircleAvatar(
                        maxRadius: 10,
                        backgroundColor: AppColor.backGroundColor,
                        child: Center(
                          child: TextBoldUrbanist(
                            txt: '$msgCound',
                            textAlign: TextAlign.center,
                            fontWeight: AppFonts
                                .urbanistMediumWeight,
                            textSize: ConstantSize
                                .commonSmallTxtSize,
                            txtColor: AppColor.whiteColor,
                          ),
                        ),
                      ):Container()
                    ],
                  ),
                  const SizedBox(height: 3,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextBoldUrbanist(
                          txt: lastMsg,
                          textAlign: TextAlign.start,
                          fontWeight:
                          AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize
                              .commonTxtTwelveSize,
                          txtColor: AppColor.viewLineColor,
                          textOverFlow: TextOverflow.ellipsis,
                        ),
                      ),
                      TextBoldUrbanist(
                        txt: time,
                        textAlign: TextAlign.start,
                        fontWeight:
                        AppFonts.urbanistMediumWeight,
                        textSize:
                        ConstantSize.commonSmallTxtSize,
                        txtColor: AppColor.viewLineColor,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}