import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/res/components/round_image.dart';
import 'package:service_provider_two/utils/authentication.dart';
import 'package:service_provider_two/utils/constants.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/utils.dart';
import '../add_service_view/add_servise_first_view/addservicefirstscreen.dart';
import 'chat_screen_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  ChatScreenController _chatScreenController = Get.put(ChatScreenController());
  String id = '';

  @override
  void initState() {
    setId();
    super.initState();
  }

  void setId() async {
    id = await SharePref.getString(Constants.loginId);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.hideKeyBoard(context);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed(RoutesName.chatUserProfile);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: Get.width - ConstantSize.screenPadding * 2,
                    height: AppBar().preferredSize.height,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: AppColor.blackColor,
                            size: ConstantSize.backIconSize,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .02,
                        ),
                        RoundUserImage(
                          path: ImageAssets.demoImage,
                          fromNetwork: false,
                          widthHeight: ConstantSize.homeImageSize - 5,
                        ),
                        SizedBox(
                          width: Get.width * .02,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => TextBoldUrbanist(
                                txt: _chatScreenController.receiverName.value,
                                textAlign: TextAlign.start,
                                textSize: ConstantSize.commonTxtSize,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                txtColor: AppColor.blackColor,
                              ),
                            ),
                            Row(
                              children: [
                                const LoadSvg(svgPath: SvgAssets.greenDot),
                                SizedBox(
                                  width: Get.width * .01,
                                ),
                                TextBoldUrbanist(
                                  txt: 'Online',
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistMediumWeight,
                                  textSize: ConstantSize.commonTxtTwelveSize,
                                  txtColor: AppColor.viewLineColor,
                                )
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        GestureDetector(
                            onTap: () {
                              Authentication.incrementMsgCount(
                                  _chatScreenController.id,
                                  _chatScreenController.receiverId);
                              Get.snackbar("Service not avialble",
                                  'try some time later');
                            },
                            child: const LoadSvg(svgPath: SvgAssets.callIcon)),
                        SizedBox(
                          width: Get.width * .02,
                        ),
                        GestureDetector(
                            onTap: () {
                              Get.snackbar("Service not avialble",
                                  'try some time later');
                            },
                            child:
                                const LoadSvg(svgPath: SvgAssets.chatMoreIcon)),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: AppColor.dividerColor,
                ),
                SizedBox(
                  width: Get.width * .02,
                ),
                TextBoldUrbanist(
                  txt: 'Today',
                  textAlign: TextAlign.start,
                  fontWeight: AppFonts.urbanistMediumWeight,
                  textSize: ConstantSize.commonTxtTwelveSize,
                  txtColor: AppColor.viewLineColor,
                ),
                Expanded(
                  child: Container(
                    width: Get.width,
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
                    margin: EdgeInsets.only(bottom: 80),
                    child: StreamBuilder(
                      stream: Authentication.getChat(_chatScreenController.id),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          _chatScreenController.scrollToBottom();
                          return ListView.builder(
                              controller:
                                  _chatScreenController.scrollController,
                              itemCount: snapshot.data?.size ?? 0,
                              itemBuilder: (BuildContext context, int index) {
                                int type =
                                    snapshot.data?.docs[index].get("msgType") ??
                                        1;
                                String msg =
                                    snapshot.data?.docs[index].get("msg") ?? "";
                                String senderId = snapshot.data?.docs[index]
                                        .get("senderId") ??
                                    "";
                                String path = (snapshot.data?.docs[index]
                                                .data()
                                                .containsKey("path") ??
                                            false == true) ==
                                        true
                                    ? snapshot.data?.docs[index].get("path") ??
                                        ""
                                    : "";
                                String msgTime =
                                    Utils.convertMillisecondsToTime(snapshot
                                            .data?.docs[index]
                                            .get("msgTime") ??
                                        0);
                                bool sendByMe =
                                    _chatScreenController.loginid == senderId;
                                double marginLeft =
                                    _chatScreenController.loginid == senderId
                                        ? 30
                                        : 0;
                                double marginRight =
                                    _chatScreenController.loginid == senderId
                                        ? 0
                                        : 30;
                                bool showTime = true;
                                bool showPic = false;

                                if (index == 0) {
                                  showPic = true;
                                } else {
                                  var preId = snapshot.data?.docs[index - 1]
                                          .get("senderId") ??
                                      "";
                                  var id = snapshot.data?.docs[index]
                                          .get("senderId") ??
                                      "";
                                  if (preId != id) {
                                    showPic = true;
                                  } else {
                                    showPic = false;
                                  }
                                }

                                if (index == 0) {
                                  if (index ==
                                      (snapshot.data?.docs.length ?? 1) - 1) {
                                    showTime = true;
                                  } else {
                                    var nextTimeMsg =
                                        Utils.convertMillisecondsToTime(snapshot
                                                .data?.docs[index + 1]
                                                .get("msgTime") ??
                                            0);
                                    if (msgTime == nextTimeMsg) {
                                      showTime = false;
                                    } else {
                                      showTime = true;
                                    }
                                  }
                                } else {
                                  if (index ==
                                      (snapshot.data?.docs.length ?? 1) - 1) {
                                    showTime = true;
                                  } else {
                                    var preMsgTime =
                                        Utils.convertMillisecondsToTime(snapshot
                                                .data?.docs[index - 1]
                                                .get("msgTime") ??
                                            0);
                                    var nextMsgTime =
                                        Utils.convertMillisecondsToTime(snapshot
                                                .data?.docs[index + 1]
                                                .get("msgTime") ??
                                            0);
                                    if (preMsgTime == msgTime) {
                                      showTime = false;
                                    } else {
                                      if (msgTime == nextMsgTime) {
                                        showTime = false;
                                      }
                                    }
                                  }
                                }

/*
// if you want to show time accoding to user send msg then use below  code
                                if (index == 0) {
                                  if (index ==
                                      (snapshot.data?.docs.length ?? 1) - 1) {
                                    showTime = true;
                                  } else {
                                    var nextId = snapshot.data?.docs[index + 1]
                                        .get("senderId") ??
                                        "";
                                    var id = snapshot.data?.docs[index]
                                        .get("senderId") ??
                                        "";
                                    if (nextId == id) {
                                      showTime = false;
                                    } else {
                                      showTime = true;
                                    }
                                  }
                                }
                                else {
                                  if (index ==
                                      (snapshot.data?.docs.length ?? 1) - 1) {
                                    showTime = true;
                                  } else {
                                    var preId = snapshot.data?.docs[index - 1]
                                        .get("senderId") ??
                                        "";
                                    var id = snapshot.data?.docs[index]
                                        .get("senderId") ??
                                        "";
                                    var next = snapshot.data?.docs[index + 1]
                                        .get('senderId') ??
                                        '';

                                    if (preId == id) {
                                      print('index $index');
                                      if (next == id) {
                                        print('next or currnt $index');
                                        showTime = false;
                                      } else {
                                        print('next not currnt $index');
                                        showTime = true;
                                      }
                                    } else {
                                      if (preId == id || next == id) {
                                        showTime = false;
                                      } else {
                                        showTime = true;
                                      }
                                    }
                                  }
                                }*/

                                if (index == (snapshot.data?.size ?? 1) - 1) {
                                  _chatScreenController.scrollToBottom();
                                } else {
                                  print(
                                      'index ${index}  === len:${snapshot.data?.size ?? 1}');
                                }
                                if (type == 1) {
                                  return Wrap(
                                      alignment: sendByMe
                                          ? WrapAlignment.end
                                          : WrapAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: sendByMe
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          children: [
                                            !sendByMe
                                                ? Row(
                                                    children: [
                                                      showPic
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                ImageAssets
                                                                    .demoImage,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            )
                                                          : Container(),
                                                      showPic
                                                          ? SizedBox(
                                                              width: 10,
                                                            )
                                                          : SizedBox(width: 40),
                                                    ],
                                                  )
                                                : Container(),
                                            Column(
                                              crossAxisAlignment: sendByMe
                                                  ? CrossAxisAlignment.end
                                                  : CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  constraints: BoxConstraints(
                                                      maxWidth: Get.width * .5),
                                                  margin: EdgeInsets.only(
                                                      top: 10,
                                                      left: marginLeft,
                                                      right: marginRight),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(8),
                                                              topRight: Radius
                                                                  .circular(8),
                                                              bottomLeft: Radius
                                                                  .circular(8)),
                                                      color: sendByMe
                                                          ? AppColor
                                                              .backGroundColor
                                                          : AppColor
                                                              .liteSilverColor),
                                                  padding: EdgeInsets.only(
                                                      left: 8,
                                                      right: 8,
                                                      top: 12,
                                                      bottom: 12),
                                                  child: TextBoldUrbanist(
                                                    txt: "${msg}",
                                                    textAlign: sendByMe
                                                        ? TextAlign.end
                                                        : TextAlign.start,
                                                    fontWeight: AppFonts
                                                        .urbanistMediumWeight,
                                                    textSize: ConstantSize
                                                        .commonTxtTwelveSize,
                                                    txtColor: sendByMe
                                                        ? AppColor.whiteColor
                                                        : AppColor.blackColor,
                                                    textOverFlow:
                                                        TextOverflow.visible,
                                                  ),
                                                ),
                                                showTime
                                                    ? Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          TextBoldUrbanist(
                                                            txt: "${msgTime}",
                                                            textAlign:
                                                                TextAlign.end,
                                                            fontWeight: AppFonts
                                                                .urbanistMediumWeight,
                                                            textSize: 9,
                                                            txtColor: AppColor
                                                                .viewLineColor,
                                                          )
                                                        ],
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            sendByMe
                                                ? Row(
                                                    children: [
                                                      showPic
                                                          ? SizedBox(
                                                              width: 10,
                                                            )
                                                          : SizedBox(width: 40),
                                                      showPic
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                ImageAssets
                                                                    .demoImage,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            )
                                                          : Container()
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ]);
                                } else if (type == 2) {
                                  return Wrap(
                                      alignment: sendByMe
                                          ? WrapAlignment.end
                                          : WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: sendByMe
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            !sendByMe
                                                ? Row(
                                                    children: [
                                                      showPic
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                ImageAssets
                                                                    .demoImage,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            )
                                                          : Container(),
                                                      showPic
                                                          ? SizedBox(
                                                              width: 10,
                                                            )
                                                          : SizedBox(width: 40),
                                                    ],
                                                  )
                                                : Container(),
                                            Column(
                                              crossAxisAlignment: sendByMe
                                                  ? CrossAxisAlignment.end
                                                  : CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: Get.width / 2 * .8,
                                                  margin: EdgeInsets.only(
                                                      top: 10,
                                                      left: marginLeft,
                                                      right: marginRight),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topLeft: Radius
                                                                  .circular(8),
                                                              topRight: Radius
                                                                  .circular(8),
                                                              bottomLeft: Radius
                                                                  .circular(8)),
                                                      color: sendByMe
                                                          ? AppColor
                                                              .backGroundColor
                                                          : AppColor
                                                              .liteSilverColor),
                                                  padding: EdgeInsets.only(
                                                      left: 8,
                                                      right: 8,
                                                      top: 12,
                                                      bottom: 12),
                                                  child: GestureDetector(
                                                    onTap: () => Get.toNamed(
                                                        RoutesName.imagePreview,
                                                        arguments: [
                                                          path,
                                                          null,
                                                          true,
                                                          false
                                                        ]),
                                                    child: Image.network(
                                                      path,
                                                      fit: BoxFit.cover,
                                                      height: Get.height * .255,
                                                      width: Get.width * .4,
                                                    ),
                                                  ),
                                                ),
                                                showTime
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              TextBoldUrbanist(
                                                                txt:
                                                                    "${msgTime}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                fontWeight: AppFonts
                                                                    .urbanistMediumWeight,
                                                                textSize: 9,
                                                                txtColor: AppColor
                                                                    .viewLineColor,
                                                              )
                                                            ],
                                                          ),
                                                          // SizedBox(width: Get.width * .3,)
                                                        ],
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            sendByMe
                                                ? Row(
                                                    children: [
                                                      showPic
                                                          ? SizedBox(
                                                              width: 10,
                                                            )
                                                          : SizedBox(width: 40),
                                                      showPic
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                ImageAssets
                                                                    .demoImage,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            )
                                                          : Container()
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ]);
                                } else if (type == 3) {
                                  return Wrap(
                                      alignment: sendByMe
                                          ? WrapAlignment.end
                                          : WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: sendByMe
                                              ? MainAxisAlignment.end
                                              : MainAxisAlignment.start,
                                          // crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            !sendByMe
                                                ? Row(
                                                    children: [
                                                      showPic
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                ImageAssets
                                                                    .demoImage,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            )
                                                          : Container(),
                                                      showPic
                                                          ? SizedBox(
                                                              width: 10,
                                                            )
                                                          : SizedBox(width: 40),
                                                    ],
                                                  )
                                                : Container(),
                                            Column(
                                              crossAxisAlignment: sendByMe
                                                  ? CrossAxisAlignment.end
                                                  : CrossAxisAlignment.start,
                                              children: [
                                                Obx(
                                                  () =>
                                                      _chatScreenController
                                                                  .selectedIndex
                                                                  .value !=
                                                              index
                                                          ? Container(
                                                              width: Get.width *
                                                                  .53,
                                                              margin: EdgeInsets.only(
                                                                  top: 10,
                                                                  left:
                                                                      marginLeft,
                                                                  right:
                                                                      marginRight),
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.only(
                                                                      topLeft: Radius.circular(
                                                                          8),
                                                                      topRight: Radius.circular(
                                                                          8),
                                                                      bottomLeft: Radius.circular(
                                                                          8)),
                                                                  color: sendByMe
                                                                      ? AppColor
                                                                          .backGroundColor
                                                                      : AppColor
                                                                          .liteSilverColor),
                                                              padding: EdgeInsets.symmetric(
                                                                  vertical: 3,
                                                                  horizontal: 8),
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      _chatScreenController.onPlayAudio(
                                                                          path,
                                                                          index);
                                                                    },
                                                                    child: Icon(
                                                                      Icons
                                                                          .play_circle,
                                                                      color: sendByMe
                                                                          ? AppColor
                                                                              .whiteColor
                                                                          : AppColor
                                                                              .blackColor,
                                                                      size: 35,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            .25,
                                                                    child:
                                                                        SliderTheme(
                                                                      data:
                                                                          SliderThemeData(
                                                                        activeTrackColor: sendByMe
                                                                            ? AppColor.whiteColor
                                                                            : AppColor.blackColor,
                                                                        inactiveTrackColor: sendByMe
                                                                            ? AppColor.liteBackGroundColor
                                                                            : AppColor.blackColor,
                                                                        thumbColor:
                                                                            AppColor.whiteColor,
                                                                        showValueIndicator:
                                                                            ShowValueIndicator.always,
                                                                        valueIndicatorColor: sendByMe
                                                                            ? AppColor.liteBackGroundColor
                                                                            : AppColor.blackColor,
                                                                        valueIndicatorTextStyle: const TextStyle(
                                                                            color:
                                                                                AppColor.blackColor,
                                                                            fontSize: ConstantSize.commonTxtSize,
                                                                            fontFamily: AppFonts.urbanistFamily,
                                                                            fontWeight: AppFonts.urbanistMediumWeight),
                                                                        trackShape:
                                                                            CustomTrackShape(),
                                                                      ),
                                                                      child:
                                                                          Slider(
                                                                        onChanged:
                                                                            (double
                                                                                value) async {},
                                                                        label:
                                                                            '0.0',
                                                                        min: 0,
                                                                        max:
                                                                            100,
                                                                        value:
                                                                            0,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  TextBoldUrbanist(
                                                                    txt: "0.0",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    fontWeight:
                                                                        AppFonts
                                                                            .urbanistMediumWeight,
                                                                    textSize:
                                                                        ConstantSize
                                                                            .commonTxtSize,
                                                                    txtColor: sendByMe
                                                                        ? AppColor
                                                                            .whiteColor
                                                                        : AppColor
                                                                            .blackColor,
                                                                  )
                                                                ],
                                                              ))
                                                          : Container(
                                                              width: Get.width * .53,
                                                              margin: EdgeInsets.only(top: 10, left: marginLeft, right: marginRight),
                                                              decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8), bottomLeft: Radius.circular(8)), color: sendByMe ? AppColor.backGroundColor : AppColor.liteSilverColor),
                                                              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                                                              child: Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      _chatScreenController.onPlayAudio(
                                                                          path,
                                                                          index);
                                                                    },
                                                                    child: _chatScreenController
                                                                            .clicked
                                                                            .value
                                                                        ? SizedBox(
                                                                            width:
                                                                                35,
                                                                            height:
                                                                                35,
                                                                            child:
                                                                                Container(
                                                                              width: 20,
                                                                              height: 20,
                                                                              child: CircularProgressIndicator(
                                                                                color: sendByMe ? AppColor.backGroundColor : AppColor.blackColor,
                                                                                backgroundColor: sendByMe ? AppColor.liteBackGroundColor : AppColor.viewLineColor,
                                                                              ),
                                                                            ),
                                                                          )
                                                                        : Container(
                                                                            child: _chatScreenController.isPlayingAudio.value
                                                                                ? Icon(
                                                                                    Icons.pause,
                                                                                    color: sendByMe ? AppColor.whiteColor : AppColor.blackColor,
                                                                                    size: 35,
                                                                                  )
                                                                                : Icon(
                                                                                    Icons.play_circle,
                                                                                    color: sendByMe ? AppColor.whiteColor : AppColor.blackColor,
                                                                                    size: 35,
                                                                                  ),
                                                                          ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width *
                                                                            .25,
                                                                    child:
                                                                        SliderTheme(
                                                                      data:
                                                                          SliderThemeData(
                                                                        activeTrackColor: sendByMe
                                                                            ? AppColor.liteBackGroundColor
                                                                            : AppColor.blackColor,
                                                                        inactiveTrackColor: sendByMe
                                                                            ? AppColor.liteBackGroundColor
                                                                            : AppColor.blackColor,
                                                                        thumbColor:
                                                                            AppColor.whiteColor,
                                                                        showValueIndicator:
                                                                            ShowValueIndicator.always,
                                                                        valueIndicatorColor:
                                                                            AppColor.liteBackGroundColor,
                                                                        valueIndicatorTextStyle: const TextStyle(
                                                                            color: AppColor.whiteColor,
                                                                            // fontWeight: AppFonts.urbanistMediumWeight,
                                                                            fontSize: ConstantSize.commonTxtSize,
                                                                            fontFamily: AppFonts.urbanistFamily,
                                                                            fontWeight: AppFonts.urbanistMediumWeight),
                                                                        trackShape:
                                                                            CustomTrackShape(),
                                                                      ),
                                                                      child:
                                                                          Slider(
                                                                        onChanged:
                                                                            (double
                                                                                value) async {
                                                                          int seekval =
                                                                              value.round();
                                                                          await _chatScreenController
                                                                              .player
                                                                              ?.seek(Duration(milliseconds: seekval))
                                                                              .then((value) {
                                                                            _chatScreenController.currentPosition.value =
                                                                                seekval;
                                                                          }).onError((error, stackTrace) {
                                                                            print("Seek unsuccessful. $error");
                                                                          });
                                                                        },
                                                                        label: _chatScreenController
                                                                            .audioTime
                                                                            .value,
                                                                        min: 0,
                                                                        max: double.parse(_chatScreenController
                                                                            .maxDuration
                                                                            .value
                                                                            .toString()),
                                                                        value: double.parse(_chatScreenController
                                                                            .currentPosition
                                                                            .value
                                                                            .toString()),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 10,
                                                                  ),
                                                                  TextBoldUrbanist(
                                                                    txt:
                                                                        "${_chatScreenController.audioTime.value}",
                                                                    textAlign:
                                                                        TextAlign
                                                                            .end,
                                                                    fontWeight:
                                                                        AppFonts
                                                                            .urbanistMediumWeight,
                                                                    textSize:
                                                                        ConstantSize
                                                                            .commonTxtSize,
                                                                    txtColor: sendByMe
                                                                        ? AppColor
                                                                            .whiteColor
                                                                        : AppColor
                                                                            .blackColor,
                                                                  )
                                                                ],
                                                              )),
                                                ),
                                                showTime
                                                    ? Row(
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 2,
                                                              ),
                                                              TextBoldUrbanist(
                                                                txt:
                                                                    "${msgTime}",
                                                                textAlign:
                                                                    TextAlign
                                                                        .end,
                                                                fontWeight: AppFonts
                                                                    .urbanistMediumWeight,
                                                                textSize: 9,
                                                                txtColor: AppColor
                                                                    .viewLineColor,
                                                              )
                                                            ],
                                                          ),
                                                          // SizedBox(width: Get.width * .3,)
                                                        ],
                                                      )
                                                    : Container()
                                              ],
                                            ),
                                            sendByMe
                                                ? Row(
                                                    children: [
                                                      showPic
                                                          ? SizedBox(
                                                              width: 10,
                                                            )
                                                          : SizedBox(width: 40),
                                                      showPic
                                                          ? ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40),
                                                              child:
                                                                  Image.asset(
                                                                ImageAssets
                                                                    .demoImage,
                                                                fit:
                                                                    BoxFit.fill,
                                                                width: 30,
                                                                height: 30,
                                                              ),
                                                            )
                                                          : Container()
                                                    ],
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ]);
                                } else {
                                  return Wrap(children: [
                                    Row(
                                      children: [Text('else part')],
                                    )
                                  ]);
                                }
                              });
                        } else {
                          return Container();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Divider(
                    color: AppColor.dividerColor,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: ConstantSize.screenPadding,
                        right: ConstantSize.screenPadding,
                        top: ConstantSize.screenPadding - 15,
                        bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: Get.width * .8,
                          child: TextField(
                              controller: _chatScreenController.msgController,
                              decoration: InputDecoration(
                                  // suffixIcon: LoadSvg(svgPath: SvgAssets.galleryIcon,height: 15,width: 15,),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      _chatScreenController.pickImage(context);
                                    },
                                    iconSize: 80,
                                    icon: SvgPicture.asset(
                                      SvgAssets.galleryIcon,
                                      semanticsLabel: 'galleryIcon',
                                      height: 18.0,
                                      width: 18.0,
                                      // fit: BoxFit.scaleDown
                                    ),
                                  ),
                                  filled: true,
                                  //<-- SEE HERE
                                  fillColor: Color(0xFFf8f8f8),
                                  hintText: 'Write a Message...',
                                  hintStyle: TextStyle(
                                      backgroundColor: Color(0xFFf8f8f8),
                                      fontSize: ConstantSize.commonTxtSize,
                                      color: AppColor.viewLineColor,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      fontFamily: AppFonts.urbanistFamily),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: AppColor.whiteColor),
                                    borderRadius: BorderRadius.circular(
                                        ConstantSize.containerWelcomeRadius),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: AppColor.whiteColor),
                                    borderRadius: BorderRadius.circular(
                                        ConstantSize.containerWelcomeRadius),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: AppColor.whiteColor),
                                      borderRadius: BorderRadius.circular(
                                          ConstantSize.containerWelcomeRadius)),
                                  contentPadding: const EdgeInsets.only(
                                      left: ConstantSize.commonBtnPadding * 2,
                                      right: ConstantSize.commonBtnPadding * 2,
                                      top: 5,
                                      bottom: 5)),
                              onSubmitted: (value) {
                                _chatScreenController.onSend();
                              }),
                        ),
                        const Icon(
                          Icons.mic,
                          color: AppColor.backGroundColor,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: ConstantSize.screenPadding,
                    right: ConstantSize.screenPadding - 3,
                    top: ConstantSize.screenPadding - 15,
                    bottom: 15),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SocialMediaRecorder(
                    // recordIconWhenLockedRecord: Icon(Icons.abc),
                    // lockButton: Icon(Icons.add),
                    backGroundColor: AppColor.whiteColor,
                    // recordIcon: Icon(Icons.mic, color: AppColor.backGroundColor,),
                    sendRequestFunction: (soundFile) {
                      print("the current path is ${soundFile.path}");
                      if (soundFile.path.isNotEmpty) {
                        _chatScreenController.sendAudio(
                            context, soundFile.path);
                      }
                    },
                    encode: AudioEncoderType.AAC,
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
