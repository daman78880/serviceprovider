// import 'dart:convert';
// import 'dart:math';
//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// import 'local_notification_service.dart';
//
// class NotificationService{
//   FirebaseMessaging messaging = FirebaseMessaging.instance;
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//   FlutterLocalNotificationsPlugin();
//   void initLocalNotification(){
//     var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var IOS = new DarwinInitializationSettings();
//     var settings = new InitializationSettings(android: android, iOS: IOS);
//     _notificationsPlugin.initialize(settings,
//         onDidReceiveBackgroundNotificationResponse:
//         selectNotificationBackground
//         ,
//         onDidReceiveNotificationResponse:
//         selectNotification
//     );
//   }
//   static selectNotification(NotificationResponse notificationResponse) {
//     print("////////////////////////////selectNotification :");
//     // final NavigationService navigationService = locator<NavigationService>();
//     if(notificationResponse.payload!=null) {
//       // var data = UserDataModel.fromJson(
//       //     jsonDecode(notificationResponse.payload!));
//       // Map<String,String> argu={
//       //   'userUid': data.uid,
//       //   'userName': data.userName,
//       //   'userEmail': data.userEmail,
//       // };
//       // navigationService.navigateToChatScreen(routes.chatScreen,argu);
//     }else {
//       // navigationService.navigateTo(routes.forgotScreen);
//     }
//   }
//   static selectNotificationBackground( NotificationResponse notificationResponse) {
//     print("////////////////////////////selectNotificationBackground :");
//     // final NavigationService navigationService = locator<NavigationService>();
//     // if(notificationResponse.payload!=null) {
//     //   var data = UserDataModel.fromJson(
//     //       jsonDecode(notificationResponse.payload!));
//     //   Map<String,String> argu={
//     //     'userUid': data.uid,
//     //     'userName': data.userName,
//     //     'userEmail': data.userEmail,
//     //   };
//     //   navigationService.navigateToChatScreen(routes.chatScreen,argu);
//     // }
//     // else {
//     //   navigationService.navigateTo(routes.forgotScreen);
//     // }
//   }
//
//   void requestNotificationPermission()async{
//    await messaging.requestPermission(
//       alert: true,
//       announcement: true,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//   }
//   void firebaseInit(){
//     FirebaseMessaging.onMessage.listen((event) {
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
//     });
//   }
//   Future<String> getDeviceToken()async{
//     String? token=await messaging.getToken();
//     return token??'';
// }
//   void isTokenRefreshed()async{
//     messaging.onTokenRefresh.listen((event) {
//       print('event ${event}');
//       print("token refreshed");
//     });
//   }
//   static void showNotification(
//       String userId,
//       String userName,
//       String userEmail,
//       String channelId,
//       String channelName,
//       String channelDescription,
//       String title,
//       String body) async {
//     try {
//       var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
//           channelId, channelName,
//           channelDescription: channelDescription,
//           importance: Importance.max,
//           priority: Priority.high);
//       var iOSPlatformChannelSpecifics = new DarwinNotificationDetails();
//       var platformChannelSpecifics = new NotificationDetails(
//           android: androidPlatformChannelSpecifics,
//           iOS: iOSPlatformChannelSpecifics);
//       // var userModel=UserDataModel(userName: userName, userEmail: userEmail, userPassword: "", uid: userId);
//       ;
//       print("showing notification9999999999999999999999999999999999999999");
//       await _notificationsPlugin.show(
//           Random().nextInt(500), title, body, platformChannelSpecifics,
//           );
//           // payload: jsonEncode(userModel));
//     } on Exception catch (e) {
//       print("error during showing notification is ${e}");
//     }
//   }
// }