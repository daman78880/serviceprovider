import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/chat_view/chat_user_list_widget.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import 'chat_view_controller.dart';

class ChatScreenView extends StatefulWidget {
  const ChatScreenView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreenView> {
  ChatViewController _chatViewController = Get.put(ChatViewController());

  @override
  void initState() {
    _chatViewController.getUserChats();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.delete<ChatViewController>();
        return false;
      },
      child: Obx(
        () => IndexedStack(
          index: _chatViewController.viewIndex.value,
          // index:0,
          children: [
            Scaffold(
              body: SingleChildScrollView(
                child: SafeArea(
                    child: Container(
                        alignment: Alignment.center,
                        color: AppColor.whiteColor,
                        width: Get.width,
                        padding: const EdgeInsets.only(
                            left: ConstantSize.screenPadding,
                            right: ConstantSize.screenPadding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppBar().preferredSize.height + 15,
                              ),
                              Center(
                                  child:
                                      SvgPicture.asset(SvgAssets.emptyChatIcon)),
                              SizedBox(
                                height: Get.height * .03,
                              ),
                              TextBoldUrbanist(
                                txt: 'No Messages Yet!!!',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                fontFamily: AppFonts.urbanistFamily,
                                textSize: ConstantSize.commonMediumTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                              SizedBox(
                                height: Get.height * .015,
                              ),
                              TextBoldUrbanist(
                                txt: 'Start posting Rides to\nget messages',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistBoldWeight,
                                fontFamily: AppFonts.urbanistFamily,
                                textSize: ConstantSize.commonBigTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                              SizedBox(
                                height: Get.height * .015,
                              ),
                              TextBoldUrbanist(
                                txt:
                                    'Going somewhere? Carpooling is the best way\nto go! Book low cost sharing rides travel with\npeople going your way.',
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                fontFamily: AppFonts.urbanistFamily,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                            ]))),
              ),
            ),
            Scaffold(
                appBar: AppBar(
                  backgroundColor: AppColor.whiteColor,
                  surfaceTintColor: Colors.transparent,
                  centerTitle: true,
                  title: TextBoldUrbanist(
                    txt: 'Chats',
                    textAlign: TextAlign.center,
                    textSize: ConstantSize.commonMediumTxtSize,
                    txtColor: AppColor.blackColor,
                  ),
                  automaticallyImplyLeading: false,
                  elevation: 1,
                  shadowColor: AppColor.dividerColor,
                  // scrolledUnderElevation: 10,
                ),
                body: SingleChildScrollView(
                    child: Container(
                        color: AppColor.whiteColor,
                        width: Get.width,
                        padding: const EdgeInsets.only(
                            left: ConstantSize.screenPadding,
                            right: ConstantSize.screenPadding),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: Get.height * .015,
                              ),
                              Obx(
                                () => ListView.separated(
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) =>
                                      ChatUserListWidget(
                                    profilePath: _chatViewController
                                        .userList[index].receiverProfilePic,
                                    fromNetwork: false,
                                    name: _chatViewController
                                        .userList[index].receiverName,
                                    lastMsg: _chatViewController
                                        .userList[index].lastMsg,
                                    msgCound: _chatViewController
                                        .userList[index].msgCount,
                                    time: _chatViewController.userList[index].time,
                                    onClick: () {
                                      _chatViewController.onChatClick(index);
                                    },
                                  ),
                                  itemCount: _chatViewController.userList.length,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder:
                                      (BuildContext context, int index) {
                                    return const Divider(
                                      color: AppColor.dividerColor,
                                    );
                                  },
                                ),
                              ),
                              _chatViewController.userList.isNotEmpty
                                  ? const Divider(
                                      color: AppColor.dividerColor,
                                    )
                                  : Container()
                            ])))),
            Scaffold(body: Center(
              child: CircularProgressIndicator(color: AppColor.backGroundColor,),
            ),)
          ],
        ),
      ),
    );
  }
}
