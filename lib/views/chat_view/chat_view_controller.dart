
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/utils/authentication.dart';

import '../../models/chat_last_msg_model.dart';
import '../../utils/constants.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';

class ChatViewController extends GetxController {
  RxInt viewIndex = 2.obs;
  RxList<ChatUserShowModel> userList = <ChatUserShowModel>[].obs;
  String loginId='';

  @override
  void onInit() {
    init();
    super.onInit();
  }
  void init()async{
    loginId=await SharePref.getString(Constants.loginId);
  }

  void getUserChats() async {
      Authentication.getUserChatUsers(await SharePref.getString(Constants.loginId)).then((value) async {
      if (value.isEmpty == true) {

      } else {
       value.listen((event) {
         var len=event.docs.length??0;
         userList.clear();
         if(len>0){
          viewIndex.value = 1;
         }else{
          viewIndex.value = 0;
         }
         for(int i=0;i<len;i++){
           if(event.docs[i].exists){
             String id=event.docs[i].id;
             var data =event.docs[i].data().containsKey('members') == true ?event.docs[i].get('members'):null;
             List<String> idList = List<String>.from(data);
             // List<dynamic> idList = event.docs[i].data().containsKey('members') == true ?event.docs[i].get('members') : <dynamic>[];
             String rId='';
             for(int u=0;u<idList.length;u++){
                if(idList[u]!=this.loginId){
                  rId=idList[u];
                }
             }
             String serviceId = event.docs[i].data().containsKey('serviceId') == true ?event.docs[i].get('serviceId') : 'temp';
              int time = event.docs[i].data().containsKey('time') == true ?event.docs[i].get('time') : 0;
             ChatLastMsgModel? lastMsg = event.docs[i].data().containsKey('lastMsg') == true ? ChatLastMsgModel.fromJson(event.docs[i].get('lastMsg')) : null;
             Map<String,dynamic>? msgCount=event.docs[i].data().containsKey('unReadMsgCount') == true ? event.docs[i].get('unReadMsgCount')  : null;
            if(lastMsg!=null && msgCount!=null){
              String lstMsg = lastMsg.msg ?? 'temp';
              Map<String,dynamic>? senderDetail = event.docs[i].data().containsKey(this.loginId) == true ? event.docs[i].get(this.loginId) : null;
              Map<String,dynamic>? receiverDetail = event.docs[i].data().containsKey(rId) == true ? event.docs[i].get(rId) : null;
              if (senderDetail != null && receiverDetail != null) {
                String senderName = senderDetail.containsKey('name') == true
                    ? senderDetail['name'] as String
                    : 'Temp';
       /*         String senderPic = senderDetail.containsKey('image') == true
                    ? senderDetail['image'] as String
                    : 'Temp';*/
                String senderPic=ImageAssets.demoImageSecond;
               /* String receiverPic = receiverDetail.containsKey('image') ==
                    true ? receiverDetail['image'] as String : 'Temp';*/
                String receiverPic = ImageAssets.demoImage;
                String receiverName = receiverDetail.containsKey('name') == true ? receiverDetail['name'] as String : 'Temp';
                  int msgCountt =   msgCount.containsKey(this.loginId) == true ? msgCount[this.loginId] as int : 0;
                  print('loginId : ${this.loginId}');
                  userList.add(ChatUserShowModel(id: id,
                      name:senderName ,
                      profilePic: senderPic,
                      receiverId: rId,
                      senderId: this.loginId,loadFromNet: false,receiverName: receiverName,
                      receiverProfilePic: receiverPic,time: Utils.convertMillisecondsToTime(time),
                      lastMsg:lstMsg,msgCount: msgCountt,serviceId: serviceId ));

              }else{
                print('empty sender or recevier detail');
              }
            }else{
              print('inside else part');
            }
           }
         }
       });

      }
    }
    ).onError((error, stackTrace) {
      if (kDebugMode) {
        print('Error : $error');
      }
    });
    if (kDebugMode) {
      print('get user chat called finished');
    }
  }

  void onChatClick(int index) async{
    Get.toNamed(RoutesName.chatScreen,
        arguments: {
          'name': userList[index].name,
          'serviceId': userList[index].serviceId,
          'id': userList[index].id,
          'senderId': userList[index].senderId,
          'receiverId': userList[index].receiverId,
          "receiverName":userList[index].receiverName
        });

  }

}

class ChatUserShowModel {
  final String id;
  final String profilePic;
  final String serviceId;
  final String receiverProfilePic;
  final bool loadFromNet;
  final String name;
  final String receiverName;
  final String senderId;
  final String receiverId;
  final String lastMsg;
  final int msgCount;
  final String time;

  ChatUserShowModel({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.serviceId,
    required this.profilePic,
    required this.receiverProfilePic,
    required this.loadFromNet,
    required this.name,
    required this.receiverName,
    required this.lastMsg,
    required this.msgCount,
    required this.time,
  });
}
