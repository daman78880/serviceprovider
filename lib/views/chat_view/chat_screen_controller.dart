import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/respository/home_repository.dart';
import '../../utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:service_provider_two/utils/constants.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import '../../utils/authentication.dart';

class ChatScreenController extends GetxController {
  final _myRepo = HomeRepository();
  ScrollController scrollController = ScrollController();
  RxInt selectedIndex = RxInt(-1);
  RxBool isPlayingAudio = false.obs;
  RxBool clicked = false.obs;
  RxInt maxDuration = 100.obs;
  RxInt currentPosition = 0.obs;
  RxString audioTime = '0:0'.obs;
  AudioPlayer? player = null;
  StreamSubscription? streams = null;

  String id = '';
  String senderId = '';
  String receiverId = '';
 String name = '';
  RxString receiverName = ''.obs;
  String serviceId = '';
  TextEditingController msgController = TextEditingController();
  String loginid='';


  void onPlayAudio(String url,int index)async {
    if(selectedIndex.value!=index && selectedIndex.value != -1){
      await player!.stop().then((value) {
        isPlayingAudio.value = false;
        currentPosition.value = 0;
        audioTime.value = '0:0';
        // player?.dispose();
      });
    }
      selectedIndex.value = index;
      print('clicked $url');
      // isPlayingAudio.value = true;
      if (player != null) {
        if (player?.state == PlayerState.playing) {}
        else {
          print('inside if part');
          if (player?.state == PlayerState.disposed) {
            player = AudioPlayer();
            player?.stop();
            onPlayAudio(url, index);
          }
          else if (player?.state == PlayerState.stopped) {
            print('inside disposed or stropped');
            clicked.value = true;
            await player?.play(DeviceFileSource(url))
                .then((value) {
              clicked.value = false;
              isPlayingAudio.value = true;
              print('playing audio is start');
            }).onError((error, stackTrace) {
              isPlayingAudio.value = false;
              print("Error while playing audio. $error");
            });
          } else {
            if (player?.state == PlayerState.paused) {
              print('inside disposed or paused');
              await player?.resume()
                  .then((value) {
                isPlayingAudio.value = true;
                print('playing audio is start');
              }).onError((error, stackTrace) {
                isPlayingAudio.value = false;
                print("Error while playing audio. $error");
              });
            } else if (player?.state == PlayerState.playing) {
              print('inside disposed or playing');
              await player?.pause()
                  .then((value) {
                isPlayingAudio.value = false;
                print('playing audio is start');
              }).onError((error, stackTrace) {
                isPlayingAudio.value = false;
                print("Error while playing audio. $error");
              });
            }
          }
        }
      } else {
        print('inside else part');
        player = AudioPlayer();
        player?.stop();
        onPlayAudio(url, index);
        player?.onDurationChanged.listen((Duration d) {
          maxDuration.value = d.inMilliseconds;
        });

        player?.onPlayerComplete.listen((event) async {
          await player!.stop().then((value) {
            isPlayingAudio.value = false;
            currentPosition.value = 0;
            audioTime.value = '0:0';
            // player?.dispose();
          });
        });
        player?.onPositionChanged.listen((Duration p) async {
          currentPosition.value =
              p.inMilliseconds; //get the current position of playing audio
          int shours = Duration(milliseconds: currentPosition.value).inHours;
          int sminutes = Duration(milliseconds: currentPosition.value)
              .inMinutes;
          int sseconds = Duration(milliseconds: currentPosition.value)
              .inSeconds;
          int rminutes = sminutes - (shours * 60);
          int rseconds = sseconds - (sminutes * 60 + shours * 60 * 60);
          audioTime.value = "$rminutes:$rseconds";
        });
      }

  }
  void initlizeOrPlayAudio(String url,int index){

  }

  @override
  void onInit() {
    setData();
    super.onInit();
  }
  @override
  void onClose() {
    try {
      // player?.stop();
      // player?.release();
      player?.dispose();
      player = null;
    }
    catch(e){
      print('exception in audio player $e');
    }
    super.onClose();
  }
  void setData()async{
    print('inside setupData+++++++');
    id = Get.arguments['id'] ?? 'temp';
    name = Get.arguments['name'] ?? 'temp';
    receiverId = Get.arguments['receiverId'] ?? 'temp';
    senderId = Get.arguments['senderId'] ?? 'temp';
    receiverName.value = Get.arguments['receiverName'] ?? 'temp';
    serviceId = Get.arguments['serviceId'] ?? 'temp';
    loginid=await SharePref.getString(Constants.loginId);
    // print('receiverName : $receiverName and id ${receiverId} and currentName:${name} current id:${senderId}');
    print('id:$id\npath:""\nsenderId$senderId\nsenderName$name\nreciverId$receiverId\nreceiverName$receiverName'
        '\receiverName$receiverName\nserviceId${serviceId}\nloginId${loginid}');
    Authentication.updateMsgCountStatus(id, this.loginid);
    print('chat exist status ${await Authentication.checkChatExist(id)}');
  }

