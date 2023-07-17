import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../booking_view/booking_screen_controller.dart';

class ServiceDetailController extends GetxController {
  RxList<String> imageList = [
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond,
    ImageAssets.demoImageSecond
  ].obs;
  final BookingScreenController bookingScreenController = Get.find<BookingScreenController>();
  int buttonStatus = 0;
  int selectedIndex = 0;
  int tabIndex = 0;
  RxBool comeFromBookingScreenStatus = false.obs;

  RxString userProfile = ImageAssets.demoImageSecond.obs;
  RxString serviceId = '#'.obs;
  RxString name = 'Andrew Chadwick'.obs;

  RxString address = ''.obs;
  RxString subCategory = ''.obs;
  RxString price = ''.obs;
  RxString serviceName = ''.obs;
  RxString orderId = ''.obs;
  RxString dateTime = ''.obs;
  RxString description = ''.obs;
  RxList<String> imageListt = <String>[].obs;
  RxInt livingRoom=0.obs;
  RxInt bedRoom=0.obs;
  RxInt bathRoom=0.obs;
  RxInt kitchen=0.obs;
  RxInt dinningRoom=0.obs;
  bool fromMap=false;

  @override
  void onInit() {
    Utils.hideKeyBoard(Get.context!);
    buttonStatus = Get.arguments[0] ?? 0;
    comeFromBookingScreenStatus.value = Get.arguments[1] ?? false;
    selectedIndex = Get.arguments[2] ?? 0;
    tabIndex = Get.arguments[3] ?? 0;
    print('inside service detail\nbuttonStatus$buttonStatus\nfromBooking$comeFromBookingScreenStatus\nindex$selectedIndex\ntabIndex');
    setData();
    super.onInit();
  }
  @override
  void onClose() {
    bookingScreenController.getDataWithoutLoader();
    super.onClose();
  }

void setData(){
  if(tabIndex==0){
    serviceId.value="#${bookingScreenController
        .confirmBookingModelList[selectedIndex].serviceProvider![0].sId}";
    if(buttonStatus==0){
      name.value=bookingScreenController.customerLogin?"${bookingScreenController
          .confirmBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
          .confirmBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
          .confirmBookingModelList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
          .confirmBookingModelList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
      // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
      //     .confirmBookingModelList[selectedIndex]
      //     .serviceProvider![0]
      //     .userProfileDetails?.profilePicture??'':bookingScreenController
      //     .confirmBookingModelList[selectedIndex]
      //     .customer![0]
      //     .customerProfileDetails
      //     ?.profilePicture ?? '' ;
      address.value=bookingScreenController.confirmBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.addressForService??'Temp';
      dateTime.value="${Utils.formatApiExpireDate(bookingScreenController.confirmBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${Utils.fomateTwelveHourTime(bookingScreenController.confirmBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0')}";
      description.value=bookingScreenController.confirmBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
      bookingScreenController.confirmBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
        imageListt.add(element);
      });
      subCategory.value=bookingScreenController.confirmBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
      price.value=bookingScreenController.confirmBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
      serviceName.value=bookingScreenController.confirmBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
      livingRoom.value=bookingScreenController.confirmBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
      bedRoom.value=bookingScreenController.confirmBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
      bathRoom.value=bookingScreenController.confirmBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
      kitchen.value=bookingScreenController.confirmBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
      dinningRoom.value=0;
    } else{
      print('inside else part please check in service detail controller**************************');
    }
  }
    else if(tabIndex==1){
      print('inside tabIndex');
      serviceId.value="#${bookingScreenController
          .upComingBookingModelList[selectedIndex].serviceProvider![0].sId}";
      if(buttonStatus==0){
        name.value=bookingScreenController.customerLogin?"${bookingScreenController
            .upComingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
            .upComingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
            .upComingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
            .upComingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
        // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
        //     .upComingBookingModelList[selectedIndex]
        //     .serviceProvider![0]
        //     .userProfileDetails?.profilePicture??'':bookingScreenController
        //     .upComingBookingModelList[selectedIndex]
        //     .customer![0]
        //     .customerProfileDetails
        //     ?.profilePicture ?? '' ;
        address.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.addressForService??'Temp';
        dateTime.value="${Utils.formatApiExpireDate(bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${Utils.fomateTwelveHourTime(bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0')}";
        description.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
        bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
          imageListt.add(element);
        });
        subCategory.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
        price.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
        serviceName.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
        livingRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
        bedRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
        bathRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
        kitchen.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
        dinningRoom.value=0;
      } else{
        if(buttonStatus==1){
          fromMap=true;
          name.value=bookingScreenController.customerLogin?"${bookingScreenController
              .upComingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
              .upComingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
              .upComingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
              .upComingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
          // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
          //     .upComingBookingModelList[selectedIndex]
          //     .serviceProvider![0]
          //     .userProfileDetails?.profilePicture??'':bookingScreenController
          //     .upComingBookingModelList[selectedIndex]
          //     .customer![0]
          //     .customerProfileDetails
          //     ?.profilePicture ?? '' ;
          address.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.addressForService??'Temp';
          dateTime.value="${Utils.formatApiExpireDate(bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${Utils.fomateTwelveHourTime(bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0')}";
          description.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
          bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
            imageListt.add(element);
          });
          subCategory.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
          price.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
          serviceName.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
          livingRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
          bedRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
          bathRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
          kitchen.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
          dinningRoom.value=0;

        }
        print('inside else part please check in service detail controller**************************');
      }
    }
    else if(tabIndex==2){
      serviceId.value="#${bookingScreenController
          .onGoingBookingModelList[selectedIndex].serviceProvider![0].sId}";
      if(buttonStatus==1){
        name.value=bookingScreenController.customerLogin?"${bookingScreenController
            .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
            .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
            .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
            .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
        // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
        //     .upComingBookingModelList[selectedIndex]
        //     .serviceProvider![0]
        //     .userProfileDetails?.profilePicture??'':bookingScreenController
        //     .upComingBookingModelList[selectedIndex]
        //     .customer![0]
        //     .customerProfileDetails
        //     ?.profilePicture ?? '' ;
        address.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.addressForService??'Temp';
        dateTime.value="${Utils.formatApiExpireDate(bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${Utils.fomateTwelveHourTime(bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0')}";
        description.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
        bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
          imageListt.add(element);
        });
        subCategory.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
        price.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
        serviceName.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
        livingRoom.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
        bedRoom.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
        bathRoom.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
        kitchen.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
        dinningRoom.value=0;

      }else{
        print('inside else part please check in service detail controller**************************');
      }
    }
    else{
      serviceId.value="#${bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider![0].sId}";
     if(buttonStatus==2||buttonStatus==3){
        name.value=bookingScreenController.customerLogin?"${bookingScreenController
            .onPastCompleteBookingList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
            .onPastCompleteBookingList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
            .onPastCompleteBookingList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
            .onPastCompleteBookingList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
        // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
        //     .onGoingBookingModelList[selectedIndex]
        //     .serviceProvider![0]
        //     .userProfileDetails?.profilePicture??'':bookingScreenController
        //     .onGoingBookingModelList[selectedIndex]
        //     .customer![0]
        //     .customerProfileDetails
        //     ?.profilePicture ?? '' ;
        address.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.addressForService??'Temp';
        dateTime.value="${Utils.formatApiExpireDate(bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${Utils.fomateTwelveHourTime(bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0')}";
        description.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
        bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
          imageListt.add(element);
        });
        subCategory.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
        price.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].amount??'0';
        serviceName.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].amount??'0';
        livingRoom.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
        bedRoom.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
        bathRoom.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
        kitchen.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
        dinningRoom.value=0;

      }else{
        print('inside else part please check in service detail controller**************************');
      }
    }
   /* serviceId.value="#${bookingScreenController
        .onGoingBookingModelList[selectedIndex].serviceProvider![0].sId}";
  if(buttonStatus==0){
    name.value=bookingScreenController.customerLogin?"${bookingScreenController
        .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
        .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
        .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
        .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
    // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
    //     .upComingBookingModelList[selectedIndex]
    //     .serviceProvider![0]
    //     .userProfileDetails?.profilePicture??'':bookingScreenController
    //     .upComingBookingModelList[selectedIndex]
    //     .customer![0]
    //     .customerProfileDetails
    //     ?.profilePicture ?? '' ;
    address.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.landmark??'Temp';
    description.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
    bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
      imageListt.add(element);
    });
    subCategory.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
    price.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
    serviceName.value=bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
    dateTime.value="${Utils.formateApiExpireDate(bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0'}";
    livingRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
    bedRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
    bathRoom.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
    kitchen.value=bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
    dinningRoom.value=0;
  }else if(buttonStatus==1){
    name.value=bookingScreenController.customerLogin?"${bookingScreenController
        .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
        .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
        .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
        .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
    // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
    //     .upComingBookingModelList[selectedIndex]
    //     .serviceProvider![0]
    //     .userProfileDetails?.profilePicture??'':bookingScreenController
    //     .upComingBookingModelList[selectedIndex]
    //     .customer![0]
    //     .customerProfileDetails
    //     ?.profilePicture ?? '' ;
    address.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.landmark??'Temp';
    description.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
    bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
      imageListt.add(element);
    });
    subCategory.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
    price.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
    serviceName.value=bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].amount??'0';
    dateTime.value="${Utils.formateApiExpireDate(bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0'}";
    livingRoom.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
    bedRoom.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
    bathRoom.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
    kitchen.value=bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
    dinningRoom.value=0;

  }else if(buttonStatus==2||buttonStatus==3){
    name.value=bookingScreenController.customerLogin?"${bookingScreenController
        .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.firstName} ${bookingScreenController
        .onGoingBookingModelList[selectedIndex].serviceProvider![0].userProfileDetails?.lastName}":"${bookingScreenController
        .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.firstName} ${bookingScreenController
        .onGoingBookingModelList[selectedIndex].customer![0].customerProfileDetails?.lastName}";
    // userProfile.value=  bookingScreenController.customerLogin?bookingScreenController
    //     .upComingBookingModelList[selectedIndex]
    //     .serviceProvider![0]
    //     .userProfileDetails?.profilePicture??'':bookingScreenController
    //     .upComingBookingModelList[selectedIndex]
    //     .customer![0]
    //     .customerProfileDetails
    //     ?.profilePicture ?? '' ;
    address.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.landmark??'Temp';
    description.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.description??'Temp';
    bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.images?.forEach((element) {
      imageListt.add(element);
    });
    subCategory.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].serviceProviderDetails?.categoriesName??'Temp';
    price.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].amount??'0';
    serviceName.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].serviceProvider?[0].amount??'0';
    dateTime.value="${Utils.formateApiExpireDate(bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.date??'0')} | ${bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.startTime?[0]??'0'}";
    livingRoom.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.livingRoom??0;
    bedRoom.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.bedRoom??0;
    bathRoom.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.bathRoom??0;
    kitchen.value=bookingScreenController.onPastCompleteBookingList[selectedIndex].customer?[0].customerServiceDetails?.kitchen??0;
    dinningRoom.value=0;

  }else{
   print('inside else part please check in service detail controller**************************');
  }*/

}
void onCancelServiceClick(){
  bookingScreenController.bookingCancel(selectedIndex, bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider![0].sId!,true);
}
void onConfirmBookingClick(){
  var serviceId =bookingScreenController.confirmBookingModelList[selectedIndex].serviceProvider?[0].sId??'';
  bookingScreenController.confirmBooking(selectedIndex,serviceId,true);
}
void onStartGenerateOtpClick(){
  if(bookingScreenController.customerLogin){
    var serviceId =bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].sId??'';
    bookingScreenController.onGernateOptClick(serviceId);
  }else {
    Get.toNamed(RoutesName.serviceMap, arguments: [4,selectedIndex]);
  }
}
void onMakerAsCompleteClick(){
  if(fromMap){
    var serviceProviderId ='';
    var serviceId =bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].sId??'';
    var receiverName =bookingScreenController.customerLogin?"${bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.firstName} ${bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.lastName}": "${bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.firstName} ${bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.lastName}";

    if(bookingScreenController.customerLogin){
      serviceProviderId =bookingScreenController.upComingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderServiceId??'';
    }else{
      serviceProviderId =bookingScreenController.upComingBookingModelList[selectedIndex].customer?[0].customerServiceId??'';
    }
    bookingScreenController.completeBooking(selectedIndex, serviceId,receiverName,serviceProviderId,true);
  }else{
    var serviceProviderId ='';
    var serviceId =bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].sId??'';
    var receiverName =bookingScreenController.customerLogin?"${bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.firstName} ${bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].userProfileDetails?.lastName}": "${bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.firstName} ${bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerProfileDetails?.lastName}";

    if(bookingScreenController.customerLogin){
      serviceProviderId =bookingScreenController.onGoingBookingModelList[selectedIndex].serviceProvider?[0].serviceProviderServiceId??'';
    }else{
      serviceProviderId =bookingScreenController.onGoingBookingModelList[selectedIndex].customer?[0].customerServiceId??'';
    }
    bookingScreenController.completeBooking(selectedIndex, serviceId,receiverName,serviceProviderId,true);
  }
}
}
