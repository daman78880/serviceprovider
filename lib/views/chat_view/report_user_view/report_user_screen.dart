import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/views/chat_view/report_user_view/report_user_controller.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/InputFieldCommon.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/loadsvg.dart';
import '../../../res/components/round_button.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/utils.dart';

class ReportUserScreen extends StatefulWidget {
  const ReportUserScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReportUserState();
  }
}

class _ReportUserState extends State<ReportUserScreen> {
  final ReportUserController _reportUserController = Get.put(ReportUserController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Utils.hideKeyBoard(context);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColor,
              size: ConstantSize.backIconSize,
            ),
          ),
          centerTitle: true,
          title: TextBoldUrbanist(
            txt: 'Report',
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
                // height: Get.height-Get.height*.15,
                // height: Get.height-AppBar().preferredSize.height,
                padding: const EdgeInsets.only(
                    left: ConstantSize.screenPadding,
                    right: ConstantSize.screenPadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: Get.height * .04,
                      ),
                      TextBoldUrbanist(
                        txt: 'Please select the reason for Report',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 19,
                            width: 19,
                            child: Obx(() => GestureDetector(
                                onTap: () {
                                  _reportUserController.scamCheckStatus.value =
                                      !_reportUserController
                                          .scamCheckStatus.value;
                                },
                                child: _reportUserController
                                        .scamCheckStatus.value
                                    ? const LoadSvg(svgPath: SvgAssets.checkBoxReport)
                                    : const LoadSvg(
                                        svgPath: SvgAssets.unCheckBoxReport))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          TextBoldUrbanist(
                            txt: 'A scam activity',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 19,
                            width: 19,
                            child: Obx(() => GestureDetector(
                                onTap: () {
                                  _reportUserController
                                          .contactDriverCheckStatus.value =
                                      !_reportUserController
                                          .contactDriverCheckStatus.value;
                                },
                                child: _reportUserController
                                        .contactDriverCheckStatus.value
                                    ? const LoadSvg(svgPath: SvgAssets.checkBoxReport)
                                    : const LoadSvg(
                                        svgPath: SvgAssets.unCheckBoxReport))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          TextBoldUrbanist(
                            txt: 'Unable to contact driver',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 19,
                            width: 19,
                            child: Obx(() => GestureDetector(
                                onTap: () {
                                  _reportUserController
                                          .abusiveBehaviourCheckStatus.value =
                                      !_reportUserController
                                          .abusiveBehaviourCheckStatus.value;
                                },
                                child: _reportUserController
                                        .abusiveBehaviourCheckStatus.value
                                    ? const LoadSvg(svgPath: SvgAssets.checkBoxReport)
                                    :const LoadSvg(
                                        svgPath: SvgAssets.unCheckBoxReport))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          TextBoldUrbanist(
                            txt: 'Abusive behaviour',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: ConstantSize.commonBtwSpaceForForm,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            height: 19,
                            width: 19,
                            child: Obx(() => GestureDetector(
                                onTap: () {
                                  _reportUserController
                                          .wrongAddressCheckStatus.value =
                                      !_reportUserController
                                          .wrongAddressCheckStatus.value;
                                },
                                child: _reportUserController
                                        .wrongAddressCheckStatus.value
                                    ? const LoadSvg(svgPath: SvgAssets.checkBoxReport)
                                    :const LoadSvg(
                                        svgPath: SvgAssets.unCheckBoxReport))),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          TextBoldUrbanist(
                            txt: 'wrong address shown',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                        ],
                      ),
                      const  SizedBox(
                        height: 5,
                      ),
                      InputFieldCommon(
                        controller: _reportUserController.explainController,
                        hint: "Max 150 word",
                        maxLines: 5,
                        keyBoardType: TextInputType.multiline,
                        topBottomPadding: ConstantSize.commonBtnPadding * 2,
                        maxWords: 150,
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
                title: "Submit",
                onPress: () {
                  Utils.hideKeyBoard(context);
                  Get.back();
                },
              ),
              SizedBox(
                height: ConstantSize.commonBottomPadding,
              )
            ],
          ),
        ),
      ),
    );
  }
}
