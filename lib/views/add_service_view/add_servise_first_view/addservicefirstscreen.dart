import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/views/add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/InputFieldCommon.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/round_button.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/utils.dart';
import '../../specialty_view/specialty_view_model.dart';

class AddServiceFirstScreen extends StatefulWidget {
  const AddServiceFirstScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AddServiceFirstState();
  }
}

class _AddServiceFirstState extends State<AddServiceFirstScreen> {
  ServiceFirstViewModel serviceViewModel = Get.put(ServiceFirstViewModel(), permanent: true);


void cleanResource(){
  Get.delete<ServiceFirstViewModel>(force: true);
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
                            txt: 'Service Name',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistBoldWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          SizedBox(
                            height: ConstantSize.commonBtwSpaceForForm,
                          ),
                          InputFieldCommon(
                            controller: serviceViewModel.serviceNameController,
                            hint: "Service Name",
                            focusNode: serviceViewModel.serviceNameFocusNode,
                            nextFocusNode:
                                serviceViewModel.totalExperienceFocusNode,
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          TextBoldUrbanist(
                            txt: 'Total Experience',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistBoldWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          SizedBox(
                            height: ConstantSize.commonBtwSpaceForForm,
                          ),
                          InputFieldCommon(
                            controller:
                                serviceViewModel.totalExperienceController,
                            hint: "Total Experience",
                            focusNode:
                                serviceViewModel.totalExperienceFocusNode,
                            nextFocusNode:
                                serviceViewModel.chargePerServiceFocusNode,
                            keyBoardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          TextBoldUrbanist(
                            txt: 'Charges per service',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistBoldWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          SizedBox(
                            height: ConstantSize.commonBtwSpaceForForm,
                          ),
                          InputFieldCommon(
                            controller:
                                serviceViewModel.chargePerServiceController,
                            hint: "\$ Add cost",
                            focusNode:
                                serviceViewModel.chargePerServiceFocusNode,
                            nextFocusNode:
                                serviceViewModel.descriptionFocusNode,
                            keyBoardType: TextInputType.number,
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),

                          TextBoldUrbanist(
                            txt: 'Area Range',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistBoldWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          TextBoldUrbanist(
                            txt: '0 KM',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistBoldWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          SliderTheme(
                            data: SliderThemeData(
                              activeTrackColor: AppColor.backGroundColor,
                              inactiveTrackColor: AppColor.viewLineColor,
                              thumbColor: AppColor.backGroundColor,
                              showValueIndicator: ShowValueIndicator.always,
                              valueIndicatorColor: AppColor.whiteColor,
                              valueIndicatorTextStyle: const TextStyle(
                                color: AppColor.viewLineColor,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                fontSize: ConstantSize.commonTxtSize,
                              ),
                              trackShape: CustomTrackShape(),
                            ),
                            child: Obx(()=>Slider(
                                value: serviceViewModel.valueRange.value,
                                onChanged: (double value) {
                                  setState(() {
                                    serviceViewModel.valueRange.value = value;
                                  });
                                },
                                label: "${serviceViewModel.valueRange.value.round()} KM",
                                min: 0,
                                max: 12,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: Get.height * .02,
                          ),
                          TextBoldUrbanist(
                            txt: 'Description',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistBoldWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.blackColor,
                          ),
                          SizedBox(
                            height: ConstantSize.commonBtwSpaceForForm,
                          ),
                          InputFieldCommon(
                            controller: serviceViewModel.descriptionController,
                            hint: "Brief Introduction",
                            focusNode: serviceViewModel.descriptionFocusNode,
                            maxLines: 5,
                            keyBoardType: TextInputType.multiline,

                            topBottomPadding: ConstantSize.commonBtnPadding * 2,
                          ),
                          SizedBox(height: ConstantSize.bottomScrollSize,),


                        ]))
            ),
          bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 0.0, left: ConstantSize.screenPadding, right:ConstantSize.screenPadding),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RoundButton(
                title: "Continue",
                onPress: () => serviceViewModel.onContinueClicked(),
              ),
              SizedBox(height: ConstantSize.commonBottomPadding,)
            ],),
        ),),
      ),
    );
  }

}

class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double? trackHeight = sliderTheme.trackHeight;
    final double trackLeft = offset.dx;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight!) / 2;
    final double trackWidth = parentBox.size.width;
    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
