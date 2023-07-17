// import 'dart:convert';
import 'dart:typed_data';
// import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import '../../../models/payment_list_detial_model.dart';
// import '../../../utils/utils.dart';
import '../add_location_service__detaile_view/add_location_controller.dart';
import '../select_service_detail_date_view/selected_service_detail_time_controller.dart';
import '../select_service_detail_view/selected_service_detail_controller.dart';
import '../service_detail_customer_controller.dart';


class ServicePaymentController extends GetxController {
  SelectedServiceDetailController selectedServiceDetailController = Get.find<
      SelectedServiceDetailController>();
  SelectedServiceDetailDateController selectedServiceDetailDateController = Get
      .find<SelectedServiceDetailDateController>();
  AddLocationController addLocationController = Get.find<
      AddLocationController>();
  ServiceDetailCustomerController serviceDetailCustomerController = Get.find<
      ServiceDetailCustomerController>();

  RxList<PaymentListDetailModel> paymentList = <PaymentListDetailModel>[
    PaymentListDetailModel(selected: true.obs,
        title: '1234',
        icon: ImageAssets.bankCard,
        cardStatus: true),
    PaymentListDetailModel(selected: false.obs,
        title: '1334',
        icon: ImageAssets.bankCard,
        cardStatus: true),
    PaymentListDetailModel(selected: false.obs,
        title: '1534',
        icon: ImageAssets.bankCard,
        cardStatus: true),
  ].obs;

  @override
  void onInit() {
    paymentList.add(PaymentListDetailModel(selected: false.obs,
        title: 'Apple Pay',
        icon: ImageAssets.applePayIcon,
        cardStatus: false));
    paymentList.add(PaymentListDetailModel(selected: false.obs,
        title: 'Google pay',
        icon: ImageAssets.googlePayIcon,
        cardStatus: false));
    getAllData();
    super.onInit();
  }

  void getAllData() {
    var livingRoomValue = selectedServiceDetailController.itemList[0].selected
        .value;
    var badRoomValue = selectedServiceDetailController.itemList[1].selected
        .value;
    var bathroomValue = selectedServiceDetailController.itemList[2].selected
        .value;
    var kitchenValue = selectedServiceDetailController.itemList[3].selected
        .value;
    String selectedDate=selectedServiceDetailDateController.selectedDatee.value;
    String selectedTime=selectedServiceDetailDateController.startTime.value;

    String pinCode=addLocationController.pinCodeEditController.text.trim();
    String landmark=addLocationController.landMarkEditController.text.trim();
    String address=addLocationController.address.value.trim();
    double lat=addLocationController.lat;
    double lng=addLocationController.lng;

    var imageList = <String>[];
    var imageBitesList = <Uint8List>[];
    var imageBitesNameList = <String>[];
    for (int i = 0; i < selectedServiceDetailController.imageList.length; i++) {
      if (kIsWeb) {
        if (selectedServiceDetailController.bitesImageList[i] != null) {
          imageBitesList.add(selectedServiceDetailController.bitesImageList[i]!);
          imageBitesNameList.add(selectedServiceDetailController.bitesImageNameList[i]??"");
        }
      } else {
        if (selectedServiceDetailController.imageList[i] != null) {
          imageList.add(
              selectedServiceDetailController.imageList[i]?.path ?? '');
        }
      }
    }
  }
/*  Future<void> startGooglePay() async {
    final googlePaySupported = await Stripe.instance
        .isPlatformPaySupported(googlePay: IsGooglePaySupportedParams());
    if (googlePaySupported) {
      try {
        // 1. fetch Intent Client Secret from backend
        final response = await fetchPaymentIntentClientSecret();
        final clientSecret = response['clientSecret'];

        // 2.present google pay sheet
        await Stripe.instance.confirmPlatformPayPaymentIntent(
            clientSecret: clientSecret,
            confirmParams: PlatformPayConfirmParams.googlePay(
              googlePay: GooglePayParams(
                testEnv: true,
                merchantName: serviceDetailCustomerController.userData.value.firstName??'',
                merchantCountryCode: '+91',
                currencyCode: 'INR',
              ),
            )
          // PresentGooglePayParams(clientSecret: clientSecret),
        );

        Utils.snackBar('Successfully', 'Google Pay payment succesfully completed');
      } catch (e) {
        if (e is StripeException) {
          print('Error during google pay error: ${e.error}, stackTrace: ${StackTrace.current}');

          Utils.snackBar('Error',e.error.message);

        } else {
          print('Error during google pay error: ${e}, stackTrace: ${StackTrace.current}');
          Utils.snackBar('Error',e.toString());
        }
      }
    } else {
      Utils.snackBar('Error','Google pay is not supported on this device');
    }
  }

  Future<Map<String, dynamic>> fetchPaymentIntentClientSecret() async {
    final url = Uri.parse('http://http://192.168.1.1:8090//create-payment-intent');
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'email': 'example@gmail.com',
        'currency': 'usd',
        'request_three_d_secure': 'any',
      }),
    );
    return json.decode(response.body);
  }*/

}