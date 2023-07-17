import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/res/getx_localization/languages.dart';
import 'package:service_provider_two/utils/notificaton_service/notification_service.dart';
import 'package:service_provider_two/utils/routes/routes.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  await Firebase.initializeApp();
  await SharePref.init();
  // NotificationService _notificationService = NotificationService();
  // _notificationService.foreGroundMessage();
  // _notificationService.firebaseInit(Get.context!);
  // _notificationService.setupInteractMessage(Get.context!);
  // _notificationService.isTokenRefreshed();
  // _notificationService.getToken();

}



Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await SharePref.init();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    _notificationService.requestNotificationPermission();
    _notificationService.foreGroundMessage();
    _notificationService.firebaseInit(context);
    _notificationService.setupInteractMessage(context);
    _notificationService.isTokenRefreshed();
    _notificationService.getToken();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.whiteColor,
        colorScheme: ColorScheme.fromSeed(seedColor:AppColor.whiteColor),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      translations: Languages(),
      fallbackLocale: Locale('en','US'),  // When no language select then us this.
      locale: Locale('en','US'), // FOr select language.
      getPages: Routes.appRoutes(),
    );
  }
}



