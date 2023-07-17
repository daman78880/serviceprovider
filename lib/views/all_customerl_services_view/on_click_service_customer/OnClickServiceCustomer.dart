import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/views/all_customerl_services_view/on_click_service_customer/on_click_service_controller.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/loadsvg.dart';
import '../../../res/components/network_image_widget.dart';
import '../../../utils/utils.dart';

class OnClickServiceCustomer extends StatefulWidget {
  const OnClickServiceCustomer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _OnClickServiceCustomer();
  }
}

class _OnClickServiceCustomer extends State<OnClickServiceCustomer> {
  final OnClickServiceController _onClickServiceController =
      Get.put(OnClickServiceController(),permanent: true);


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        _onClickServiceController.cleanResource();
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.whiteColor,
            surfaceTintColor: Colors.transparent,
            leading: InkWell(
              onTap: () {
                _onClickServiceController.cleanResource();
              },
              child: const Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColor.blackColor,
                size: ConstantSize.backIconSize,
              ),
            ),
            centerTitle: true,
            title: TextBoldUrbanist(
                txt: _onClickServiceController.subCategoryId,
                textAlign: TextAlign.center,
                fontWeight: AppFonts.urbanistMediumWeight,
                textSize: ConstantSize.commonMediumTxtSize,
                txtColor: AppColor.blackColor,
              ),
            actions: const [LoadSvg(svgPath: SvgAssets.hFilterWithoutBorder),SizedBox(width: ConstantSize.screenPadding,)],
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
                        Obx(
                          ()=>ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _onClickServiceController.subCategoryList.length,
                            itemBuilder: (context, index) => GestureDetector(
                              onTap: () => _onClickServiceController.onServiceClick(index),
                              child: Container(
                                width: Get.width - ConstantSize.screenPadding * 2,
                                margin: EdgeInsets.only(bottom: Get.height * .02),
                                padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 12),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColor.dividerColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        ConstantSize.containerWelcomeRadius)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                /*    SizedBox(
                                      width: Get.width * .2,
                                      height: Get.width * .17,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                            ConstantSize.containerWelcomeRadius),
                                        // child: Image.asset(
                                        //   ImageAssets.demoImageSecond,
                                        //   fit: BoxFit.fill,
                                        // ),
                                        child: NetworkImageWidget(borderRadius: BorderRadius.circular(0),
                                          // height: ConstantSize.myProfileImageSize,
                                          // width: ConstantSize.myProfileImageSize,
                                          fit: BoxFit.cover,imageUrl: _onClickServiceController.subCategoryList[index].profilePicture??'',),
                                      ),
                                    ),*/
                                NetworkImageWidget(borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                width: Get.width * .2,
                                height: Get.width * .17,
                                fit: BoxFit.cover,imageUrl: _onClickServiceController.subCategoryList[index].profilePicture??'',),

                                    SizedBox(
                                      width: Get.width * .02,
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Obx(
                                        ()=> TextBoldUrbanist(
                                                txt: '${_onClickServiceController.subCategoryList[index].firstName??''} ${_onClickServiceController.subCategoryList[index].lastName??''}',
                                                textAlign: TextAlign.start,
                                                fontWeight:
                                                    AppFonts.urbanistMediumWeight,
                                                textSize:
                                                    ConstantSize.commonTxtTwelveSize,
                                                txtColor: AppColor.blackColor,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: ConstantSize.backIconSize,
                                            ),
                                            TextBoldUrbanist(
                                              // txt: _onClickServiceController.subCategoryList[index].rating??'',
                                              txt:'${_onClickServiceController.subCategoryList[index].averageRating??0}',
                                              textAlign: TextAlign.start,
                                              fontWeight:
                                                  AppFonts.urbanistMediumWeight,
                                              textSize:
                                                  ConstantSize.commonSmallTxtSize,
                                              txtColor: AppColor.viewLineColor,
                                            ),
                                          ],
                                        ),
                                        Obx(
                                          ()=> TextBoldUrbanist(
                                            txt: _onClickServiceController.subCategoryList[index].serviceDetails?.subCategoriesName??'',
                                            textAlign: TextAlign.start,
                                            textSize:
                                                ConstantSize.commonMediumTxtSize,
                                            txtColor: AppColor.blackColor,
                                          ),
                                        ),

                                        Obx(
                                          ()=> TextBoldUrbanist(
                                            txt: '\$${_onClickServiceController.subCategoryList[index].serviceDetails?.chargePerService??''}',
                                            textAlign: TextAlign.start,
                                            textSize: ConstantSize.commonTxtSize,
                                            txtColor: AppColor.backGroundColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        const LoadSvg(svgPath: SvgAssets.location,width:ConstantSize.backIconSize - 6 ,height: ConstantSize.backIconSize - 6,fit: BoxFit.fill,),
                                        const SizedBox(width: 5,),
                                        Obx(
                                            ()=> TextBoldUrbanist(
                                            txt:Utils.convertMetersToKm(_onClickServiceController.subCategoryList[index].distance??0),
                                            textAlign: TextAlign.start,
                                            textSize: ConstantSize.commonSmallTxtSize,
                                            txtColor: AppColor.viewLineColor,
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ])))),
    );
  }
}
