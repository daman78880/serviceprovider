import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/requests_view/request_card_widget.dart';
import '../../models/upcoming_booking_model.dart';
import '../../res/assets/image_assets.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';
import '../booking_view/booking_screen_controller.dart';

class RequestScreenView extends StatelessWidget {
  final BookingScreenController _bookingScreenController = Get.find<BookingScreenController>();


  List<UpcomingBookingModel> list = [
    UpcomingBookingModel(
        imageUrl: ImageAssets.demoImage,
        name: "Daman",
        address: "Dera bassi",
        date: '24 May 2023',
        distance: '10KM',
        money: 20,
        specialty: 'Programming',
        time: '10:00 AM'),
    UpcomingBookingModel(
        imageUrl: ImageAssets.demoImage,
        name: "Vivek",
        address: "Mohali",
        date: '05 June 2023',
        distance: '13KM',
        money: 120,
        specialty: 'Cleaning',
        time: '11:00 AM'),
    UpcomingBookingModel(
        imageUrl: ImageAssets.demoImage,
        name: "Khem Singh",
        address: "Mohali Sector 8",
        date: '05 June 2023',
        distance: '15KM',
        money: 220,
        specialty: 'Singing',
        time: '11:00 AM'),
    UpcomingBookingModel(
        imageUrl: ImageAssets.demoImage,
        name: "Rank pusher",
        address: "Mohali Sector 3b2",
        date: '10 June 2023',
        distance: '15KM',
        money: 220,
        specialty: 'Playing Game',
        time: '12:00 AM'),
  ];



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
            alignment: Alignment.center,
            color: AppColor.whiteColor,
            width: Get.width,
            padding: const EdgeInsets.only(
                left: ConstantSize.screenPadding, right: ConstantSize.screenPadding),
            child: Column(children: [
              Container(
                height: AppBar().preferredSize.height,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: ConstantSize.homeImageSize - 10,
                      width: ConstantSize.homeImageSize - 10,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              ConstantSize.containerWelcomeRadius),
                          color: AppColor.backGroundColor),
                      child: Image.asset(
                        ImageAssets.splashImage,
                        fit: BoxFit.fill,
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
              SizedBox(
                height: Get.height * .025,
              ),
              Obx(
                    ()=> ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed(RoutesName.serviceDetail,arguments: [0,false,index,0]);
                      },
                      child: RequestCardWidget(
                        // image: list[index].imageUrl ,
                        // address: list[index].address ,
                        // date: list[index].date ,
                        // distance: list[index].distance ,
                        // name: list[index].name ,
                        // time: list[index].time ,
                        // specialty: list[index].specialty ,
                        // money: list[index].money ,

                        // image:_bookingScreenController.customerLogin?_bookingScreenController
                        //     .confirmBookingModelList[index]
                        //     .serviceProvider![0]
                        //     .userProfileDetails?.profilePicture??'':_bookingScreenController
                        //     .confirmBookingModelList[index]
                        //     .customer![0]
                        //     .customerProfileDetails
                        //     ?.profilePicture ?? '' ,
                        image: ImageAssets.demoImageSecond,
                        address: _bookingScreenController
                            .confirmBookingModelList[index]
                            .customer![0].customerServiceDetails
                            ?.addressForService ?? '',
                        date: Utils.formatApiExpireDate(
                            _bookingScreenController
                                .confirmBookingModelList[index]
                                .customer![0]
                                .customerServiceDetails
                                ?.date ??
                                ''),
                        distance: Utils.convertMetersToKm(
                            _bookingScreenController
                                .confirmBookingModelList[index]
                                .serviceProvider![0]
                                .calculatedDistance ??
                                0),
                        money: int.parse(_bookingScreenController
                            .confirmBookingModelList[index]
                            .serviceProvider?[0]
                            .amount ??
                            '0'),
                        name: _bookingScreenController.customerLogin?"${_bookingScreenController
                            .confirmBookingModelList[index].serviceProvider![0].userProfileDetails?.firstName} ${_bookingScreenController
                            .confirmBookingModelList[index].serviceProvider![0].userProfileDetails?.lastName}":"${_bookingScreenController
                            .confirmBookingModelList[index].customer![0].customerProfileDetails?.firstName} ${_bookingScreenController
                            .confirmBookingModelList[index].customer![0].customerProfileDetails?.lastName}",
                        specialty: _bookingScreenController
                            .confirmBookingModelList[index]
                            .serviceProvider?[0]
                            .serviceProviderDetails
                            ?.categoriesName ??
                            '',
                        time: Utils.fomateTwelveHourTime(_bookingScreenController
                            .confirmBookingModelList[index]
                            .customer?[0]
                            .customerServiceDetails
                            ?.startTime?[0] ??
                            ''),
                        onCancel: () {
                          var serviceId =_bookingScreenController.confirmBookingModelList[index].serviceProvider?[0].sId??'';
                          _bookingScreenController.cancelBookingForConfirm(index,serviceId,false);

                        },onConfirm: () {
                          var serviceId =_bookingScreenController.confirmBookingModelList[index].serviceProvider?[0].sId??'';
                      _bookingScreenController.confirmBooking(index,serviceId,false);
                        // Get.toNamed(RoutesName.serviceMap,arguments: [0]);
                        },
                      ),
                    );
                  },
                  itemCount: _bookingScreenController
                      .confirmBookingModelList.length,
                ),
              )
            ])),
      ),
    );
  }
}
