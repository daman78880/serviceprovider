import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/models/booking_model.dart';
import 'package:service_provider_two/respository/home_repository.dart';
import 'package:service_provider_two/views/home_customer_view/home_customer_controller.dart';
import '../../models/upcoming_booking_model.dart';
import '../../res/assets/image_assets.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/InputFieldCommon.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants.dart';
import '../../utils/constants_size.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/share_pref.dart';
import '../../utils/utils.dart';
import '../home_view/home_controller.dart';

class BookingScreenController extends GetxController {
  late  HomeController _homeController;
  late HomeCustomerController _homeControllerCustomer;
  final _myRepo = HomeRepository();
  bool customerLogin=true;
  TabController? tabController;


/*
  RxList<UpcomingBookingModel> upComingBookingList = <UpcomingBookingModel>[
    // UpcomingBookingModel(
    //     imageUrl: ImageAssets.demoImage,
    //     name: "Daman",
    //     address: "Dera bassi",
    //     date: '24 May 2023',
    //     distance: '10KM',
    //     money: 20,
    //     specialty: 'Programming',
    //     time: '10:00 AM'),
    // UpcomingBookingModel(
    //     imageUrl: ImageAssets.demoImage,
    //     name: "Amit kumar",
    //     address: "Dera bassi",
    //     date: '24 May 2023',
    //     distance: '10KM',
    //     money: 20,
    //     specialty: 'Programming',
    //     time: '10:00 AM'),
    // UpcomingBookingModel(
    //     imageUrl: ImageAssets.demoImage,
    //     name: "Vivek",
    //     address: "Mohali",
    //     date: '05 June 2023',
    //     distance: '13KM',
    //     money: 120,
    //     specialty: 'Cleaning',
    //     time: '11:00 AM'),
    // UpcomingBookingModel(
    //     imageUrl: ImageAssets.demoImage,
    //     name: "Khem Singh",
    //     address: "Mohali Sector 8",
    //     date: '05 June 2023',
    //     distance: '15KM',
    //     money: 220,
    //     specialty: 'Singing',
    //     time: '11:00 AM'),
    // UpcomingBookingModel(
    //     imageUrl: ImageAssets.demoImage,
    //     name: "Rank pusher",
    //     address: "Mohali Sector 3b2",
    //     date: '10 June 2023',
    //     distance: '15KM',
    //     money: 220,
    //     specialty: 'Playing Game',
    //     time: '12:00 AM'),
      ].obs;
  RxList<UpcomingBookingModel> onGoingBookingList = [
    UpcomingBookingModel(
        imageUrl: ImageAssets.demoImage,
        name: "Pardeep",
        address: "Himchal pardesh",
        date: '23 June 2023',
        distance: '133KM',
        money: 250,
        specialty: 'Programming',
        time: '10:00 AM'),
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
        name: "Ankush kumar",
        address: "Dera bassi",
        date: '4 Feb 2023',
        distance: '130KM',
        money: 420,
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
  ].obs;
  RxList<UpcomingBookingModel> onPastBookingList = [
    UpcomingBookingModel(
        imageUrl: ImageAssets.demoImage,
        name: "Rahul Singh",
        address: "Mohali Sector 8",
        date: '05 June 2023',
        distance: '14KM',
        money: 220,
        specialty: 'Singing',
        time: '11:00 AM'),
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
        name: "Amit kumar",
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
  ].obs;
*/
  RxList<Data> confirmBookingModelList=<Data>[].obs;
  RxList<Data> upComingBookingModelList=<Data>[].obs;
  RxList<Data> onGoingBookingModelList=<Data>[].obs;
  RxList<Data> onPastCompleteBookingList=<Data>[].obs;
  RxInt tabIndex = 0.obs;
  String userId='';

  @override
  void onInit() {
    init();
    super.onInit();
  }

