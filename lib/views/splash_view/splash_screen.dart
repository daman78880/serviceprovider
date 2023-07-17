import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import '../../res/assets/image_assets.dart';
import '../../utils/constants.dart';
import '../../utils/notificaton_service/notification_service.dart';
import '../../utils/notifictionservice/local_notification_service.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/share_pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}

class _SplashScreenState extends State<SplashScreen> {
  // NotificationService _notificationService = NotificationService();
  @override
  void initState() {
    // _notificationService.requestNotificationPermission();
    // _notificationService.foreGroundMessage();
    // _notificationService.firebaseInit(context);
    // _notificationService.setupInteractMessage(context);
    // _notificationService.isTokenRefreshed();
    // _notificationService.getToken();
    init();
    super.initState();
  }

  // void initlizeMessaging(){
  //   LocalNotificationService.initialize();
  //   //get Token function use only first time then use only onTokenRefresh
  //   // This token use to send other person to send  notifiction. also we use topic for send notification.
  //   FirebaseMessaging.instance
  //       .getToken()
  //       .then((value) => { print("Fcm token is :${value}")}).onError((error,
  //       stackTrace) => {print("Fcm token error : $error")});
  //
  //   //When tokne refresed then this function called only
  //   FirebaseMessaging.instance.onTokenRefresh.listen((event) {
  //
  //   });
  //   // 2. This method only call when App in forground it mean app must be opened
  //   FirebaseMessaging.onMessage.listen((RemoteMessage event) async{
  //     print("///////////////////////// onMessage");
  //     if(event!=null) {
  //       String channelId = event.data.containsKey("channelId") ? event
  //           .data["channelId"] : "";
  //       String channelName = event.data.containsKey("channelName") ? event
  //           .data["channelName"] : "";
  //       String channelDescription = event.data.containsKey("channelDescription")
  //           ? event.data["channelDescription"]
  //           : "";
  //       String title = event.notification?.title ?? "TempTitle";
  //       String body = event.notification?.body ?? "TempBody";
  //       String userId = "${event.data.containsKey("userId")
  //           ? event.data["userId"]
  //           : ""}";
  //       String userName = "${event.data.containsKey("userName") ? event
  //           .data["userName"] : ""}";
  //       String userEmail = "${event.data.containsKey("userEmail") ? event
  //           .data["userEmail"] : ""}";
  //       LocalNotificationService.createanddisplaynotification(userId, userName, userEmail, channelId, channelName, channelDescription, title, body);
  //     }
  //   });
  //
  //   // when you click on notification app open from terminated state and you can get notification data in this method
  //   FirebaseMessaging.instance.getInitialMessage().then((event) {
  //     print("//////////////////////////////instance.getInitialMessage");
  //     if(event!=null) {
  //       String channelId = event.data.containsKey("channelId") ? event
  //           .data["channelId"] : "";
  //       String channelName = event.data.containsKey("channelName") ? event
  //           .data["channelName"] : "";
  //       String channelDescription = event.data.containsKey("channelDescription")
  //           ? event.data["channelDescription"]
  //           : "";
  //       String title = event.notification?.title ?? "TempTitle";
  //       String body = event.notification?.body ?? "TempBody";
  //       String userId = "${event.data.containsKey("userId")
  //           ? event.data["userId"]
  //           : ""}";
  //       String userName = "${event.data.containsKey("userName") ? event
  //           .data["userName"] : ""}";
  //       String userEmail = "${event.data.containsKey("userEmail") ? event
  //           .data["userEmail"] : ""}";
  //
  //       LocalNotificationService.createanddisplaynotification(userId, userName, userEmail, channelId, channelName, channelDescription, title, body);
  //     }
  //   });
  //   // 3. This method only call when App in background and not terminated(not closed)
  //   FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //     print("///////////////////////onMatchOpend");
  //     if(event!=null) {
  //       String channelId = event.data.containsKey("channelId") ? event
  //           .data["channelId"] : "";
  //       String channelName = event.data.containsKey("channelName") ? event
  //           .data["channelName"] : "";
  //       String channelDescription = event.data.containsKey("channelDescription")
  //           ? event.data["channelDescription"]
  //           : "";
  //       String title = event.notification?.title ?? "TempTitle";
  //       String body = event.notification?.body ?? "TempBody";
  //       String userId = "${event.data.containsKey("userId")
  //           ? event.data["userId"]
  //           : ""}";
  //       String userName = "${event.data.containsKey("userName") ? event
  //           .data["userName"] : ""}";
  //       String userEmail = "${event.data.containsKey("userEmail") ? event
  //           .data["userEmail"] : ""}";
  //       LocalNotificationService.createanddisplaynotification(userId, userName, userEmail, channelId, channelName, channelDescription, title, body);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColor.backGroundColor
            .withOpacity(ConstantSize.backGroundColorOpacity),
        height: Get.height,
        width: Get.width,
        alignment: Alignment.center,
        child: SafeArea(
            child: SizedBox(
                width: Get.width * .5,
                height: Get.height * .3,
                child: Image.asset(
                  ImageAssets.splashImage,
                  fit: BoxFit.fill,
                ))),
      ),
    );
  }

  void init() async{
      bool userType = await SharePref.getBoolean(Constants.loginAsCustomer) ;
      int value=userType?2:1;
      bool isLogin=await SharePref.getBoolean(Constants.homeLogin) ;
      Future.delayed(const Duration(seconds: 3), () {
        if(isLogin) {
          if (value == 1) {
            Get.offNamed(RoutesName.homeScreen);
          } else {
            Get.offNamed(RoutesName.homeCustomerScreen);
          }
        }else{
          Get.offNamed(RoutesName.introScreen);
        }
      });
  }
}