  void onSend() {
    if (id.isNotEmpty && id != 'temp' &&
        name.isNotEmpty && name != 'temp' &&
        receiverId.isNotEmpty && receiverId != 'temp' &&
        senderId.isNotEmpty && senderId != 'temp' &&
        receiverName.isNotEmpty && receiverName != 'temp'
    ) {
      print('senderId ${senderId} || loginId ${loginid}and reciverId ${receiverId}');
      print('senderIdN ${name} || loginId ${loginid}and reciverId ${receiverName}');
      if (msgController.text
          .trim()
          .isNotEmpty) {
        var pic = 'https://scontent.fixc2-1.fna.fbcdn.net/v/t1.6435-9/190108336_322648402555040_2100790391455013605_n.jpg?_nc_cat=1&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=5XiQh-P2FPQAX-WwiaL&_nc_ht=scontent.fixc2-1.fna&oh=00_AfCNKaMZ_wAfZqgfWxBC-GO3OQ1uKy7ALELMmW4kvLRAaw&oe=64CA4840';
        var picTwo = 'https://cdn.britannica.com/34/212134-050-A7289400/Lionel-Messi-2018.jpg';
        print('onMassage');
        var msg = msgController.text.trim();
        msgController.clear();
        print('id:$id\npath:""\nsenderId$senderId\nsenderName$name\nreciverId$receiverId\nreceiverName$receiverName'
            '\receiverName$receiverName\nserviceId${serviceId}\nloginId${loginid}');
        Authentication.sendMsg(
                id,
                '',
                msg,
                DateTime
                    .now()
                    .millisecondsSinceEpoch,
                1,
                senderId,
                name,
                pic,
                receiverId,
                receiverName.value,
                picTwo,
          serviceId);
        var data={'id':id,'name':name,'receiverId':receiverId,'receiverName':receiverName.value,
          'senderId':senderId,'serviceId':serviceId,'login':senderId,'msg':msg};
        _myRepo.sendNotification(data).then((value) {
          if (kDebugMode) {
            print("Notification send successfully");
          }
        }).onError((error, stackTrace) {
          if (kDebugMode) {
            print("Notification Error:${error.toString()}");
          }
        });
      }
    } else {
      Utils.snackBar('Error', 'id error');
    }
  }

  void pickImage(BuildContext context)async{
    try {
      Utils.hideKeyBoard(context);
      if (kIsWeb) {
        var output = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['png', 'jpeg', 'jpg',],
          allowMultiple: false,
        );
        FilePickerResult? finalOutput = output;
        var importFile = finalOutput!.files[0];
        var fileName = importFile.name;
        var fileType = '';
        if (fileName.contains(".png")) {
          fileType = "png";
        } else if (fileName.contains(".jpeg")) {
          fileType = "jpeg";
        } else if (fileName.contains(".jpg")) {
          fileType = "jpg";
        }
        PlatformFile platformFile = importFile;
        // onAddImage(null, platformFile.bytes,platformFile.name);
        sendImage('https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80',true);
      } else {
        var result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            'png',
            'jpeg',
            'jpg',
          ],
          allowMultiple: false,
        );
        if (result != null) {
          String pathh=result.files.single.path??'';
          if(pathh!='') {
             BuildContext? context = Get.context;
              Utils.showDialogProgressDialog(context!, true);
              var filePath = await Authentication.uploadFile(pathh);
              if (filePath.isNotEmpty) {
                // sendImage('https://images.unsplash.com/photo-1593085512500-5d55148d6f0d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D&w=1000&q=80');
                sendImage(filePath, true);
              } else {
                Utils.snackBar('Something Error', filePath);
              }
              Utils.showDialogProgressDialog(context, false);

            }else{
              print('Path empty ${pathh}');
            }
          }else {
            print('Picked file path empty ');
          }
          // onAddImage(file, null,'');
        }


    }catch(e){
      print('inside printing image picker errro $e');
    }

  }
  void sendImage(String path,bool image){
    if (id.isNotEmpty && id != 'temp' &&
        name.isNotEmpty && name != 'temp' &&
        receiverId.isNotEmpty && receiverId != 'temp' &&
        senderId.isNotEmpty && senderId != 'temp' &&
        receiverName.isNotEmpty && receiverName != 'temp'
    ) {
      var type=2;
      var msg='Image';
      if(image==false){
        type=3;
        msg='Voice Recoding';
      }

        var pic = 'https://scontent.fixc2-1.fna.fbcdn.net/v/t1.6435-9/190108336_322648402555040_2100790391455013605_n.jpg?_nc_cat=1&cb=99be929b-3346023f&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=5XiQh-P2FPQAX-WwiaL&_nc_ht=scontent.fixc2-1.fna&oh=00_AfCNKaMZ_wAfZqgfWxBC-GO3OQ1uKy7ALELMmW4kvLRAaw&oe=64CA4840';
        var picTwo = 'https://cdn.brita                                                                                 nnica.com/34/212134-050-A7289400/Lionel-Messi-2018.jpg';
          Authentication.sendMsg(
            id,
            path,
              msg,
            DateTime
                .now()
                .millisecondsSinceEpoch,
              type,
            senderId,
            // receiverId,
            name,
            pic,
            // senderId,
            receiverId,
            receiverName.value,
            picTwo,
            serviceId);
      var data={'id':id,'name':name,'receiverId':receiverId,'receiverName':receiverName.value,
        'senderId':senderId,'serviceId':serviceId,'login':senderId,'msg':msg};
      _myRepo.sendNotification(data).then((value) {
        if (kDebugMode) {
          print("Notification send successfully");
        }
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print("Notification Error:${error.toString()}");
        }
      });
    } else {
      Utils.snackBar('Error', 'id error');
    }

  }
  void scrollToBottom(){
    print('inside function bottom scroll called');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.fastOutSlowIn);
    });
  }

  void sendAudio(BuildContext context,String path)async{
    Utils.hideKeyBoard(context);
    Utils.showDialogProgressDialog(context!, true);
    var filePath = await Authentication.uploadAudioRecoding(path);
    if(filePath.isNotEmpty) {
      sendImage(filePath,false);
    }else{
      Utils.snackBar('Something Error', filePath);
    }
    Utils.showDialogProgressDialog(context, false);
  }


}