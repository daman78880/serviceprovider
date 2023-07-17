import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/utils/constants.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import 'package:service_provider_two/utils/utils.dart';
import 'package:service_provider_two/views/booking_view/booking_screen_controller.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../../utils/routes/routes_name.dart';
import 'card_widget_booking_screen.dart';

class BookingScreenView extends StatefulWidget {
  const BookingScreenView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BookingScreenViewState();
  }
}

class _BookingScreenViewState extends State<BookingScreenView>
    with SingleTickerProviderStateMixin {
  final BookingScreenController _bookingScreenController = Get.find<BookingScreenController>();

  @override
  void initState() {
    _bookingScreenController.tabController =
        TabController(length: 3, vsync: this);
    _bookingScreenController.tabController
        ?.animateTo(_bookingScreenController.tabIndex.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        if (details.velocity.pixelsPerSecond.dx > 0) {
// Swipe right
          if (_bookingScreenController.tabIndex.value > 0) {
            int index =
                _bookingScreenController.tabIndex.value - 1;
            _bookingScreenController.onTabChangeIndex(index);
            _bookingScreenController.tabController
                ?.animateTo(index);
          }
        } else if (details.velocity.pixelsPerSecond.dx < 0) {
// Swipe left
          if (_bookingScreenController.tabIndex.value < 2) {
            int index =
                _bookingScreenController.tabIndex.value + 1;
            _bookingScreenController.onTabChangeIndex(
                _bookingScreenController.tabIndex.value + 1);
            // _bookingScreenController.tabController?.animateTo(index);
            _bookingScreenController.tabController
                ?.animateTo(index);
          }
        }
      },
      child: Scaffold(
        extendBody: true,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
                alignment: Alignment.center,
                color: AppColor.whiteColor,
                width: Get.width,
                padding: const EdgeInsets.only(
                    left: ConstantSize.screenPadding,
                    right: ConstantSize.screenPadding),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SizedBox(
                    height: AppBar().preferredSize.height,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: ConstantSize.homeImageSize - 10,
                          width: ConstantSize.homeImageSize - 10,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.containerWelcomeRadius),
                              color: AppColor.backGroundColor),
                          child: Image.asset(
                            ImageAssets.splashImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          width: Get.width * .04,
                        ),
                        TextBoldUrbanist(
                          txt: 'My Booking',
                          textAlign: TextAlign.start,
                          textSize: ConstantSize.commonMediumTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        Spacer(),
                        SvgPicture.asset(
                          SvgAssets.filterIcon,
                          width: ConstantSize.thirtySizeIcon,
                          height: ConstantSize.thirtySizeIcon,
                        )
                      ],
                    ),
                  ),
                  TabBar(
                    controller: _bookingScreenController.tabController,
                    // controller: tabController.tabController.value,
                    // controller: _bookingScreenController.tabController,
                    onTap: (value) {
                      _bookingScreenController.onTabChangeIndex(value);
                    },
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorPadding: const EdgeInsets.only(left: 10, right: 10),
                    labelStyle: const TextStyle(
                        fontSize: ConstantSize.commonTxtSize,
                        fontWeight: AppFonts.urbanistBoldWeight,
                        fontFamily: AppFonts.urbanistFamily),
                    unselectedLabelColor: AppColor.viewLineColor,
                    labelColor: AppColor.backGroundColor,
                    unselectedLabelStyle: const TextStyle(
                        fontSize: ConstantSize.commonTxtSize,
                        fontWeight: AppFonts.urbanistBoldWeight,
                        fontFamily: AppFonts.urbanistFamily),
                    indicatorColor: AppColor.backGroundColor,
                    tabs: const [
                      Tab(text: "Upcoming"),
                      Tab(text: "On Going"),
                      Tab(text: "Past"),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * .025,
                  ),
                  Obx(
                    () => Stack(
                      children: [
                        Offstage(
                          offstage: _bookingScreenController.tabIndex.value == 0
                              ? false
                              : true,
                          child: Obx(
                            () => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesName.serviceDetail, arguments: [0, true, index,1]);
                                  },
                                  child: CardWidgetBookingScreen(
                                    // image:_bookingScreenController.customerLogin?_bookingScreenController
                                    //     .upComingBookingModelList[index]
                                    //     .serviceProvider![0]
                                    //     .userProfileDetails?.profilePicture??'':_bookingScreenController
                                    //     .upComingBookingModelList[index]
                                    //     .customer![0]
                                    //     .customerProfileDetails
                                    //     ?.profilePicture ?? '' ,
                                    image: ImageAssets.demoImageSecond,
                               /*     address: !_bookingScreenController.customerLogin?_bookingScreenController
                                        .upComingBookingModelList[index]
                                        .serviceProvider![0]
                                        .userProfileDetails?.address??'':_bookingScreenController
                                            .upComingBookingModelList[index]
                                            .customer![0].customerServiceDetails
                                            ?.addressForService ?? '',*/
                                      address: _bookingScreenController
                                          .upComingBookingModelList[index]
                                          .customer![0].customerServiceDetails
                                          ?.addressForService ?? '',
                                    date: Utils.formatApiExpireDate(
                                        _bookingScreenController
                                                .upComingBookingModelList[index]
                                                .customer![0]
                                                .customerServiceDetails
                                                ?.date ??
                                            ''),
                                    distance: Utils.convertMetersToKm(
                                        _bookingScreenController
                                                .upComingBookingModelList[index]
                                                .serviceProvider![0]
                                                .calculatedDistance ??
                                            0),
                                    money: int.parse(_bookingScreenController
                                            .upComingBookingModelList[index]
                                            .serviceProvider?[0]
                                            .amount ??
                                        '0'),
                                    name: _bookingScreenController.customerLogin?"${_bookingScreenController
                                        .upComingBookingModelList[index].serviceProvider![0].userProfileDetails?.firstName} ${_bookingScreenController
                                        .upComingBookingModelList[index].serviceProvider![0].userProfileDetails?.lastName}":"${_bookingScreenController
                                        .upComingBookingModelList[index].customer![0].customerProfileDetails?.firstName} ${_bookingScreenController
                                        .upComingBookingModelList[index].customer![0].customerProfileDetails?.lastName}",
                                    specialty: _bookingScreenController
                                            .upComingBookingModelList[index]
                                            .serviceProvider?[0]
                                            .serviceProviderDetails
                                            ?.categoriesName ??
                                        '',
                                    time: Utils.fomateTwelveHourTime(_bookingScreenController
                                            .upComingBookingModelList[index]
                                            .customer?[0]
                                            .customerServiceDetails
                                            ?.startTime?[0] ??
                                        ''),
                                    onCancel: () async{
                                        print("onCancel clicked");
                                      _bookingScreenController.bookingCancel(index, _bookingScreenController.upComingBookingModelList[index].serviceProvider![0].sId!,false);

                                    },
                                    onMessage: () async {
                                      var senderId = await SharePref.getString(Constants.loginId);
                                      var name = '${await SharePref.getString(Constants.firstName)} ${await SharePref.getString(Constants.lastName)}';

                                      var receiverName =_bookingScreenController.customerLogin?"${_bookingScreenController.upComingBookingModelList[index].serviceProvider?[0].userProfileDetails?.firstName} ${_bookingScreenController.upComingBookingModelList[index].serviceProvider?[0].userProfileDetails?.lastName}":
                                      "${_bookingScreenController.upComingBookingModelList[index].customer?[0].customerProfileDetails?.firstName} ${_bookingScreenController.upComingBookingModelList[index].customer?[0].customerProfileDetails?.lastName}";

                                      var receiverId = _bookingScreenController.customerLogin?"${_bookingScreenController.upComingBookingModelList[index].serviceProvider?[0].userProfileDetails?.sId}":
                                      _bookingScreenController.upComingBookingModelList[index].customer?[0].customerProfileDetails?.sId;

                                      var serviceId =_bookingScreenController.upComingBookingModelList[index].serviceProvider?[0].sId??'';
                                      var userId =  Utils.getChatId(senderId, receiverId!,serviceId);
                                      // print('receiver name before send is $receiverName');
                                      print('rreceiverName : $receiverName and id ${receiverId} and currentName:${name} current id:${senderId}');

                                      Get.toNamed(RoutesName.chatScreen,
                                          arguments: {
                                            'name': name,
                                            'serviceId': serviceId,
                                            'id': userId,
                                            'senderId': senderId,
                                            'receiverId': receiverId,
                                            "receiverName":receiverName,
                                          });
                                    },
                                    onStartClick: () {
                                      if(_bookingScreenController.customerLogin){
                                        var serviceId =_bookingScreenController.upComingBookingModelList[index].serviceProvider?[0].sId??'';
                                        _bookingScreenController.onGernateOptClick(serviceId);
                                      }else {
                                        Get.toNamed(RoutesName.serviceMap, arguments: [4,index]);
                                      }
                                    },
                                    cancelledClick: () {
                                      print('onCancel booking clicked');
                                    },
                                    completedClick: () {},
                                    makeAsCompleteClick: () {},
                                    customerLogin: _bookingScreenController.customerLogin,
                                  ),
                                );
                              },
                              // itemCount: _bookingScreenController.upComingBookingList.length,
                              itemCount: _bookingScreenController.upComingBookingModelList.length,
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: _bookingScreenController.tabIndex.value == 1
                              ? false
                              : true,
                          child: Obx(
                            () => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesName.serviceDetail,
                                        arguments: [1, true, index,2]);
                                  },
                                  child: CardWidgetBookingScreen(
                                    // image:_bookingScreenController.customerLogin?_bookingScreenController
                                    //     .upComingBookingModelList[index]
                                    //     .serviceProvider![0]
                                    //     .userProfileDetails?.profilePicture??'':_bookingScreenController
                                    //     .upComingBookingModelList[index]
                                    //     .customer![0]
                                    //     .customerProfileDetails
                                    //     ?.profilePicture ?? '' ,
                                    image: ImageAssets.demoImageSecond,
                                 /*   address: !_bookingScreenController.customerLogin?_bookingScreenController
                                        .upComingBookingModelList[index]
                                        .serviceProvider![0]
                                        .userProfileDetails?.address??'':_bookingScreenController
                                        .upComingBookingModelList[index]
                                        .customer![0].customerServiceDetails
                                        ?.addressForService ?? '',*/
                                    address: _bookingScreenController
                                        .onGoingBookingModelList[index]
                                        .customer![0].customerServiceDetails
                                        ?.addressForService ?? '',
                                    date: Utils.formatApiExpireDate(
                                        _bookingScreenController
                                            .onGoingBookingModelList[index]
                                            .customer![0]
                                            .customerServiceDetails
                                            ?.date ??
                                            ''),
                                    distance: Utils.convertMetersToKm(
                                        _bookingScreenController
                                            .onGoingBookingModelList[index]
                                            .serviceProvider![0]
                                            .calculatedDistance ??
                                            0),
                                    money: int.parse(_bookingScreenController
                                        .onGoingBookingModelList[index]
                                        .serviceProvider?[0]
                                        .amount ??
                                        '0'),
                                    name: _bookingScreenController.customerLogin?"${_bookingScreenController
                                        .onGoingBookingModelList[index].serviceProvider![0].userProfileDetails?.firstName} ${_bookingScreenController
                                        .onGoingBookingModelList[index].serviceProvider![0].userProfileDetails?.lastName}":"${_bookingScreenController
                                        .onGoingBookingModelList[index].customer![0].customerProfileDetails?.firstName} ${_bookingScreenController
                                        .onGoingBookingModelList[index].customer![0].customerProfileDetails?.lastName}",
                                    specialty: _bookingScreenController
                                        .onGoingBookingModelList[index]
                                        .serviceProvider?[0]
                                        .serviceProviderDetails
                                        ?.categoriesName ??
                                        '',
                                    time: Utils.fomateTwelveHourTime(_bookingScreenController
                                        .onGoingBookingModelList[index]
                                        .customer?[0]
                                        .customerServiceDetails
                                        ?.startTime?[0] ??
                                        ''),
                                    onCancel: () {},
                                    onMessage: () {

                                    },
                                    onStartClick: () {},
                                    cancelledClick: () {},
                                    completedClick: () {},
                                    makeAsCompleteClick: () {
                                      var serviceProviderId ='';
                                      var serviceId =_bookingScreenController.onGoingBookingModelList[index].serviceProvider?[0].sId??'';
                                      var receiverName =_bookingScreenController.customerLogin?"${_bookingScreenController.onGoingBookingModelList[index].serviceProvider?[0].userProfileDetails?.firstName} ${_bookingScreenController.onGoingBookingModelList[index].serviceProvider?[0].userProfileDetails?.lastName}": "${_bookingScreenController.onGoingBookingModelList[index].customer?[0].customerProfileDetails?.firstName} ${_bookingScreenController.onGoingBookingModelList[index].customer?[0].customerProfileDetails?.lastName}";
                                      if(_bookingScreenController.customerLogin){
                                       serviceProviderId =_bookingScreenController.onGoingBookingModelList[index].serviceProvider?[0].serviceProviderServiceId??'';
                                      }else{
                                       serviceProviderId =_bookingScreenController.onGoingBookingModelList[index].customer?[0].customerServiceId??'';
                                      }
                                      _bookingScreenController.completeBooking(index, serviceId,receiverName,serviceProviderId,false);
                                    },
                                    buttonShowStatus: 1,
                                    customerLogin: _bookingScreenController.customerLogin,
                                  ),
                                );
                              },
                              itemCount: _bookingScreenController.onGoingBookingModelList.length,
                            ),
                          ),
                        ),
                        Offstage(
                          offstage: _bookingScreenController.tabIndex.value == 2
                              ? false
                              : true,
                          child: Obx(
                            () => ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var bookingStatus=_bookingScreenController
                                    .onPastCompleteBookingList[index]
                                    .serviceProvider?[0]
                                    .bookingStatus;
                                var ind = bookingStatus == '3'
                                    ? 2
                                    : 3;
                                print('ind value is ${ind} bookingstatus :${bookingStatus}');
                                return InkWell(
                                  onTap: () {
                                    Get.toNamed(RoutesName.serviceDetail, arguments: [ind, true, index,ind+1]);
                                  },
                                  child: CardWidgetBookingScreen(
                                    // image:_bookingScreenController.customerLogin?_bookingScreenController
                                    //     .upComingBookingModelList[index]
                                    //     .serviceProvider![0]
                                    //     .userProfileDetails?.profilePicture??'':_bookingScreenController
                                    //     .upComingBookingModelList[index]
                                    //     .customer![0]
                                    //     .customerProfileDetails
                                    //     ?.profilePicture ?? '' ,
                                    image: ImageAssets.demoImageSecond,
                                    /*address: !_bookingScreenController.customerLogin?_bookingScreenController
                                        .onPastCompleteBookingList[index]
                                        .serviceProvider![0]
                                        .userProfileDetails?.address??'':_bookingScreenController
                                        .onPastCompleteBookingList[index]
                                        .customer![0].customerServiceDetails
                                        ?.addressForService ?? '',*/
                                    address: _bookingScreenController
                                        .onPastCompleteBookingList[index]
                                        .customer![0].customerServiceDetails
                                        ?.addressForService ?? '',
                                    date: Utils.formatApiExpireDate(
                                        _bookingScreenController
                                            .onPastCompleteBookingList[index]
                                            .customer![0]
                                            .customerServiceDetails
                                            ?.date ??
                                            ''),
                                    distance: Utils.convertMetersToKm(
                                        _bookingScreenController
                                            .onPastCompleteBookingList[index]
                                            .serviceProvider![0]
                                            .calculatedDistance ??
                                            0),
                                    money: int.parse(_bookingScreenController
                                        .onPastCompleteBookingList[index]
                                        .serviceProvider?[0]
                                        .amount ??
                                        '0'),
                                    name: _bookingScreenController.customerLogin?"${_bookingScreenController
                                        .onPastCompleteBookingList[index].serviceProvider![0].userProfileDetails?.firstName} ${_bookingScreenController
                                        .onPastCompleteBookingList[index].serviceProvider![0].userProfileDetails?.lastName}":"${_bookingScreenController
                                        .onPastCompleteBookingList[index].customer![0].customerProfileDetails?.firstName} ${_bookingScreenController
                                        .onPastCompleteBookingList[index].customer![0].customerProfileDetails?.lastName}",
                                    specialty: _bookingScreenController
                                        .onPastCompleteBookingList[index]
                                        .serviceProvider?[0]
                                        .serviceProviderDetails
                                        ?.categoriesName ??
                                        '',
                                    time: Utils.fomateTwelveHourTime(_bookingScreenController
                                        .onPastCompleteBookingList[index]
                                        .customer?[0]
                                        .customerServiceDetails
                                        ?.startTime?[0] ??
                                        ''),
                                    onCancel: () {},
                                    onMessage: () {},
                                    onStartClick: () {},
                                    cancelledClick: () {},
                                    completedClick: () {},
                                    makeAsCompleteClick: () {},
                                    buttonShowStatus: ind,
                                    customerLogin:
                                    _bookingScreenController.customerLogin,
                                  ),
                                );
                              },
                              itemCount: _bookingScreenController.onPastCompleteBookingList.length,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ])),
          ),
        ),
      ),
    );
  }
}
