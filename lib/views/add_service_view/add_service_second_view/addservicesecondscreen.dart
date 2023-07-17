import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/views/add_service_view/add_service_second_view/service_second_viewModel.dart';
import 'package:service_provider_two/views/add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/continer_with_dropdownbtn.dart';
import '../../../res/components/round_button.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/utils.dart';
import '../../specialty_view/specialty_view_model.dart';
import 'days_container.dart';

class AddServiceSecondScreen extends StatefulWidget {
  const AddServiceSecondScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddServiceSecondState();
  }
}

class _AddServiceSecondState extends State<AddServiceSecondScreen> {
  ServiceSecondViewModel serviceSecondViewModel = Get.put(ServiceSecondViewModel(), permanent: true);

void cleanResource(){
  Get.delete<ServiceFirstViewModel>(force: true);
  Get.delete<ServiceSecondViewModel>(force: true);
  Get.delete<SpecialtyViewModel>(force: true);
  Get.back();
}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async {
        cleanResource();
        return false;
      },
      child: GestureDetector(
        onTap: () => Utils.hideKeyBoard(context),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            surfaceTintColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                Utils.hideKeyBoard(context);
                cleanResource();

              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColor.blackColor,
                size: ConstantSize.backIconSize,
              ),
            ),
          ),
          body: SingleChildScrollView(
              child: Container(
                  color: AppColor.whiteColor,
                  width: Get.width,
                  padding: const EdgeInsets.only(
                      left: ConstantSize.screenPadding,
                      right: ConstantSize.screenPadding),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: ConstantSize.commonTopPadding,
                        ),
                        TextBoldUrbanist(
                            txt: 'Add Service', textAlign: TextAlign.start),
                        SizedBox(
                          height: Get.height * .035,
                        ),
                        TextBoldUrbanist(
                          txt: 'Select Availability',
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistBoldWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        SizedBox(
                          height: ConstantSize.commonBtwSpaceForForm,
                        ),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: serviceSecondViewModel.dayList.length,
                            itemBuilder: (context, index) {
                            return Obx(() {
                                bool clicked =
                                    serviceSecondViewModel.selectedDays.contains(
                                        serviceSecondViewModel.dayList[index]);
                                return DaysContainer(
                                  title: serviceSecondViewModel.dayList[index],
                                  onPress: () {
                                    serviceSecondViewModel.onDaySelect(
                                        serviceSecondViewModel.dayList[index]);
                                  },
                                  backgroundColor: clicked
                                      ? AppColor.daysSelectedColor
                                      : AppColor.countryContainerColor,
                                  textColor: clicked
                                      ? AppColor.backGroundColor
                                      : AppColor.viewLineColor,
                                  borderRadius: 20,
                                  topBottomPadding: 0,
                                  leftRightPadding: 0,
                                );
                              });
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: Get.height * .02,
                              mainAxisSpacing: Get.height * .02,
                              childAspectRatio:
                                  MediaQuery.of(context).size.width /
                                      (MediaQuery.of(context).size.height / 6),
                            )),
                        SizedBox(
                          height: Get.height * .04,
                        ),
                        Row(
                          children: [
                            TextBoldUrbanist(
                              txt: 'Preferred Timings',
                              textAlign: TextAlign.start,
                              fontWeight: AppFonts.urbanistBoldWeight,
                              textSize: ConstantSize.commonTxtSize,
                              txtColor: AppColor.blackColor,
                            ),
                            Spacer(),
                            Obx(() => SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          width: 1.0,
                                          color: AppColor.liteBorderColor),
                                    ),
                                    checkColor: AppColor.backGroundColor,
                                    activeColor: AppColor.daysSelectedColor,
                                    value: serviceSecondViewModel
                                        .checkBoxSelected.value,
                                    onChanged: (value) {
                                      serviceSecondViewModel
                                              .checkBoxSelected.value =
                                          !serviceSecondViewModel
                                              .checkBoxSelected.value;
                                      serviceSecondViewModel.preferTimingStatusChange();
                                    },
                                  ),
                                )),
                            SizedBox(
                              width: Get.width * .01,
                            ),
                            TextBoldUrbanist(
                              txt: 'Same For All Days',
                              textAlign: TextAlign.start,
                              fontWeight: AppFonts.urbanistBoldWeight,
                              textSize: ConstantSize.commonSmallTxtSize,
                              txtColor: AppColor.blackColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: ConstantSize.commonBtwSpaceForForm,
                        ),
                        InputDecorator(
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.symmetric(horizontal: ConstantSize.commonBtnPadding * 2,vertical: 0),
                              enabledBorder:OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(ConstantSize.containerWelcomeRadius)),
                                  borderSide: BorderSide(
                                      color: AppColor.dividerColor, strokeAlign: 1)
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: Obx(()=>
                                  DropdownButton(icon: SvgPicture.asset(
                                      SvgAssets.dropDownArrow,
                                      semanticsLabel: 'Droup list Arrow'
                                  ),
                                    style: const TextStyle(
                                        fontSize:  ConstantSize.commonTxtSize,
                                        color: AppColor.viewLineColor,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        fontFamily: AppFonts.urbanistFamily),
                                    hint: Text(serviceSecondViewModel.hintSelectedValue.value.isNotEmpty?serviceSecondViewModel.hintSelectedValue.value:'Select Day',style: const TextStyle(
                                        fontSize:  ConstantSize.commonTxtSize,
                                        color: AppColor.viewLineColor,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        fontFamily: AppFonts.urbanistFamily),),
                                    // value: 'selected',
                                    // value: serviceSecondViewModel.selectedDays[serviceSecondViewModel.selectedDayIndex.value>-1?serviceSecondViewModel.selectedDayIndex.value:0],
                                    // value: serviceSecondViewModel.selectedDayIndex.value>-1?serviceSecondViewModel.selectedDays[ serviceSecondViewModel.selectedDayIndex.value]:'Select Day',
                                    items:  serviceSecondViewModel.selectedDays
                                        .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ))
                                        .toList(),
                                    onChanged: (String? value) {
                                      if (value != null) {
                                        serviceSecondViewModel.hintSelectedValue.value=value;
                                      }
                                    },
                                  ),
                              ),
                            )),
                        SizedBox(
                          height: ConstantSize.commonBtwSpaceForForm,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(()=> ContainerWithDropDownBtn(
                                  title:serviceSecondViewModel
                                      .getStartTimeValue(),
                                  onPress: () => {showTimePickerr(context,true)},
                                  width: Get.width / 2 -
                                      (ConstantSize.screenPadding * 2),
                                  enableDropDownBtn: false),
                            ),
                            Obx(()=>  ContainerWithDropDownBtn(
                                  title: serviceSecondViewModel
                                      .getEndTimeValue(),
                                  onPress: () => {
                                    showTimePickerr(context,false)
                                  },
                                  width: Get.width / 2 -
                                      (ConstantSize.screenPadding * 2),
                                  enableDropDownBtn: false),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: ConstantSize.bottomScrollSize,
                        ),
                      ]))),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
                bottom: 0.0,
                left: ConstantSize.screenPadding,
                right: ConstantSize.screenPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundButton(
                  title: "Continue",
                  onPress: () {
                    serviceSecondViewModel.onContinueClicked();
                  },
                ),
                SizedBox(
                  height: ConstantSize.commonBottomPadding,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showTimePickerr(BuildContext context,bool startTime) async {
    TimeOfDay? pickedTime = await showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context, //context of current state
      builder: (context, child) {
        return Theme(
          data: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: AppColor.backGroundColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedTime != null) {
      int hour = pickedTime.hour;
      int minute = pickedTime.minute;
      String formattedTime = '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
      print('time for compare is ${formattedTime}');
      if(startTime){
        serviceSecondViewModel.startTime.value=formattedTime.toString();
        serviceSecondViewModel.setStartTime(serviceSecondViewModel.startTime.value);
      }else{
        print('end time select');
        if(serviceSecondViewModel.startTime.value!= ""|| serviceSecondViewModel.startTime.value.isNotEmpty ) {
        print('start time selected');
        if((serviceSecondViewModel.startTime.value.compareTo(formattedTime.toString()) < 0)) {
          serviceSecondViewModel.endTime.value = formattedTime.toString();
          serviceSecondViewModel.setEndTime(
              serviceSecondViewModel.endTime.value);
        }else{
          Utils.snackBar('End time invalid', 'Your end time is have to greater then start time');
        }
        }else{
        print('end time selected');
          serviceSecondViewModel.startTime.value=formattedTime.toString();
          serviceSecondViewModel.setStartTime(serviceSecondViewModel.startTime.value);
        }
      }
    } else {
      print("Time is not selected");
    }
  }
}
