import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/review_service_view/review_screen_viewmodel.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/network_image_widget.dart';
import '../../res/components/round_button.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import '../../utils/utils.dart';
import '../add_service_view/add_service_second_view/days_container.dart';
import '../add_service_view/add_service_second_view/service_second_viewModel.dart';
import '../add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import '../addbankdetailview/controller.dart';
import '../specialty_view/specialty_view_model.dart';
import '../upload_image_view/uploadimageviewmodel.dart';

class ReviewServiceScreen extends StatefulWidget {
  const ReviewServiceScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReviewServiceScreenState();
  }
}

class _ReviewServiceScreenState extends State<ReviewServiceScreen> {
  ReviewScreenViewModel reviewScreenViewModel =
      Get.put(ReviewScreenViewModel());

  void cleanResource() {
    Get.delete<ReviewScreenViewModel>(force: true);
    Get.delete<ControllerBank>(force: true);
    Get.delete<ServiceFirstViewModel>(force: true);
    Get.delete<ServiceSecondViewModel>(force: true);
    Get.delete<UploadImageViewModel>(force: true);
    Get.delete<SpecialtyViewModel>(force: true);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        cleanResource();
        return false;
      },
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
            title: reviewScreenViewModel.showTitleAction
                ? TextBoldUrbanist(
                    txt: 'House Cleaning',
                    textAlign: TextAlign.start,
                    fontWeight: AppFonts.urbanistBoldWeight,
                    textSize: ConstantSize.commonMediumTxtSize,
                    txtColor: AppColor.blackColor,
                  )
                : null,
            actions: [
              reviewScreenViewModel.showTitleAction
                  ? InkWell(
                      onTap: () {
                        showPopupMenu();
                      },
                      child: SvgPicture.asset(
                        SvgAssets.filterIconThreeDot,
                        width: ConstantSize.thirtySizeIcon,
                        height: ConstantSize.thirtySizeIcon,
                      ),
                    )
                  : Container(),
              reviewScreenViewModel.showTitleAction
                  ? const SizedBox(
                      width: ConstantSize.screenPadding,
                    )
                  : Container()
            ],
          ),
          body: SingleChildScrollView(
              child: GestureDetector(
                  onTap: () {
                    Utils.hideKeyBoard(context);
                  },
                  child: Container(
                      color: AppColor.whiteColor,
                      // height: Get.height - Get.height * .13,
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
                            Row(
                              children: [
                                Expanded(
                                  child: TextBoldUrbanist(
                                      txt: 'Review your Service',
                                      textAlign: TextAlign.start),
                                ),
                                reviewScreenViewModel.showTitleAction == false
                                    ? GestureDetector(
                                        onTap: () => Get.offNamed(
                                            RoutesName.specialtyScreen),
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius
                                                  .circular(ConstantSize
                                                      .containerWelcomeRadius),
                                              color: AppColor.backGroundColor
                                                  .withOpacity(.3)),
                                          child: SizedBox(
                                            width:
                                                ConstantSize.checkBoxSize - 5,
                                            height:
                                                ConstantSize.checkBoxSize - 5,
                                            child: SvgPicture.asset(
                                                SvgAssets.pensil,
                                                semanticsLabel: 'pensil logo'),
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            SizedBox(
                              height: Get.height * .05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Obx(
                                  () => TextBoldUrbanist(
                                    txt:
                                        reviewScreenViewModel.serviceName.value,
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistBoldWeight,
                                    textSize: ConstantSize.commonMediumTxtSize,
                                    txtColor: AppColor.blackColor,
                                  ),
                                ),
                                Obx(
                                  () => TextBoldUrbanist(
                                    txt:
                                        '\$${reviewScreenViewModel.chargePerService.value}',
                                    textAlign: TextAlign.end,
                                    fontWeight: AppFonts.urbanistBoldWeight,
                                    textSize: ConstantSize.commonBigTxtSize,
                                    txtColor: AppColor.backGroundColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ConstantSize.commonBtwSpaceForForm,
                            ),
                            Row(mainAxisSize: MainAxisSize.min, children: [
                              Obx(
                                () => DaysContainer(
                                    title: reviewScreenViewModel
                                        .categoryName.value,
                                    onPress: () {},
                                    backgroundColor: AppColor.daysSelectedColor,
                                    textColor: AppColor.backGroundColor),
                              ),
                            ]),
                            SizedBox(
                              height: ConstantSize.commonBtwSpaceForForm,
                            ),
                            Obx(
                              () => TextBoldUrbanist(
                                txt: reviewScreenViewModel.description.value,
                                textAlign: TextAlign.start,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.viewLineColor,
                              ),
                            ),
                            SizedBox(
                              height: ConstantSize.commonBtwSpaceForForm,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBoldUrbanist(
                                  txt: 'Area Range',
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistBoldWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                                Obx(
                                  () => TextBoldUrbanist(
                                    txt:
                                        '${reviewScreenViewModel.areaPerRange.value} KM',
                                    textAlign: TextAlign.end,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtSize,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ConstantSize.commonBtwReviewServiceDetail,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBoldUrbanist(
                                  txt: 'Total Experience',
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistBoldWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                                Obx(
                                  () => TextBoldUrbanist(
                                    txt:
                                        '${reviewScreenViewModel.totalExperence.value} Years',
                                    textAlign: TextAlign.end,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtSize,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ConstantSize.commonBtwReviewServiceDetail,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBoldUrbanist(
                                  txt: 'Preferred timings',
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistBoldWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                                SizedBox(
                                  width: Get.width * .02,
                                ),
                                Obx(
                                  () => Expanded(
                                    child: TextBoldUrbanist(
                                      txt: reviewScreenViewModel
                                          .preferTiming.value,
                                      textAlign: TextAlign.end,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonTxtSize,
                                      txtColor: AppColor.viewLineColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: ConstantSize.commonBtwReviewServiceDetail,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextBoldUrbanist(
                                  txt: 'Availability',
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistBoldWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                                SizedBox(
                                  width: Get.width * .02,
                                ),
                                Obx(
                                  () => Expanded(
                                    child: TextBoldUrbanist(
                                      txt: reviewScreenViewModel
                                          .availablityDays.value,
                                      textAlign: TextAlign.end,
                                      fontWeight: AppFonts.urbanistMediumWeight,
                                      textSize: ConstantSize.commonTxtSize,
                                      txtColor: AppColor.viewLineColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height:
                                  ConstantSize.commonBtwReviewServiceDetail * 2,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextBoldUrbanist(
                                  txt: 'Images',
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistBoldWeight,
                                  textSize: ConstantSize.commonMediumTxtSize,
                                  txtColor: AppColor.blackColor,
                                ),
                                !reviewScreenViewModel.showTitleAction
                                    ? GestureDetector(
                                        onTap: () => Get.offNamed(
                                            RoutesName.uploadImageScreen),
                                        child: Container(
                                          padding: const EdgeInsets.all(6),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius
                                                  .circular(ConstantSize
                                                      .containerWelcomeRadius),
                                              color: AppColor.backGroundColor
                                                  .withOpacity(.3)),
                                          child: SizedBox(
                                            width:
                                                ConstantSize.checkBoxSize - 5,
                                            height:
                                                ConstantSize.checkBoxSize - 5,
                                            child: SvgPicture.asset(
                                                SvgAssets.pensil,
                                                semanticsLabel: 'Search logo'),
                                          ),
                                        ),
                                      )
                                    : Container()
                              ],
                            ),
                            SizedBox(
                              height: ConstantSize.commonBtwSpaceForForm,
                            ),
                            SizedBox(
                              height: Get.height * .09,
                              child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      if (kIsWeb) {
                                        Get.toNamed(RoutesName.imagePreview,
                                            arguments: [
                                              '',
                                              reviewScreenViewModel
                                                  .backBitesImageList[index],false,false
                                            ]);
                                      } else {
                                        Get.toNamed(RoutesName.imagePreview,
                                            arguments: [
                                              reviewScreenViewModel
                                                  .backImagesList[index].path,
                                              null,false,false
                                            ]);
                                      }
                                    },
                                    child: reviewScreenViewModel.showTitleAction?
                                    NetworkImageWidget(borderRadius: BorderRadius.circular(ConstantSize
                                        .containerWelcomeRadius),
                                      width: Get.width * .3,
                                      height: Get.width * .26,
                                      fit: BoxFit.fill,imageUrl:reviewScreenViewModel
                                          .imageListFromHome[index] ,):
                                  Container(
                                      margin: const EdgeInsets.only(right: 8),
                                      width: Get.width * .3,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            ConstantSize
                                                .containerWelcomeRadius),
                                        // child: Image.network(
                                        //   'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',
                                        //   fit: BoxFit.fill,
                                        // ),
                                        child: kIsWeb
                                            ? Image.memory(
                                                reviewScreenViewModel
                                                    .backBitesImageList[index],
                                                fit: BoxFit.cover,
                                              )
                                            : Image.file(
                                                reviewScreenViewModel
                                                    .backImagesList[index],
                                                fit: BoxFit.cover,
                                              ),
                                      ),
                                    ),
                                  );
                                },
                                itemCount: reviewScreenViewModel.showTitleAction?reviewScreenViewModel
                                    .imageListFromHome.length:kIsWeb ? reviewScreenViewModel.backBitesImageList.length : reviewScreenViewModel.backImagesList.length,
                              ),
                            ),
                            SizedBox(
                              height: ConstantSize.bottomScrollSize,
                            ),
                          ])))),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(
                bottom: 0.0,
                left: ConstantSize.screenPadding,
                right: ConstantSize.screenPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Obx(
                ()=> RoundButton(
                      title: reviewScreenViewModel.showTitleAction
                          ?!reviewScreenViewModel.active.value? 'Activate Service':"DeActivate Service"
                          : "Continue",
                      onPress: () => reviewScreenViewModel.onContinueClicked(
                          reviewScreenViewModel.showTitleAction)),
                ),
                SizedBox(
                  height: ConstantSize.commonBottomPadding,
                ),
              ],
            ),
          )),
    );
  }

  showPopupMenu() {
    BuildContext? context = Get.context;
    showMenu<String>(
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ConstantSize.containerWelcomeRadius)),
      context: context!,
      color: AppColor.whiteColor,
      surfaceTintColor: AppColor.whiteColor,
      position: RelativeRect.fromDirectional(
          textDirection: TextDirection.rtl,
          top: 75,
          end: 100,
          start: 30,
          bottom: 0),
      //position where you want to show the menu on screen
      items: [
        PopupMenuItem<String>(
            value: '1',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextBoldUrbanist(
                  txt: 'Edit',
                  textAlign: TextAlign.end,
                  fontWeight: AppFonts.urbanistMediumWeight,
                  textSize: ConstantSize.commonMediumTxtSize,
                  txtColor: AppColor.blackColor,
                ),
              ],
            )),
        PopupMenuItem<String>(
            value: '2',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextBoldUrbanist(
                  txt: 'Delete',
                  textAlign: TextAlign.end,
                  fontWeight: AppFonts.urbanistMediumWeight,
                  textSize: ConstantSize.commonMediumTxtSize,
                  txtColor: AppColor.viewLineColor,
                ),
              ],
            )),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value == null) return;
      //
      if (value == "1") {
        Get.toNamed(RoutesName.chooseSpecialtyScreen);
      } else if (value == "2") {
        Get.snackbar('Deteted Succesfull', 'Your service is delted');
        //   code here
      } else {
        //   code here
      }
    });
  }
}
