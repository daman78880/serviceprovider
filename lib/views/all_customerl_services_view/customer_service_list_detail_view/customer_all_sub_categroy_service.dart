import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/views/all_customerl_services_view/customer_service_list_detail_view/sub_category_controller.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/loadsvg.dart';
import '../../../res/components/network_image_widget.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';

class CustmoerAllSubCategoryService extends StatefulWidget {
  const CustmoerAllSubCategoryService({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustmoerAllSubCategoryService();
  }
}

class _CustmoerAllSubCategoryService extends State<CustmoerAllSubCategoryService> {
  final SubCategoryController _serviceListController = Get.put(SubCategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            txt: 'All Services',
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
                      Obx(
                        ()=> ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                          _serviceListController.subCategoryList.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () =>_serviceListController.onClickCategoryItem(_serviceListController.subCategoryList[index].iId?.subCategoriesName??''),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                  color:AppColor.countryContainerColor
                              ),
                              width:Get.width-ConstantSize.screenPadding*2,
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: EdgeInsets.symmetric(vertical: 14,horizontal: 12),
                              child: Row(
                                children: [
                                  // SizedBox(
                                  //   width: Get.width*.13,
                                  //   height: Get.width*.128,
                                  //   child: ClipRRect(
                                  //     borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                  //     child: Image.network(
                                  //       _serviceListController.subCategoryList[index].iId?.imageUrl??'',
                                  //       fit: BoxFit.fill,
                                  //     ),
                                  //   ),
                                  // ),
                                NetworkImageWidget(borderRadius: BorderRadius.circular(400),
                            width: Get.width*.13,
                            height: Get.width*.128,
                            fit: BoxFit.cover,imageUrl: _serviceListController.subCategoryList[index].iId?.imageUrl??'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',),

                            SizedBox(width: Get.width*.025,),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextBoldUrbanist(
                                        txt:  _serviceListController.subCategoryList[index].iId?.subCategoriesName??'',
                                        textAlign: TextAlign.start,
                                        textSize: ConstantSize.commonMediumTxtSize,
                                        txtColor: AppColor.blackColor,
                                      ),
                                      TextBoldUrbanist(
                                        txt: '${ _serviceListController.subCategoryList[index].noOfUserAvailableForThisService??1} ${(_serviceListController.subCategoryList[index].noOfUserAvailableForThisService ??30) >30?'+':''} Service Providers',
                                        textAlign: TextAlign.start,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        textSize: ConstantSize.commonSmallTxtSize,
                                        txtColor: AppColor.backGroundColor,
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  const LoadSvg(svgPath: SvgAssets.arrowRightColorFull)
                                  ,const SizedBox(width: 8,),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                    ]))));
  }
}
