import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/views/service_detail_customer_view/select_service_detail_date_view/selected_service_detail_time_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';
import '../select_service_detail_view/selected_service_detail_controller.dart';

class SelectServiceDetailDateScreen extends StatefulWidget {
  const SelectServiceDetailDateScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectServiceDetailDateScreen();
  }
}

class _SelectServiceDetailDateScreen extends State<SelectServiceDetailDateScreen> {
    SelectedServiceDetailDateController controller = Get.put(SelectedServiceDetailDateController(),permanent: true);

  var title = TextEditingController();
  var description = TextEditingController();
  var focusDate = DateTime.now();
  var selectedDate = null;
  var chosenDate = DateTime.now();
  var calenderFormat = CalendarFormat.month;
  var changeDate = '';
void clearResource(){
  Get.delete<SelectedServiceDetailController>(force: true);
  Get.delete<SelectedServiceDetailDateController>(force: true);
  Get.back();
}
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        clearResource();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              clearResource();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColor,
              size: ConstantSize.backIconSize,
            ),
          ),
          centerTitle: true,
          title: TextBoldUrbanist(
            txt: 'House Cleaning',
            textAlign: TextAlign.center,
            fontWeight: AppFonts.urbanistMediumWeight,
            textSize: ConstantSize.commonMediumTxtSize,
            txtColor: AppColor.blackColor,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * .023,
                      ),
                      TextBoldUrbanist(
                        txt: 'Select Date & Time',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.viewLineColor,
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColor.countryContainerColor,
                            borderRadius: BorderRadius.circular(
                                ConstantSize.containerWelcomeRadius * 2.5)),
                        child: TableCalendar(
                          weekNumbersVisible: false,
                          pageJumpingEnabled: true,
                          focusedDay: focusDate,
                          firstDay: DateTime.now(),
                          lastDay: DateTime(2040),
                          currentDay: DateTime.now(),
                          headerStyle: HeaderStyle(
                              titleCentered: true, formatButtonVisible: false),
                          startingDayOfWeek: StartingDayOfWeek.monday,
                          // eventLoader: (day) => getEventForLoad(day) ?? [],
                          onFormatChanged: (newFomate) {
                            if (newFomate != calenderFormat) {
                              setState(() {
                                calenderFormat = newFomate;
                              });
                            }
                          },
                          calendarFormat: calenderFormat,
                          onDaySelected: (day, fouceDay) {
                            var format = DateFormat("yyyy-MM-dd");
                            var date = format.format(day).toString();
                            changeDate=date;
                            if (selectedDate != null) {
                              var date2 =
                                  format.format(DateTime.now()).toString();
                              if (date == date2) {
                                setState(() {
                                  focusDate = fouceDay;
                                  chosenDate = day;
                                  selectedDate = null;
                                });
                              } else {
                                if (!isSameDay(selectedDate, day)) {
                                  setState(() {
                                    chosenDate = day;
                                    selectedDate = day;
                                    focusDate = fouceDay;
                                  });
                                }
                              }
                            } else {
                              setState(() {
                                focusDate = fouceDay;
                                chosenDate = day;
                                selectedDate = day;
                              });
                            }
                            // showList(chosenDate);
                          },
                          onDayLongPressed: (day, fouceDay) {
                            if (!isSameDay(chosenDate, day)) {
                              setState(() {
                                chosenDate = day;
                                // selectedDate = day;
                              });
                            }
                            // eventDialog(context);
                          },
                          selectedDayPredicate: (date) {
                            return isSameDay(selectedDate, date);
                          },
                          onPageChanged: (focusedDay) {
                            focusDate = focusedDay;
                          },
                          calendarBuilders: CalendarBuilders(
                            markerBuilder: (context, day, events) => events
                                    .isNotEmpty
                                ? Container(
                                    width: 16,
                                    height: 16,
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      color: Colors.lightBlue,
                                    ),
                                    child: Text(
                                      '${events.length}',
                                      style: const TextStyle(color: Colors.white),
                                    ),
                                  )
                                : null,
                          ),

                          // initialCalendarFormat: CalendarFormat.month,

                          calendarStyle: const CalendarStyle(
                            cellPadding: EdgeInsets.all(5),
                            cellAlignment: Alignment.center,
                            markersAlignment: Alignment.bottomRight,
                            weekendDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.countryContainerColor,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            weekendTextStyle:
                                TextStyle(color: AppColor.blackColor),
                            disabledDecoration: BoxDecoration(
                              color: AppColor.countryContainerColor,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            disabledTextStyle:
                                TextStyle(color: AppColor.blackColor),
                            withinRangeDecoration: BoxDecoration(
                              color: AppColor.countryContainerColor,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            withinRangeTextStyle:
                                TextStyle(color: AppColor.blackColor),
                            outsideDecoration: BoxDecoration(
                              color: AppColor.countryContainerColor,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            outsideTextStyle: TextStyle(color: Colors.black),
                            holidayDecoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            holidayTextStyle:
                                TextStyle(color: AppColor.blackColor),
                            rowDecoration: BoxDecoration(
                              color: AppColor.countryContainerColor,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            defaultDecoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.countryContainerColor,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            defaultTextStyle: TextStyle(color: Colors.black),
                            todayDecoration: BoxDecoration(
                              color: AppColor.backGroundColor,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            todayTextStyle: TextStyle(color: AppColor.whiteColor),
                            selectedDecoration: BoxDecoration(
                              color: AppColor.liteBackGroundColor,
                              shape: BoxShape.circle,
                              // borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            selectedTextStyle:
                                TextStyle(color: AppColor.blackColor),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Get.height * .02,
                      ),
                      TextBoldUrbanist(
                        txt: 'Set Start Time',
                        textAlign: TextAlign.start,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: Get.height * .01,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: GestureDetector(
                          onTap: () {
                            showTimePickerr(context);
                          },
                          child: Container(
                            height: Get.height * .06,
                            padding:
                                const EdgeInsets.all(ConstantSize.commonBtnPadding),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColor.liteBorderColor),
                                color: AppColor.countryContainerColor,
                                borderRadius: BorderRadius.circular(
                                    ConstantSize.containerWelcomeRadius)),
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                ()=> Text(
                          controller.startTime.value=='Set Time'?'Set Time':Utils.fomateTwelveHourTime(controller.startTime.value),
                                    style:const TextStyle(
                                        fontSize: ConstantSize.commonTxtTwelveSize,
                                        color: AppColor.viewLineColor,
                                        fontFamily: AppFonts.urbanistFamily),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                LoadSvg(svgPath: SvgAssets.clock)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ]))),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColor.whiteColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(ConstantSize.containerWelcomeRadius),
                  topLeft: Radius.circular(ConstantSize.containerWelcomeRadius)),
              boxShadow: [
                BoxShadow(
                  color: AppColor.blackColor.withOpacity(0.3),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: ConstantSize.screenPadding),
            width: Get.width,
            child: RoundButton(
                title: "Continue",
                onPress: () =>controller.onClickContinue(changeDate??''),
                width: 40,
                height: 50,
                fontSize: ConstantSize.commonMediumTxtSize,
                fontWeight: AppFonts.poppinsMediumWeight,
                fontFamily: AppFonts.poppinsFamily)),
      ),
    );
  }

  void showTimePickerr(BuildContext context) async {
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
      controller.startTime.value=formattedTime.toString();
    } else {
      print("Time is not selected");
    }
  }
}
