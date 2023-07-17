import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/views/booking_view/booking_screen_controller.dart';
import 'package:service_provider_two/views/booking_view/bookingscreenview.dart';
import 'package:service_provider_two/views/chat_view/ChatScreenView.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../my_profile_view/myprofileviewscreeen.dart';
import 'home_customer_controller.dart';
import 'home_customer_screen_view.dart';

class HomeCustomerScreen extends StatefulWidget {
  const HomeCustomerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeCustomerScreenState();
  }
}

class _HomeCustomerScreenState extends State<HomeCustomerScreen> {
  HomeCustomerController homeController = Get.put(HomeCustomerController(),permanent: true);
  var userViewScreens=[

    ];

  @override
  void initState() {
    userViewScreens=[
      const HomeCustomerScreenView(),
      const BookingScreenView(),
      const  ChatScreenView(),
      const MyProfileViewScreen(),
    ];
    super.initState();
  }
  @override
  void dispose() {
    Get.delete<HomeCustomerController>(force: true);
    Get.delete<BookingScreenController>(force: true);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
 body:  Obx(() =>userViewScreens[homeController.selectedIndex.value]),
/*      body:  Obx(() {
      print("update obx indexStack");
        return  IndexedStack(alignment: Alignment.topCenter,
        index: homeController.selectedIndex.value,
        children: [
          HomeScreenView(homeController: homeController),
          RequestScreenView(),
          ChatScreenView(),
          BookingScreenView(),
          MyProfileViewScreen()
          // Expanded(flex:1,child: MyProfileViewScreen())
        ],
      );}),*/
      bottomNavigationBar:  Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black54.withOpacity(0.1),
                  blurRadius: 15.0,
                  offset: const Offset(0.0, 0.75)
              )
            ],
          ),
          child: Obx(
                () =>BottomNavigationBar(
            selectedLabelStyle: const TextStyle(fontSize: ConstantSize.commonSmallTxtSize,fontFamily: AppFonts.poppinsFamily,fontWeight: AppFonts.poppinsMediumWeight),
            unselectedLabelStyle: const TextStyle(fontSize: ConstantSize.commonSmallTxtSize,fontFamily: AppFonts.poppinsFamily,fontWeight: AppFonts.poppinsMediumWeight) ,
            backgroundColor: AppColor.whiteColor,
            type: BottomNavigationBarType.fixed,
            currentIndex: homeController.selectedIndex.value,
            elevation: 5,
            selectedItemColor: AppColor.blackColor,
            unselectedItemColor: AppColor.liteGreyColor,
            onTap: (value) {
              homeController.changeBottonNavigationIndex(value);},
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding:  const EdgeInsets.only(bottom: ConstantSize.txtIconBottomPaddingBottomNavigation),
                    child: Opacity(
                      opacity: homeController.selectedIndex==0?ConstantSize.bottomSelectedOpacity:ConstantSize.bottomUnSelectedOpacity,
                      child: Image.asset(ImageAssets.homeIconImage,
                          width: ConstantSize.homeBottomNavigationIconSize,
                          height: ConstantSize.homeBottomNavigationIconSize),
                    ),
                  ),
                 label: 'Home'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding:  const EdgeInsets.only(bottom: ConstantSize.txtIconBottomPaddingBottomNavigation),

                    child: Opacity(
                      opacity: homeController.selectedIndex==1?ConstantSize.bottomSelectedOpacity:ConstantSize.bottomUnSelectedOpacity,
                      child: SvgPicture.asset(SvgAssets.bookingsIcon,
                          semanticsLabel: 'Bookings logo',
                          width: ConstantSize.homeBottomNavigationIconSize,
                          height: ConstantSize.homeBottomNavigationIconSize),
                    ),
                  ),
                  label: 'Bookings',
                  backgroundColor: Colors.green),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: ConstantSize.txtIconBottomPaddingBottomNavigation),
                    child: Opacity(
                      opacity: homeController.selectedIndex==2?ConstantSize.bottomSelectedOpacity:ConstantSize.bottomUnSelectedOpacity,
                      child: SvgPicture.asset(SvgAssets.chatIcon,
                          semanticsLabel: 'Chat logo',
                          width: ConstantSize.homeBottomNavigationIconSize,
                          height: ConstantSize.homeBottomNavigationIconSize),
                    ),
                  ),
                  label: 'Chat',
                  backgroundColor: Colors.green),

              BottomNavigationBarItem(
                  icon: Padding(
                    padding:const  EdgeInsets.only(bottom: ConstantSize.txtIconBottomPaddingBottomNavigation),
                    child: Opacity(
                      opacity: homeController.selectedIndex==3?ConstantSize.bottomSelectedOpacity:ConstantSize.bottomUnSelectedOpacity,
                      child: SvgPicture.asset(SvgAssets.accountIcon,
                          semanticsLabel: 'Account logo',
                          width: ConstantSize.homeBottomNavigationIconSize,
                          height: ConstantSize.homeBottomNavigationIconSize),
                    ),
                  ),
                  label: 'Account',
                  backgroundColor: Colors.green),
            ],
          ),
        ),
      ),
    );
  }
}
