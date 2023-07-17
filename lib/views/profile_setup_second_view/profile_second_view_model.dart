import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import '../../respository/profile_edit_repository.dart';
import '../../utils/authentication.dart';
import '../../utils/constants.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class ProfileSecondViewModel extends GetxController {
  final _myRepo = ProfileRepository();
  TextEditingController stateNameController = TextEditingController();
  TextEditingController cityNameController = TextEditingController();
  TextEditingController pinCodeNameController = TextEditingController();
  TextEditingController landMarkNameController = TextEditingController();
  FocusNode stateNameFocusNode = FocusNode();
  FocusNode cityNameFocusNode = FocusNode();
  FocusNode pinCodeNameFocusNode = FocusNode();
  FocusNode landMarkNameFocusNode = FocusNode();
  RxString address = 'Address'.obs;
  double lat = 0;
  double lng = 0;

  void addressClick() async {
    BuildContext? context = Get.context;
    if(kIsWeb){
      lat = 30.596403;
      lng = 76.843269;
      address.value = 'Dera Bassi, Punjab, India';
    }else {
      // var p = await PlacesAutocomplete.show(
      //   context: context!,
      //   apiKey: StringUtils.mapKey,
      //   onError: (value) {
      //     print('error $value');
      //   },
      //   mode: Mode.fullscreen,
      //   language: 'en',
      //   components: [Component(Component.country, 'in')],
      // );
      // await displayPrediction(p, ScaffoldMessenger.of(context));


      // const kGoogleApiKey = "AIzaSyDOGwVObwVRbB7ue1rqkvyFbarZFDBHeuM";


      Prediction? p = await PlacesAutocomplete.show(
          context: context!,
          apiKey: StringUtils.mapKey,
          radius: 10000000,
          types: [],
          logo: const SizedBox.shrink(),
          strictbounds: false,
          mode: Mode.fullscreen,
          // Mode.fullscreen
          language: "en",
          components: [
            Component(
                Component.country, "fr"),
            Component(
                Component.country, "in"),
            Component(Component.country, "UK")]);
      displayPrediction(p);
    }
  }

  Future<void> displayPrediction(Prediction? p) async {
    if (p == null) {
      return;
    }
    final _places = GoogleMapsPlaces(
      apiKey: StringUtils.mapKey,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    final detail = await _places.getDetailsByPlaceId(p.placeId!);
    final geometry = detail.result.geometry!;
    lat = geometry.location.lat;
    lng = geometry.location.lng;
    address.value = p.description ?? '';
  }

  void onContinueClicked() async {
    var state=stateNameController.text.trim();
    var city=cityNameController.text.trim();
    var pinCode=pinCodeNameController.text.trim();
    var landMark=landMarkNameController.text.trim();
    var address=this.address.value.trim();
    bool isCustomer = await SharePref.getBoolean(Constants.loginAsCustomer);
    if (state.isNotEmpty) {
      if (city.isNotEmpty) {
        if (pinCode.isNotEmpty) {
          if (landMark.isNotEmpty) {
            if (address != 'Address') {
              if (lat != 0 && lng != 0) {
                String firstName = Get.arguments['firstName'];
                String lastName = Get.arguments['lastName'];
                String email = Get.arguments['email'];
                String gender = Get.arguments['gender'];
                Utils.saveUserProfileData(firstName,lastName,email, gender=="1"?'Male':'Female',address,lat,lng);
                if (Constants.apiWorking) {
                  BuildContext? context = Get.context;
                  Utils.showDialogProgressDialog(context!, true);
                  var locationData={
                    "type": "Point",
                    "coordinates": [
                      lat,
                     lng
                    ]
                  };
                  var data = {
                    'firstName': firstName,
                    'lastName': lastName,
                    'email': email,
                    'gender': gender,
                    'state': stateNameController
                        .text,
                    'city': cityNameController
                        .text,
                    'pinCode': pinCodeNameController
                        .text,
                    'landMark': landMark,
                    'address': address,
                    'location':locationData
                  };
                  _myRepo.ediProfileUpdateApi(data).then((value) {
                    Utils.showDialogProgressDialog(context, false);
                    if (kDebugMode) {
                      print("success login with number kDebug mode");
                    }
                    SharePref.setString(Constants.loginId,value.data?.sId??'');

                    if (isCustomer) {
                      SharePref.setBools(Constants.loginAsCustomer,true);
                      SharePref.setBools(Constants.homeLogin,true);
                      Authentication.subscribeTopic(value.data?.sId??'');
                      Get.offAllNamed(RoutesName.homeCustomerScreen)?.then((valuee)  {
                        Get.delete<ProfileSecondViewModel>();
                      });
                    }
                    else {
                      SharePref.setBools(Constants.loginAsCustomer,false);
                      SharePref.setBools(Constants.homeLogin,true);
                      Authentication.subscribeTopic(value.data?.sId??'');
                      Get.offAllNamed(RoutesName.homeScreen)?.then((valuee)  {
                        Get.delete<ProfileSecondViewModel>();
                      });
                      // Get.offNamed(RoutesName.specialtyScreen)?.then((value) => Get.delete<ProfileSecondViewModel>());
                    }
                  }).onError((error, stackTrace) {
                    Utils.showDialogProgressDialog(context!, false);
                      Utils.snackBar('Error', error.toString());
                    if (kDebugMode) {
                      print("error:${error.toString()}");
                    }
                  });

                } else {
                  if (isCustomer) {
                    SharePref.setBools(Constants.loginAsCustomer,true);
                    SharePref.setBools(Constants.homeLogin,true);
                    Get.offAllNamed(RoutesName.homeCustomerScreen)?.then((valuee)  {
                      Get.delete<ProfileSecondViewModel>();
                    });
                  } else {
                    SharePref.setBools(Constants.loginAsCustomer,false);
                    SharePref.setBools(Constants.homeLogin,true);
                    Get.offAllNamed(RoutesName.homeScreen)?.then((valuee)  {
                      Get.delete<ProfileSecondViewModel>();
                    }); }
                }
              } else {
                Utils.snackBar('Address Empty', 'Please enter Address name');
              }
            } else {
              Utils.snackBar(
                  'Address fetch error', 'Please select another address');
            }
          } else {
            Utils.snackBar('LandMark Empty', 'Please enter LandMark name');
          }
        } else {
          Utils.snackBar('PinCode Empty', 'Please enter PinCode name');
        }
      } else {
        Utils.snackBar('City Empty', 'Please enter city name');
      }
    } else {
      Utils.snackBar('State Empty', 'Please enter state name');
    }
  }
}
