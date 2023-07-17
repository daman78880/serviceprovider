import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/views/service_detail_customer_view/select_service_detail_view/selected_service_detail_controller.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/round_button.dart';
import '../../../utils/routes/routes_name.dart';
import '../../upload_image_view/imageshowcontainer.dart';

class SelectServiceDetailScreen extends StatefulWidget {
  const SelectServiceDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SelectServiceDetailState();
  }
}

class _SelectServiceDetailState extends State<SelectServiceDetailScreen> {
  SelectedServiceDetailController selectedServiceDetailController = Get.put(SelectedServiceDetailController(),permanent: true);

  void clearResource(){
    Get.delete<SelectedServiceDetailController>(force: true);
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
                        txt: 'Enter the number of items to be cleaned',
                        textAlign: TextAlign.start,
                        fontWeight: AppFonts.urbanistMediumWeight,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.viewLineColor,
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Obx(() => Container(
                                  margin: const EdgeInsets.only(bottom: 15),
                                  width:
                                      Get.width - ConstantSize.screenPadding * 2,
                                  decoration: BoxDecoration(
                                      color: AppColor.countryContainerColor,
                                      borderRadius: BorderRadius.circular(
                                          ConstantSize.containerWelcomeRadius)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 15),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      TextBoldUrbanist(
                                        txt: selectedServiceDetailController
                                            .itemList[index].title,
                                        textAlign: TextAlign.start,
                                        textSize: ConstantSize.commonTxtSize,
                                        txtColor: AppColor.blackColor,
                                      ),
                                      Spacer(),
                                      InkWell(
                                          onTap: () {
                                            selectedServiceDetailController
                                                .minisSelectedValue(index);
                                          },
                                          child: const LoadSvg(
                                              svgPath: SvgAssets.minus_icon)),
                                      SizedBox(
                                        width: Get.width * .03,
                                      ),
                                      TextBoldUrbanist(
                                        txt: selectedServiceDetailController
                                            .itemList[index].selected.value
                                            .toString(),
                                        textAlign: TextAlign.start,
                                        textSize: ConstantSize.commonTxtSize,
                                        txtColor: AppColor.viewLineColor,
                                      ),
                                      SizedBox(
                                        width: Get.width * .03,
                                      ),
                                      InkWell(
                                          onTap: () {
                                            selectedServiceDetailController
                                                .plusSelectedValue(index);
                                          },
                                          child: const LoadSvg(
                                              svgPath: SvgAssets.plus_icon)),
                                    ],
                                  ),
                                ));
                          },
                          itemCount:
                              selectedServiceDetailController.itemList.length),
                      SizedBox(
                        height: Get.height * .03,
                      ),
                      TextBoldUrbanist(
                        txt: 'Attachments',
                        textAlign: TextAlign.start,
                        textSize: ConstantSize.commonMediumTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                      SizedBox(
                        height: Get.height * .015,
                      ),
                      Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              Container(
                                width: Get.width - ConstantSize.screenPadding * 2,
                                  height: Get.height * .18,child:  ImageShowContainer(title: selectedServiceDetailController.imageList[index],onPress: () {
                                  if(kIsWeb){
                                    if (selectedServiceDetailController.bitesImageList[index] != null) {
                                      Get.toNamed(RoutesName.imagePreview,
                                          arguments: ['',
                                            selectedServiceDetailController.bitesImageList[index],false,false
                                          ]);
                                    }
                                  }else {
                                    print('cliecked');
                                    if (selectedServiceDetailController.imageList[index] != null) {
                                      Get.toNamed(RoutesName.imagePreview,
                                          arguments: [
                                            selectedServiceDetailController.imageList[index]?.path ??
                                                '',
                                            null,false,false
                                          ]);
                                    }
                                  }
                                },onDelete: () {
                                  selectedServiceDetailController
                                          .onDeleteImage(index);
                                },bitesImage:  selectedServiceDetailController.bitesImageList[index],),
                              ),
                          itemCount:
                              selectedServiceDetailController.imageList.length,
                        ),
                      ),
                      Obx(() => selectedServiceDetailController.imageList.length>0?SizedBox(
                        height: Get.height * .015,
                      ):Container()),
                      InkWell(
                        onTap: () => selectedServiceDetailController.getFromGallery(),
                        child: Container(
                          width: Get.width - ConstantSize.screenPadding * 2,
                          height: Get.height * .18,
                          decoration: BoxDecoration(
                              color: AppColor.countryContainerColor,
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.containerWelcomeRadius)),
                          child: Icon(
                            Icons.add,
                            size: Get.height * .08,
                            color: AppColor.viewLineColor.withOpacity(0.5),
                          ),
                        ),
                      )
                    ]))),
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: AppColor.whiteColor,
            ),
            padding: const EdgeInsets.symmetric(
                vertical: 15, horizontal: ConstantSize.screenPadding),
            width: Get.width,
            child: RoundButton(
                title: "Continue",
                onPress: () =>selectedServiceDetailController.onContinueClick(),
                width: 40,
                height: 50,
                fontSize: ConstantSize.commonMediumTxtSize,
                fontWeight: AppFonts.poppinsMediumWeight,
                fontFamily: AppFonts.poppinsFamily)),
      ),
    );
  }
}
