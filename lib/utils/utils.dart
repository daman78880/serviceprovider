import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/utils/constants.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/utils/share_pref.dart';
import '../res/assets/image_assets.dart';
import '../res/assets/svg_assets.dart';
import '../res/colors/app_color.dart';
import '../res/components/InputFieldCommon.dart';
import '../res/components/TextBoldUrbanist.dart';
import '../res/components/round_button.dart';
import '../res/fonts/app_fonts.dart';
import 'constants_size.dart';


class Utils {

  static Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

 static bool isEmail(String em) {
    String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(p);
    return regExp.hasMatch(em);
  }
  static toastMessage(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }
  static AppBar commonAppBar({String title='' ,bool centerTitle=true}){
         BuildContext? context= Get.context;
   return AppBar(
     backgroundColor: AppColor.whiteColor,
     surfaceTintColor: Colors.transparent,
     leading: InkWell(
       onTap: () {
         context!=null? Utils.hideKeyBoard(context):null;
         Get.back();
       },
       child: const Icon(
         Icons.arrow_back_ios_outlined,
         color: AppColor.blackColor,
         size: ConstantSize.backIconSize,
       ),
     ),
     centerTitle: centerTitle,
     title: title.isNotEmpty?TextBoldUrbanist(
       txt: title,
       textAlign: TextAlign.center,
       fontWeight: AppFonts.urbanistMediumWeight,
       textSize: ConstantSize.commonMediumTxtSize,
       txtColor: AppColor.blackColor,
     ):Container(),
   );
  }


  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
      duration: const Duration(seconds: 3),
    ));
  }
  static void showDialogProgressDialog(BuildContext context, bool isLoading){
   if(isLoading==false){
     // Get.back();
     Navigator.pop(context);
   }else{
    showDialog(
       barrierDismissible: false,
      context: context,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: Container(
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(12.0),
              child: CupertinoActivityIndicator(),
            ),
          ),
        ),
      ),
    );
  }
  }
 static Widget progressDialog(BuildContext context, bool isLoading) {

   Get.defaultDialog(
       contentPadding: const EdgeInsets.all(8),
     content: const Column(
       children: [
          CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColor.backGroundColor))
       ],
     )
   );
   return Visibility(
       visible: isLoading,
       child: Container(
         color: const Color.fromRGBO(0, 0, 0, 0.4),
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         alignment: Alignment.center,
         child: const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(AppColor.backGroundColor),
         ),
       ));
 }

  static void snackBar(String title, String? msg) {
    Get.snackbar(title, msg??'',snackPosition: SnackPosition.TOP,backgroundColor: AppColor.liteBackGroundColor);
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static int getAverage(List<int> data) {
    int average = 0;
    for (int i = 0; i < data.length; i++) {
      average += data[i];
    }
    average = (average / data.length + 1).floor();
    return average;
  }
  static String getLastFourDigit(String value){
    String returnValue='';
    for(int i=0;i<value.length;i++){
      if(i>=value.length-4) {
        returnValue += value[i];
      }
    }
    return returnValue;
  }
  static String formatExpireDate(String value){
    final DateFormat inputFormat = DateFormat('yyyy/MM/dd');
    final DateFormat outputFormat = DateFormat('MM/yy');
    final DateTime parsedDate = inputFormat.parse(value);
    return  outputFormat.format(parsedDate);
  }
  static String formatApiExpireDate(String value){
    print('date for fomate is ${value}');
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final DateFormat outputFormat = DateFormat('yyyy/MM/dd');
    final DateTime parsedDateTime = inputFormat.parse(value);
    final String formattedDate = outputFormat.format(parsedDateTime);
    return formattedDate;
  }
  static String timeFormatForRating(String value){
    print('value is $value');
    if(value.isNotEmpty){
    DateTime now = DateTime.now();
    final DateFormat inputFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    final DateTime parsedDateTime = inputFormat.parse(value);
    // DateTime date = DateTime.parse(value);
    Duration difference = now.difference(parsedDateTime);
    // Duration difference = now.difference(date);
    int weeks = difference.inDays ~/ 7;
     String formattedWeeks = DateFormat('MMM d, yyyy').format(parsedDateTime.subtract(Duration(days: difference.inDays % 7)));
     // String formattedWeeks = DateFormat('MMM d, yyyy').format(date.subtract(Duration(days: difference.inDays % 7)));
    print('${formattedWeeks} (${weeks} week${weeks == 1? "" : "s "+"ago"})');
    // return formattedWeeks;}
    var f='${weeks} week${weeks == 1? "" : "s "+"ago"}';
    return f;}
    else{
      return '0';
    }
  }
  static String convertMetersToKm(double? value){
    print('distance value is ${value}');
    double meter=(value??1.0)/1000;
    print('meter is ${meter}');
    if(meter>=1){
      return "${meter.toStringAsFixed(1)} KM";
    }else{
      return "${value?.toStringAsFixed(1)} M";
    }
  }
  static String convertIntMetersToKm(int? value){
    double  meter=(value??1.0)/1000;
    return meter.toStringAsFixed(1);
  }
  static void hideKeyBoard(BuildContext context) {
    FocusScope.of(context).requestFocus( FocusNode());
  }


  static void serviceStatedDialog() {
    Get.bottomSheet(
        isDismissible: true,
        Container(
            padding: const EdgeInsets.only(top: 30, bottom: 40),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .46,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                LoadSvg(
                  svgPath: SvgAssets.doneService,
                  width: Get.width * .4,
                  height: Get.width * .4,
                ),
                TextBoldUrbanist(
                  txt: 'Your service is started',
                  textAlign: TextAlign.center,
                  fontWeight: AppFonts.poppinsMediumWeight,
                  fontFamily: AppFonts.poppinsFamily,
                  textSize: ConstantSize.commonMediumTxtSize,
                  txtColor: AppColor.blackColor,
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ConstantSize.screenPadding * 1.5),
                  child: TextBoldUrbanist(
                    txt:
                        'Finish your service as fast as you can and come back to get more services offers',
                    textAlign: TextAlign.center,
                    fontWeight: AppFonts.urbanistMediumWeight,
                    textSize: ConstantSize.commonTxtSize,
                    txtColor: AppColor.viewLineColor,
                  ),
                ),
                SizedBox(
                  height: Get.height * .02,
                ),
                RoundButton(
                  title: "Go To Service Details Page",
                  onPress: () {
                    Get.back();
                  },
                  width: Get.width - ConstantSize.screenPadding * 2.5,
                  buttonColor: AppColor.backGroundColor,
                  textColor: AppColor.whiteColor,
                ),
              ])
            ])));
  }

  static void destinationEnterCodeDialog() {
    TextEditingController otpController = TextEditingController();
    BuildContext? context = Get.context;
    Get.bottomSheet(
        isDismissible: true,
        Container(
            padding: const EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .44,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                TextBoldUrbanist(
                  txt: 'Good Job Gurrr!',
                  textAlign: TextAlign.center,
                  textSize: ConstantSize.commonMediumTxtSize,
                  txtColor: AppColor.blackColor,
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                  width: Get.width - 28,
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: const BorderRadius.all(Radius.circular(
                          ConstantSize.commonBottomDialogRadius - 5)),
                      border: Border.all(color: AppColor.dividerColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextBoldUrbanist(
                        txt: 'You arrived at your destination',
                        textAlign: TextAlign.center,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: [
                              TextBoldUrbanist(
                                txt:
                                    'Now enter the security code below to start your service',
                                textAlign: TextAlign.center,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtTwelveSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBoldUrbanist(
                                    txt: 'Enter Code',
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtSize,
                                    txtColor: AppColor.blackColor,
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 0),
                                child: PinCodeTextField(
                                  errorTextSpace: 0,
                                  appContext: context!,
                                  pastedTextStyle: TextStyle(
                                    color: Colors.green.shade600,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  length: 4,
                                  obscureText: false,
                                  obscuringCharacter: '*',
                                  animationType: AnimationType.fade,
                                  validator: (v) {
                                    // if (v.length < 3) {
                                    //   return "I'm from validator";
                                    // } else {
                                    //   return null;
                                    // }
                                      return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  pinTheme: PinTheme(
                                    shape: PinCodeFieldShape.box,
                                    borderRadius: BorderRadius.circular(5),
                                    fieldHeight: 45,
                                    fieldWidth: 45,
                                    activeFillColor:
                                        AppColor.countryContainerColor,
                                    inactiveFillColor:
                                        AppColor.countryContainerColor,
                                    activeColor: AppColor.countryContainerColor,
                                    inactiveColor:
                                        AppColor.countryContainerColor,
                                    selectedColor:
                                        AppColor.countryContainerColor,
                                    selectedFillColor:
                                        AppColor.countryContainerColor,
                                    // hasError ? Colors.orange : Colors.white,
                                  ),

                                  hintCharacter: '-',
                                  cursorColor: AppColor.blackColor,
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  textStyle: const TextStyle(
                                      fontSize: ConstantSize.commonTxtSize,
                                      height: 1.6),
                                  backgroundColor: AppColor.whiteColor,
                                  enableActiveFill: true,
                                  // errorAnimationController: errorPinController,
                                  controller: otpController,
                                  onCompleted: (v) {
                                    if (kDebugMode) {
                                      print("Completed");
                                    }
                                  },
                                  onTap: () {
                                    if (kDebugMode) {
                                      print("Pressed");
                                    }
                                  },
                                  onChanged: (value) {
                                    if (kDebugMode) {
                                      print(value);
                                    }
                                  },

                                  beforeTextPaste: (text) {
                                    if (kDebugMode) {
                                      print("Allowing to paste $text");
                                    }
                                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                                    return true;
                                  },
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextBoldUrbanist(
                                    txt: '00.45',
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtSize,
                                    txtColor: AppColor.redColor,
                                  ),
                                  TextBoldUrbanist(
                                    txt: 'Resend',
                                    textAlign: TextAlign.end,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtSize,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                ],
                              ),
                            ],
                          )),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'The security code has been sent to your Customer',
                        textAlign: TextAlign.center,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonSmallTxtSize,
                        txtColor: AppColor.backGroundColor,
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),
                      RoundButton(
                        title: "Submit",
                        onPress: () {
                          if (kDebugMode) {
                            print('otp is ${otpController.text}');
                          }
                          // if(otpController.text.)
                          // Get.back();
                          // serviceStatedDialog();
                        },
                        width: Get.width - ConstantSize.screenPadding * 2.5,
                        buttonColor: AppColor.backGroundColor,
                        textColor: AppColor.whiteColor,
                      ),
                    ],
                  ),
                ),
              ])
            ])));
  }

  static void serviceRequestDialog(
      {
      required int status,
      required String profileUrl,
      required String name,
      required int money,
      required speciality,
      required String destination,
      required String address,
      required String date,
      required String time}) {
    Get.bottomSheet(
        isDismissible: true,
        Container(
            padding:const EdgeInsets.only(top: 15, bottom: 15),
            alignment: Alignment.bottomCenter,
            width: Get.width,
            height: Get.height * .36,
            decoration: const BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(ConstantSize.commonBottomDialogRadius),
                    topRight: Radius.circular(
                        ConstantSize.commonBottomDialogRadius))),
            child: ListView(children: [
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                TextBoldUrbanist(
                  txt: status==0?'New Booking Requests':speciality,
                  textAlign: TextAlign.center,
                  textSize: ConstantSize.commonMediumTxtSize,
                  txtColor: AppColor.blackColor,
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                Container(
                  padding:
                      const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 20),
                  width: Get.width - 28,
                  decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius:const BorderRadius.all(Radius.circular(
                          ConstantSize.commonBottomDialogRadius - 5)),
                      border: Border.all(color: AppColor.dividerColor)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(800),
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
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextBoldUrbanist(
                                txt: name,
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                              TextBoldUrbanist(
                                txt: speciality,
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonSmallTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextBoldUrbanist(
                                txt: destination,
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonSmallTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  const  Icon(
                                    Icons.calendar_month,
                                    color: AppColor.backGroundColor,
                                    size: ConstantSize.smallIconSize * 1.5,
                                  ),
                                  TextBoldUrbanist(
                                    txt: '$date | ',
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonSmallTxtSize,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                  TextBoldUrbanist(
                                    txt: time,
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonSmallTxtSize,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      const  SizedBox(
                        height: 5,
                      ),
                      TextBoldUrbanist(
                        txt: 'address',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonSmallTxtSize,
                        txtColor: AppColor.viewLineColor,
                      ),
                      TextBoldUrbanist(
                        txt: address,
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonSmallTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppColor.countryContainerColor,
                          borderRadius: BorderRadius.circular(
                              ConstantSize.containerWelcomeRadius + 4),
                        ),
                        padding: const EdgeInsets.only(
                            left: 25, right: 25, top: 5, bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBoldUrbanist(
                              txt: 'Total Earnings',
                              textAlign: TextAlign.start,
                              fontFamily: AppFonts.poppinsFamily,
                              fontWeight: AppFonts.poppinsMediumWeight,
                              textSize: ConstantSize.commonTxtTwelveSize,
                              txtColor: AppColor.blackColor,
                            ),
                            TextBoldUrbanist(
                              txt: '\$$money.00',
                              textAlign: TextAlign.start,
                              fontFamily: AppFonts.poppinsFamily,
                              fontWeight: AppFonts.poppinsMediumWeight,
                              textSize: ConstantSize.commonTxtTwelveSize,
                              txtColor: (status == 0 || status == 2)
                                  ? AppColor.backGroundColor
                                  : AppColor.greenColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),
                      status == 0
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: RoundButton(
                                    title: "Cancel",
                                    onPress: () {
                                      Get.back();
                                    },
                                    buttonColor: AppColor.redColor,
                                    fontFamily: AppFonts.poppinsFamily,
                                    fontWeight: AppFonts.poppinsMediumWeight,
                                    height: Get.height * .055,
                                    buttonPadding:
                                        ConstantSize.commonBtnPadding,
                                  ),
                                ),
                                SizedBox(
                                  width: Get.width * .04,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: RoundButton(
                                    title: "Confirm",
                                    onPress: () {
                                      Get.back();
                                      Utils.serviceRequestDialog(
                                          status: 1,
                                          profileUrl:
                                              ImageAssets.demoImageSecond,
                                          name: 'Daman',
                                          money: 120,
                                          speciality: 'Programming',
                                          destination: '10KM',
                                          address: 'Dera bassi',
                                          date: '24 May 2023',
                                          time: '10.00AM');
                                    },
                                    fontFamily: AppFonts.poppinsFamily,
                                    fontWeight: AppFonts.poppinsMediumWeight,
                                    height: Get.height * .055,
                                    buttonPadding:
                                        ConstantSize.commonBtnPadding,
                                  ),
                                ),
                              ],
                            )
                          : status == 1
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: RoundButton(
                                        title: "Cancel",
                                        onPress: () {
                                          Get.back();
                                        },
                                        buttonColor:
                                            AppColor.liteBackGroundColor,
                                        fontFamily: AppFonts.poppinsFamily,
                                        fontWeight:
                                            AppFonts.poppinsMediumWeight,
                                        height: Get.height * .055,
                                        buttonPadding:
                                            ConstantSize.commonBtnPadding,
                                        textColor: AppColor.backGroundColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * .04,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: RoundButton(
                                        title: "Confirm",
                                        onPress: () {
                                          Get.back();
                                          Utils.serviceRequestDialog(
                                              status: 2,
                                              profileUrl:
                                                  ImageAssets.demoImageSecond,
                                              name: 'Daman',
                                              money: 120,
                                              speciality: 'Programming',
                                              destination: '10KM',
                                              address: 'Dera bassi',
                                              date: '24 May 2023',
                                              time: '10.00AM');
                                        },
                                        fontFamily: AppFonts.poppinsFamily,
                                        fontWeight:
                                            AppFonts.poppinsMediumWeight,
                                        height: Get.height * .055,
                                        buttonPadding:
                                            ConstantSize.commonBtnPadding,
                                        textColor: AppColor.whiteColor,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: RoundButton(
                                        title: "chat",
                                        onPress: () {
                                          // Get.toNamed(RoutesName.chatScreen);
                                          Get.back();
                                        },
                                        buttonColor: AppColor.backGroundColor,
                                        fontFamily: AppFonts.poppinsFamily,
                                        fontWeight:
                                            AppFonts.poppinsMediumWeight,
                                        height: Get.height * .055,
                                        buttonPadding:
                                            ConstantSize.commonBtnPadding,
                                        textColor: AppColor.whiteColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * .04,
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          const LoadSvg(svgPath: SvgAssets.onWayIcon),
                                          SizedBox(width: Get.width*.01,),
                                          TextBoldUrbanist(
                                            txt: 'On the Way',
                                            textAlign: TextAlign.start,
                                            fontFamily: AppFonts.poppinsFamily,
                                            fontWeight:
                                                AppFonts.poppinsMediumWeight,
                                            textSize: ConstantSize
                                                .commonTxtTwelveSize,
                                            txtColor: AppColor.blackColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                    ],
                  ),
                ),
              ])
            ])));
  }
  static String dayToNumber(String value) {
    switch (value) {
      case "Monday":
        return '1';
      case "Tuesday":
        return '2';
      case "Wednesday":
        return '3';
      case "Thursday":
        return '4';
      case "Friday":
        return '5';
      case "Saturday":
        return '6';
      case "Sunday":
        return '7';
      default:
        return '0';
    }
  }

  static String numberToDay(String value){
  switch(value){
    case '1':
      return 'Monday';
    case '2':
      return 'Tuesday';
    case '3':
      return 'Wednesday';
    case '4':
      return 'Thursday';
    case '5':
      return 'Friday';
    case '6':
      return 'Saturday';
    case '7':
      return 'Sunday';
    default:
      return 'Sunday';
  }
}
static   List<String> indianBanks = [
  'State Bank of India',
  'ICICI Bank',
  'HDFC Bank',
  'Axis Bank',
  'Bank of Baroda',
  'Punjab National Bank',
  'Canara Bank',
  'Union Bank of India',
  'IndusInd Bank',
  'Kotak Mahindra Bank',
  'Bank of India',
  'IDBI Bank',
  'Central Bank of India',
  'Indian Bank',
  'Bank of Maharashtra',
  'UCO Bank',
  'Syndicate Bank',
  'Oriental Bank of Commerce',
  'Andhra Bank',
  'Punjab & Sind Bank',
  'Federal Bank',
  'Karur Vysya Bank',
  'South Indian Bank',
  'IDFC First Bank',
  'RBL Bank',
  'Yes Bank',
  'Standard Chartered Bank',
  'Citi Bank',
  'HSBC Bank',
  'DBS Bank',
];
static saveUserProfileData(String? firstName,String? lastName,String? email,String? gender,String? address,double? lat,double? lng)async{
    SharePref.setString(Constants.firstName, firstName??'');
    SharePref.setString(Constants.lastName, lastName??'');
    SharePref.setString(Constants.email, email??'');
    SharePref.setString(Constants.gender, gender??'');
    SharePref.setString(Constants.address ,address??'');
    SharePref.setDouble(Constants.lat ,lat??0);
    SharePref.setDouble(Constants.lng ,lng??0);
}
static String fomateTwelveHourTime(String time){
  DateTime parsedTime = DateFormat.Hm().parse(time); // Parse the 24-hour time
  String twelveHourTime = DateFormat.jm().format(parsedTime);
  return twelveHourTime;
}

static String getChatId(String idOne,String idTwo, String serviceId){
  if (idOne.hashCode > idTwo.hashCode) {
    return "${idOne}_${idTwo}_$serviceId";
  } else {
    return "${idTwo}_${idOne}_$serviceId";
  }
}

static String convertMillisecondsToTime(int time){
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time);
    String formattedTime = DateFormat.jm().format(dateTime);
    return formattedTime;
  }

  static bool checkGreaterThanMin(int first,int second){
    DateTime time1 = DateTime.fromMillisecondsSinceEpoch(first);
    DateTime time2 = DateTime.fromMillisecondsSinceEpoch(second); // Add 1 minute to time1
     int difference = time2.difference(time1).inMilliseconds;
    if (difference > 60000) {
      return true;
    } else {
      return false;
    }
  }




}