  @override
  void onReady() {
    initializeController();


    // getData();
    super.onReady();
  }
  void initializeController()async{
    if(await SharePref.getBoolean(Constants.loginAsCustomer)){
    _homeControllerCustomer = Get.find<HomeCustomerController>();
    }else{
      _homeController = Get.find<HomeController>();
    }
  }
  void init()async{
    customerLogin= await SharePref.getBoolean(Constants.loginAsCustomer);

  }

  void onTabChangeIndex(int value) {
    print("before tab change ${tabIndex.value}");
    // if(tabIndex.value!=value){
    tabIndex.value = value;
    print("after tab change ${tabIndex.value}");
    // }else{
    //   print("else part");
    // }
  }

  void getData() {
    print('booking get api called');
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.getListOfBookings().then((value) {
      if (kDebugMode) {
        print("success booking get");
      }
      Utils.showDialogProgressDialog(context, false);
      // 1 -> Upcoming , 2 -> onGoing , 3-> Complete , 4-> Cancel
      // upComingBookingList.clear();
      // onPastBookingList.clear();
      // onGoingBookingList.clear();
      upComingBookingModelList.clear();
      onGoingBookingModelList.clear();
      onPastCompleteBookingList.clear();
      confirmBookingModelList.clear();
      print('asdfsdfsdf up${upComingBookingModelList.length}\nonGo${onGoingBookingModelList.length}'
          '\nonPast${onPastCompleteBookingList.length}\nconfirmBookingModelList${confirmBookingModelList.length}');
      for (int i = 0; i < (value.data?.serviceProvider?.length ?? 0); i++) {
        print('inserting data $i status ${  value.data?.serviceProvider?[i].serviceProviderDetails?.status}');
        if (value.data?.serviceProvider?[i].serviceProviderDetails?.status !=
                null && value.data?.serviceProvider?[i].serviceProviderDetails?.status ==
                'active') {
          if(value.data?.serviceProvider?[i].bookingStatus !=
              null && value.data?.serviceProvider?[i].bookingStatus ==
              '0') {
            confirmBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
    } else if(value.data?.serviceProvider?[i].bookingStatus !=
              null && value.data?.serviceProvider?[i].bookingStatus ==
              '1') {
            upComingBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
            // upComingBookingList.add(UpcomingBookingModel(
            //     imageUrl: ImageAssets.demoImage,
            //     name: "Daman",
            //     specialty: value.data?.serviceProvider?[i]
            //         .serviceProviderDetails
            //         ?.categoriesName ??
            //         '',
            //     distance: Utils.convertMetersToKm(
            //         value.data?.serviceProvider?[i].calculatedDistance ?? 0),
            //     // distance: "1.0",
            //     time: value.data?.customer?[i].customerServiceDetails
            //         ?.startTime?[0] ??
            //         '',
            //     date: Utils.formateApiExpireDate(
            //         value.data?.customer?[i].customerServiceDetails?.date ??
            //             ''),
            //     // date: 'date',
            //     address:
            //     value.data?.customer?[i].customerServiceDetails?.landmark ??
            //         'd',
            //     money: int.parse(value.data?.customer?[i].amount ?? '0')));
            // delete below code only for testing
          /*  onGoingBookingList.add(UpcomingBookingModel(
                imageUrl: ImageAssets.demoImage,
                name: "Daman",
                specialty: value.data?.serviceProvider?[i]
                    .serviceProviderDetails
                    ?.categoriesName ??
                    '',
                distance: Utils.convertMetersToKm(
                    value.data?.serviceProvider?[i].calculatedDistance ?? 0),
                // distance: "1.0",
                time: value.data?.customer?[i].customerServiceDetails
                    ?.startTime?[0] ??
                    '',
                date: Utils.formateApiExpireDate(
                    value.data?.customer?[i].customerServiceDetails?.date ??
                        ''),
                // date: 'date',
                address:
                value.data?.customer?[i].customerServiceDetails?.landmark ??
                    'd',
                money: int.parse(value.data?.customer?[i].amount ?? '0')));
            onPastBookingList.add(UpcomingBookingModel(
                imageUrl: ImageAssets.demoImage,
                name: "Daman",
                specialty: value.data?.serviceProvider?[i]
                    .serviceProviderDetails
                    ?.categoriesName ??
                    '',
                distance: Utils.convertMetersToKm(
                    value.data?.serviceProvider?[i].calculatedDistance ?? 0),
                // distance: "1.0",
                time: value.data?.customer?[i].customerServiceDetails
                    ?.startTime?[0] ??
                    '',
                date: Utils.formateApiExpireDate(
                    value.data?.customer?[i].customerServiceDetails?.date ??
                        ''),
                // date: 'date',
                address:
                value.data?.customer?[i].customerServiceDetails?.landmark ??
                    'd',
                money: int.parse(value.data?.customer?[i].amount ?? '0'),buttonShowStatus: 3));
            onPastBookingList.add(UpcomingBookingModel(
                imageUrl: ImageAssets.demoImage,
                name: "Daman",
                specialty: value.data?.serviceProvider?[i]
                    .serviceProviderDetails
                    ?.categoriesName ??
                    '',
                distance: Utils.convertMetersToKm(
                    value.data?.serviceProvider?[i].calculatedDistance ?? 0),
                // distance: "1.0",
                time: value.data?.customer?[i].customerServiceDetails
                    ?.startTime?[0] ??
                    '',
                date: Utils.formateApiExpireDate(
                    value.data?.customer?[i].customerServiceDetails?.date ??
                        ''),
                // date: 'date',
                address:
                value.data?.customer?[i].customerServiceDetails?.landmark ??
                    'd',
                money: int.parse(value.data?.customer?[i].amount ?? '0'),buttonShowStatus: 2));*/
            // onGoingBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
            // onPastCompleteBookingList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
          }
          else if(value.data?.serviceProvider?[i].bookingStatus !=
              null && value.data?.serviceProvider?[i].bookingStatus ==
              '2'){
            onGoingBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));

            // onGoingBookingList.add(UpcomingBookingModel(
            //     imageUrl: ImageAssets.demoImage,
            //     name: "Daman",
            //     specialty: value.data?.serviceProvider?[i]
            //         .serviceProviderDetails
            //         ?.categoriesName ??
            //         '',
            //     distance: Utils.convertMetersToKm(
            //         value.data?.serviceProvider?[i].calculatedDistance ?? 0),
            //     // distance: "1.0",
            //     time: value.data?.customer?[i].customerServiceDetails
            //         ?.startTime?[0] ??
            //         '',
            //     date: Utils.formateApiExpireDate(
            //         value.data?.customer?[i].customerServiceDetails?.date ??
            //             ''),
            //     // date: 'date',
            //     address:
            //     value.data?.customer?[i].customerServiceDetails?.landmark ??
            //         'd',
            //     money: int.parse(value.data?.customer?[i].amount ?? '0')));
          }else if(value.data?.serviceProvider?[i].bookingStatus !=
              null && (value.data?.serviceProvider?[i].bookingStatus ==
              '3' || value.data?.serviceProvider?[i].bookingStatus ==
              '4') ){
            onPastCompleteBookingList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
            // onPastBookingList.add(UpcomingBookingModel(
            //     imageUrl: ImageAssets.demoImage,
            //     name: "Daman",
            //     specialty: value.data?.serviceProvider?[i]
            //         .serviceProviderDetails
            //         ?.categoriesName ??
            //         '',
            //     distance: Utils.convertMetersToKm(
            //         value.data?.serviceProvider?[i].calculatedDistance ?? 0),
            //     // distance: "1.0",
            //     time: value.data?.customer?[i].customerServiceDetails
            //         ?.startTime?[0] ??
            //         '',
            //     date: Utils.formateApiExpireDate(
            //         value.data?.customer?[i].customerServiceDetails?.date ??
            //             ''),
            //     // date: 'date',
            //     address:
            //     value.data?.customer?[i].customerServiceDetails?.landmark ??
            //         'd',
            //     money: int.parse(value.data?.customer?[i].amount ?? '0'),buttonShowStatus: 2));
          }else{
            print('else part');
          }
        }
      }
      print('qwqweqwewqeqwe up${upComingBookingModelList.length}\nonGo${onGoingBookingModelList.length}'
          '\nonPast${onPastCompleteBookingList.length}\nconfirmBookingModelList${confirmBookingModelList.length}');
      // if(fromMap){
      //   Get.offNamed(RoutesName.serviceDetail, arguments: [1, true, selectedIndex,1])?.then((value) => _bookingScreenController.getData());
      // }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      print('booking get api called error');
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
  void getDataWithoutLoader() {
    _myRepo.getListOfBookings().then((value) {
      if (kDebugMode) {
        print("success booking get");
      }
      upComingBookingModelList.clear();
      onGoingBookingModelList.clear();
      onPastCompleteBookingList.clear();
      confirmBookingModelList.clear();
    for (int i = 0; i < (value.data?.serviceProvider?.length ?? 0); i++) {
        print('inserting data $i status ${  value.data?.serviceProvider?[i].serviceProviderDetails?.status}');
        if (value.data?.serviceProvider?[i].serviceProviderDetails?.status !=
                null && value.data?.serviceProvider?[i].serviceProviderDetails?.status ==
                'active') {
          if(value.data?.serviceProvider?[i].bookingStatus !=
              null && value.data?.serviceProvider?[i].bookingStatus ==
              '0') {
            confirmBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
    } else if(value.data?.serviceProvider?[i].bookingStatus !=
              null && value.data?.serviceProvider?[i].bookingStatus ==
              '1') {
            upComingBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
            // upComingBookingList.add(UpcomingBookingModel(
            //     imageUrl: ImageAssets.demoImage,
            //     name: "Daman",
            //     specialty: value.data?.serviceProvider?[i]
            //         .serviceProviderDetails
            //         ?.categoriesName ??
            //         '',
            //     distance: Utils.convertMetersToKm(
            //         value.data?.serviceProvider?[i].calculatedDistance ?? 0),
            //     // distance: "1.0",
            //     time: value.data?.customer?[i].customerServiceDetails
            //         ?.startTime?[0] ??
            //         '',
            //     date: Utils.formateApiExpireDate(
            //         value.data?.customer?[i].customerServiceDetails?.date ??
            //             ''),
            //     // date: 'date',
            //     address:
            //     value.data?.customer?[i].customerServiceDetails?.landmark ??
            //         'd',
            //     money: int.parse(value.data?.customer?[i].amount ?? '0')));
            // delete below code only for testing
          /*  onGoingBookingList.add(UpcomingBookingModel(
                imageUrl: ImageAssets.demoImage,
                name: "Daman",
                specialty: value.data?.serviceProvider?[i]
                    .serviceProviderDetails
                    ?.categoriesName ??
                    '',
                distance: Utils.convertMetersToKm(
                    value.data?.serviceProvider?[i].calculatedDistance ?? 0),
                // distance: "1.0",
                time: value.data?.customer?[i].customerServiceDetails
                    ?.startTime?[0] ??
                    '',
                date: Utils.formateApiExpireDate(
                    value.data?.customer?[i].customerServiceDetails?.date ??
                        ''),
                // date: 'date',
                address:
                value.data?.customer?[i].customerServiceDetails?.landmark ??
                    'd',
                money: int.parse(value.data?.customer?[i].amount ?? '0')));
            onPastBookingList.add(UpcomingBookingModel(
                imageUrl: ImageAssets.demoImage,
                name: "Daman",
                specialty: value.data?.serviceProvider?[i]
                    .serviceProviderDetails
                    ?.categoriesName ??
                    '',
                distance: Utils.convertMetersToKm(
                    value.data?.serviceProvider?[i].calculatedDistance ?? 0),
                // distance: "1.0",
                time: value.data?.customer?[i].customerServiceDetails
                    ?.startTime?[0] ??
                    '',
                date: Utils.formateApiExpireDate(
                    value.data?.customer?[i].customerServiceDetails?.date ??
                        ''),
                // date: 'date',
                address:
                value.data?.customer?[i].customerServiceDetails?.landmark ??
                    'd',
                money: int.parse(value.data?.customer?[i].amount ?? '0'),buttonShowStatus: 3));
            onPastBookingList.add(UpcomingBookingModel(
                imageUrl: ImageAssets.demoImage,
                name: "Daman",
                specialty: value.data?.serviceProvider?[i]
                    .serviceProviderDetails
                    ?.categoriesName ??
                    '',
                distance: Utils.convertMetersToKm(
                    value.data?.serviceProvider?[i].calculatedDistance ?? 0),
                // distance: "1.0",
                time: value.data?.customer?[i].customerServiceDetails
                    ?.startTime?[0] ??
                    '',
                date: Utils.formateApiExpireDate(
                    value.data?.customer?[i].customerServiceDetails?.date ??
                        ''),
                // date: 'date',
                address:
                value.data?.customer?[i].customerServiceDetails?.landmark ??
                    'd',
                money: int.parse(value.data?.customer?[i].amount ?? '0'),buttonShowStatus: 2));*/
            // onGoingBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
            // onPastCompleteBookingList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
          }
          else if(value.data?.serviceProvider?[i].bookingStatus !=
              null && value.data?.serviceProvider?[i].bookingStatus ==
              '2'){
            onGoingBookingModelList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));

            // onGoingBookingList.add(UpcomingBookingModel(
            //     imageUrl: ImageAssets.demoImage,
            //     name: "Daman",
            //     specialty: value.data?.serviceProvider?[i]
            //         .serviceProviderDetails
            //         ?.categoriesName ??
            //         '',
            //     distance: Utils.convertMetersToKm(
            //         value.data?.serviceProvider?[i].calculatedDistance ?? 0),
            //     // distance: "1.0",
            //     time: value.data?.customer?[i].customerServiceDetails
            //         ?.startTime?[0] ??
            //         '',
            //     date: Utils.formateApiExpireDate(
            //         value.data?.customer?[i].customerServiceDetails?.date ??
            //             ''),
            //     // date: 'date',
            //     address:
            //     value.data?.customer?[i].customerServiceDetails?.landmark ??
            //         'd',
            //     money: int.parse(value.data?.customer?[i].amount ?? '0')));
          }else if(value.data?.serviceProvider?[i].bookingStatus !=
              null && (value.data?.serviceProvider?[i].bookingStatus ==
              '3' || value.data?.serviceProvider?[i].bookingStatus ==
              '4') ){
            onPastCompleteBookingList.add(Data(customer: [value.data!.customer![i]],serviceProvider: [value.data!.serviceProvider![i]]));
            // onPastBookingList.add(UpcomingBookingModel(
            //     imageUrl: ImageAssets.demoImage,
            //     name: "Daman",
            //     specialty: value.data?.serviceProvider?[i]
            //         .serviceProviderDetails
            //         ?.categoriesName ??
            //         '',
            //     distance: Utils.convertMetersToKm(
            //         value.data?.serviceProvider?[i].calculatedDistance ?? 0),
            //     // distance: "1.0",
            //     time: value.data?.customer?[i].customerServiceDetails
            //         ?.startTime?[0] ??
            //         '',
            //     date: Utils.formateApiExpireDate(
            //         value.data?.customer?[i].customerServiceDetails?.date ??
            //             ''),
            //     // date: 'date',
            //     address:
            //     value.data?.customer?[i].customerServiceDetails?.landmark ??
            //         'd',
            //     money: int.parse(value.data?.customer?[i].amount ?? '0'),buttonShowStatus: 2));
          }else{
            print('else part');
          }
        }
      }
      print('qwqweqwewqeqwe up${upComingBookingModelList.length}\nonGo${onGoingBookingModelList.length}'
          '\nonPast${onPastCompleteBookingList.length}\nconfirmBookingModelList${confirmBookingModelList.length}');

    }).onError((error, stackTrace) {
      Utils.snackBar('Error', error.toString());
      print('booking get api called error');
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

  void bookingCancel(int index,String id,bool back){

    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.cancelBooking(id).then((value) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("cancel booking successfully");
      }
      if(value.status==200){
        getDataWithoutLoader();
        // upComingBookingModelList.removeAt(index);
        if(back!=null && back == true){
          Get.back();
        }
      }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
  void onGernateOptClick(String serviceId,){
    print('service id ${serviceId}');
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.generateOtpBookingApi(serviceId).then((value) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("Opt Gernate successfully ${value.data}");
      }
      if(value.status==200){
        Utils.snackBar(value.data??'','Your Otp is');
      }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

  void confirmBooking(int index,String serviceId,bool fromService){
    print('service id ${serviceId}');
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.confirmBookingApi(serviceId).then((value) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("booking confirm successfully ");
      }
      // if(value.status==200){
        confirmBookingModelList.removeAt(index);
      if(fromService){
        Get.back();
      }
      // }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);

      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
  void completeBooking(int index,String serviceId,String userName,String serviceProviderId,bool fromService){
    print('service id ${serviceId}');
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.completeBookingApi(serviceId).then((value) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("booking confirm successfully serviceId${serviceId} : serviceProviderId:${serviceProviderId} ");
      }
      // if(value.status==200){

      // var serviceId=onGoingBookingModelList[index].serviceProvider?[0].serviceProviderDetails?.sId??'';
      //  onGoingBookingModelList.removeAt(index);
      getDataWithoutLoader();
      ratingCustomerDialog(ImageAssets.demoImageSecond, userName,serviceProviderId,fromService);
      // }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);

      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
  void cancelBookingForConfirm(int index,String id,bool fromService){
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.cancelBooking(id).then((value) {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("cancel booking successfully");
      }
      if(value.status==200){
        confirmBookingModelList.removeAt(index);
        if(fromService){
          Get.back();
        }
      }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
   void ratingCustomerDialog(String profileUrl, String userName, String serviceId, bool fromService) {

    TextEditingController commentController = TextEditingController();
    ValueNotifier<int> bottomSheetCustomerRating = ValueNotifier(5);
    Get.bottomSheet(
        isDismissible: false,
        Container(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          alignment: Alignment.bottomCenter,
          width: Get.width,
          height: Get.height * .8,
          decoration: const BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft:
                  Radius.circular(ConstantSize.commonBottomDialogRadius),
                  topRight:
                  Radius.circular(ConstantSize.commonBottomDialogRadius))),
          child: ListView(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextBoldUrbanist(
                  txt: 'Rate your ${this.customerLogin?"provicer":"customer"}!',
                  textAlign: TextAlign.center,
                  textSize: ConstantSize.commonBoldTxtSize,
                  txtColor: AppColor.blackColor,
                ),
                SizedBox(
                  height: Get.height * .015,
                ),
                const Divider(
                  color: AppColor.dividerColor,
                ),
                SizedBox(
                  height: Get.height * .015,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantSize.screenPadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(855),
                        child: Image.asset(
                          profileUrl,
                          fit: BoxFit.cover,
                          width: ConstantSize.homeImageSize,
                          height: ConstantSize.homeImageSize,
                        ),
                      ),
                      SizedBox(
                        width: Get.width * .025,
                      ),
                      TextBoldUrbanist(
                        txt: userName,
                        textAlign: TextAlign.center,
                        textSize: ConstantSize.commonBigTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      Spacer(),
                      Column(
                        children: [
                          TextBoldUrbanist(
                            txt: 'Reviews',
                            textAlign: TextAlign.center,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                              ),
                              ValueListenableBuilder(
                                valueListenable: bottomSheetCustomerRating,
                                builder: (context, value, child) {
                                  return TextBoldUrbanist(
                                    txt: '$value.0',
                                    textAlign: TextAlign.center,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtSize,
                                    txtColor: AppColor.blackColor,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: Get.width * .015,
                ),
                const Divider(
                  color: AppColor.dividerColor,
                ),
                SizedBox(
                  height: Get.height * .015,
                ),
                TextBoldUrbanist(
                  txt: 'Rate your customer',
                  textAlign: TextAlign.center,
                  fontWeight: AppFonts.urbanistMediumWeight,
                  textSize: ConstantSize.commonTxtSize,
                  txtColor: AppColor.viewLineColor,
                ),
                SizedBox(
                  width: Get.width * .15,
                ),
                RatingBar.builder(
                  initialRating: 5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => SvgPicture.asset(
                      SvgAssets.startSilver,
                      colorFilter:
                      const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                      semanticsLabel: 'A red up arrow'),
                  onRatingUpdate: (rating) {
                    bottomSheetCustomerRating.value = rating.toInt();
                  },
                  unratedColor: AppColor.silverColor,
                  itemSize: 30,
                ),
                SizedBox(
                  height: Get.height * .015,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantSize.screenPadding),
                  child: InputFieldCommon(
                    controller: commentController,
                    hint: "Any comments? ",
                    maxLines: 4,
                    keyBoardType: TextInputType.multiline,
                    topBottomPadding: ConstantSize.commonBtnPadding * 1.5,
                  ),
                ),
                SizedBox(
                  height: Get.height * .015,
                ),
                const Divider(
                  color: AppColor.dividerColor,
                ),
                SizedBox(
                  height: Get.height * .015,
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantSize.screenPadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RoundButton(
                        title: "Back to home",
                        onPress: ()async {
                          Get.back();
                          if(fromService){
                          Get.back();
                          }
                          if(this.customerLogin){
                          _homeControllerCustomer.changeBottonNavigationIndex(0);
                          }else{
                          _homeController.changeBottonNavigationIndex(0);
                          }
                          // _homeController.changeBottonNavigationIndex(0);
                        },
                        width: Get.width / 2 - ConstantSize.screenPadding * 2.3,
                        buttonColor: AppColor.liteBackGroundColor,
                        textColor: AppColor.backGroundColor,
                        height: Get.height * .055,
                        fontSize: ConstantSize.commonTxtSize,
                        fontFamily: AppFonts.poppinsFamily,
                        fontWeight: AppFonts.poppinsMediumWeight,
                      ),
                      RoundButton(
                        title: "Submit",
                        onPress: ()async {
                          if(fromService){
                            Get.back();
                          }
                          ratingApi(serviceId,commentController.text.trim(),bottomSheetCustomerRating.value.toString());
                        },
                        width: Get.width / 2 - ConstantSize.screenPadding * 2.3,
                        buttonColor: AppColor.backGroundColor,
                        textColor: AppColor.whiteColor,
                        height: Get.height * .055,
                        fontSize: ConstantSize.commonTxtSize,
                        fontFamily: AppFonts.poppinsFamily,
                        fontWeight: AppFonts.poppinsMediumWeight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ));
    getData();
  }
  void ratingApi(String serviceId, String comment,String ratting){
    var data={
      "rating":int.parse(ratting),
      "comments":comment,
      "serviceId":serviceId
    };
    print('data fwerge g${data}');
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.rattingApi(data).then((value)async {
      Utils.showDialogProgressDialog(context, false);
      if (kDebugMode) {
        print("giving ratting successfully");
      }
      Get.back();
      if(await SharePref.getBoolean(Constants.loginAsCustomer)){
      _homeControllerCustomer.changeBottonNavigationIndex(0);
      }else{
      _homeController.changeBottonNavigationIndex(0);
      }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }
}
