// import 'dart:convert';
// import 'dart:math';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
//
//
// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//   static void initialize() {
//     var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
//     var IOS = new DarwinInitializationSettings();
//     var settings = new InitializationSettings(android: android, iOS: IOS);
//     _notificationsPlugin.initialize(settings, onDidReceiveBackgroundNotificationResponse: selectNotificationBackground,
//         onDidReceiveNotificationResponse:
//     selectNotification
//     );
//   }
//
//   static selectNotificationBackground( NotificationResponse notificationResponse) {
//     print("////////////////////////////selectNotificationBackground :");
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
//
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
//     }
//     else {
//       // navigationService.navigateTo(routes.forgotScreen);
//     }
//   }
//
//   static void createanddisplaynotification(
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
//      ;
//      print("showing notification9999999999999999999999999999999999999999");
//       await _notificationsPlugin.show(
//           Random().nextInt(500), title, body, platformChannelSpecifics,
//          );
//           // payload: jsonEncode(userModel));
//     } on Exception catch (e) {
//       print("error during showing notification is ${e}");
//     }
//   }
// }
