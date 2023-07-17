import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import '../../../respository/profile_edit_repository.dart';
import '../../../utils/constants.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';

class EditProfileController extends GetxController {
  final _myRepo = ProfileRepository();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailNameController = TextEditingController();
  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode = FocusNode();
  FocusNode emailNameFocusNode = FocusNode();
  RxString address = ''.obs;
  double  lat = 0;
  double  lng = 0;
  RxList<String> genderList = <String>['Male', 'Female'].obs;
  RxString hintGender = 'Select Gender'.obs;

  @override
  void onInit() {
    setData();
    super.onInit();
  }

  void onContinueClicked() {
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    String address = this.address.value.trim();
    String email = emailNameController.text.trim();
    String gender = hintGender.value;
    if (firstName.isNotEmpty) {
      if (lastName.isNotEmpty) {
        if (email.isNotEmpty) {
          if (Utils.isEmail(email)) {
            if (gender!='Select Gender') {
              if (address.isNotEmpty) {
                if(lat>0&&lng>0) {
                  if (Constants.apiWorking) {
                    BuildContext? context = Get.context;
                    Utils.showDialogProgressDialog(context!, true);
                    var locationData = {
                      "type": "Point",
                      "coordinates": [
                        lat,
                        lng
                      ]
                    };
                    var data = {
                      "firstName": firstName,
                      "email": email,
                      "lastName": lastName,
                      "address": address,
                      "stages": '7',
                      "gender": gender=='Male'?'1':'2',
                      "location": locationData,
                    };
                    _myRepo.ediProfileUpdateApi(data).then((value) {
                      Utils.showDialogProgressDialog(context, false);
                      if (kDebugMode) {
                        print("success login with number kDebug mode");
                      }
                      Utils.saveUserProfileData(firstName, lastName, email, gender, address,lat,lng);
                      Get.back();
                      Get.delete<EditProfileController>();
                    }).onError((error, stackTrace) {
                      Utils.showDialogProgressDialog(context, false);
                        Utils.snackBar('Error', error.toString());
                      if (kDebugMode) {
                        print("error:${error.toString()}");
                      }
                    });
                  } else {
                    Get.back();
                    Get.delete<EditProfileController>();
                  }
                }else{
                Utils.snackBar('Error Getting Address ', 'Please select again address.');
                }
              } else {
                Utils.snackBar('Address Empty', 'Please enter addess field.');
              }
            } else {
              Utils.snackBar('Gender UnSelected', 'Please selecte gender');
            }
          } else {
            Utils.snackBar('Invalid Email', 'Please enter valid email.');
          }
        } else {
          Utils.snackBar('Email Empty', 'Please enter email field.');

        }
      } else {
        Utils.snackBar('Lastname Empty', 'Please enter last name field.');
      }
    } else {
      Utils.snackBar('Firstname Empty', 'Please enter first name field.');
    }

  }

  void setData() async {
    firstNameController.text = await SharePref.getString(Constants.firstName);
    lastNameController.text = await SharePref.getString(Constants.lastName);
    emailNameController.text = await SharePref.getString(Constants.email);
    var gen=await SharePref.getString(Constants.gender);
    hintGender.value = gen;
    address.value = await SharePref.getString(Constants.address);
    lat = await SharePref.getDouble(Constants.lat);
    lng = await SharePref.getDouble(Constants.lng);
  }

  void addressClick() async {
    BuildContext? context = Get.context;
    if(kIsWeb){
      lat = 30.596403;
      lng = 76.843269;
      address.value = 'Dera Bassi, Punjab, India';
    }else {
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


}
