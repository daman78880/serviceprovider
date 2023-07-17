import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import 'package:service_provider_two/views/preview_image/image_preview.dart';
import 'package:service_provider_two/views/service_detail_customer_view/service_detail_customer_controller.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/assets/svg_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/loadsvg.dart';
import '../../res/components/network_image_widget.dart';
import '../../res/components/round_button.dart';
import '../../utils/utils.dart';

class ServiceDetailCustomerScreen extends StatefulWidget {
  const ServiceDetailCustomerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ServiceDetailCState();
  }
}

class _ServiceDetailCState extends State<ServiceDetailCustomerScreen> {

  static const pattern = [
    QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 2),
    QuiltedGridTile(1, 2),
    /*  QuiltedGridTile(2, 2),
    QuiltedGridTile(1, 2),
    QuiltedGridTile(1, 2),*/
  ];


  final ServiceDetailCustomerController _serviceDetailCustomerController = Get.put(ServiceDetailCustomerController(),permanent: true);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Get.delete<ServiceDetailCustomerController>(force: true);
        Get.back();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.whiteColor,
          surfaceTintColor: Colors.transparent,
          leading: InkWell(
            onTap: () {
              Get.delete<ServiceDetailCustomerController>(force: true);
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              color: AppColor.blackColor,
              size: ConstantSize.backIconSize,
            ),
          ),
          centerTitle: true,
          title: Obx(
                ()=> TextBoldUrbanist(
              txt:_serviceDetailCustomerController.userData.value.serviceDetails?.subCategoriesName??'',
              textAlign: TextAlign.center,
              fontWeight: AppFonts.urbanistMediumWeight,
              textSize: ConstantSize.commonMediumTxtSize,
              txtColor: AppColor.blackColor,
            ),
          ),
        ),
        body: Obx(
              ()=> _serviceDetailCustomerController.showLayout.value? SingleChildScrollView(
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
                        SizedBox(
                          width: Get.width - ConstantSize.screenPadding * 2,
                          height: Get.width * .3,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // SizedBox(
                              //   width: Get.width * .35,
                              //   height: Get.width * .3,
                              //   child: ClipRRect(
                              //     borderRadius: BorderRadius.circular(
                              //         ConstantSize.containerWelcomeRadius),
                              //     child: Image.asset(
                              //       ImageAssets.demoImageSecond,
                              //       fit: BoxFit.fill,
                              //     ),
                              //   ),
                              // ),
                              GestureDetector(
                                onTap: () =>    Get.toNamed(RoutesName.imagePreview,
                                    arguments: [_serviceDetailCustomerController.userData.value.profilePicture,null,true,false]),
                                child: NetworkImageWidget(borderRadius: BorderRadius.circular( ConstantSize.containerWelcomeRadius),
                                  width: Get.width * .35,
                                  height: Get.width * .3,
                                  fit: BoxFit.fill,imageUrl: _serviceDetailCustomerController.userData.value.profilePicture??'',),
                              ),

                              // _serviceDetailCustomerController.userData.value.serviceDetails?.subCategoriesName

                              SizedBox(
                                width: Get.width * .02,
                              ),
                                 Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: Get.height * .015,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Obx(
                                          ()=>TextBoldUrbanist(
                                                txt: _serviceDetailCustomerController.userData.value.serviceDetails?.subCategoriesName??'',
                                                textAlign: TextAlign.start,
                                                textSize:
                                                ConstantSize.commonMediumTxtSize,
                                                txtColor: AppColor.viewLineColor,
                                              textOverFlow:TextOverflow.ellipsis

                                              ),
                                            ),
                                          ),
                                          const LoadSvg(
                                            svgPath: SvgAssets.location,
                                            width: ConstantSize.backIconSize - 6,
                                            height: ConstantSize.backIconSize - 6,
                                            fit: BoxFit.fill,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Obx(
                                            ()=> TextBoldUrbanist(
                                              // txt: '${Utils.convertIntMetersToKm(_serviceDetailCustomerController.userData.value.distance??0)} KM',
                                              txt: Utils.convertMetersToKm(_serviceDetailCustomerController.userData.value.distance),
                                              textAlign: TextAlign.start,
                                              textSize:
                                              ConstantSize.commonSmallTxtSize,
                                              txtColor: AppColor.viewLineColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Obx(
                                          ()=> TextBoldUrbanist(
                                                txt: "${_serviceDetailCustomerController.userData.value.firstName} ${_serviceDetailCustomerController.userData.value.lastName}",
                                                textAlign: TextAlign.start,
                                                textSize:
                                                ConstantSize.commonMediumTxtSize,
                                                txtColor: AppColor.blackColor,
                                              textOverFlow:TextOverflow.ellipsis
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: ConstantSize.backIconSize - 5,
                                          ),
                                          Obx(
                                            ()=> TextBoldUrbanist(
                                              txt: '${_serviceDetailCustomerController.userData.value.averageRating??0}',
                                              textAlign: TextAlign.start,
                                              fontWeight:
                                              AppFonts.urbanistMediumWeight,
                                              textSize:
                                              ConstantSize.commonSmallTxtSize,
                                              txtColor: AppColor.viewLineColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Obx(
                                        ()=> TextBoldUrbanist(
                                          txt: '\$${_serviceDetailCustomerController.userData.value.serviceDetails?.chargePerService??0}',
                                          textAlign: TextAlign.start,
                                          textSize: ConstantSize.commonTxtSize,
                                          txtColor: AppColor.backGroundColor,
                                        ),
                                      ),
                                      SizedBox(
                                        height: Get.height * .015,
                                      )
                                    ],
                                  ),
                                ),
                            /*  Expanded(
                                child: ListView(
                                  children: [
                                    SizedBox(
                                      height: Get.height * .015,
                                    ),
                                    Row(

                                      children: [
                                        Expanded(
                                          child: Obx(
                                                ()=>TextBoldUrbanist(
                                              txt: _serviceDetailCustomerController.userData.value.subCategoriesDetails?.subCategoriesName ??'',
                                              // txt:" ${(_serviceDetailCustomerController.userData.value.subCategoriesDetails?.subCategoriesName!)} sdafsdabnfjknasdkfnas fjkan sjk fjk asfjkskda fnjksad fjknsklad",

                                              textAlign: TextAlign.start,
                                              textSize:
                                              ConstantSize.commonMediumTxtSize,
                                              txtColor: AppColor.viewLineColor,
                                            ),
                                          ),
                                        ),
                                        const LoadSvg(
                                          svgPath: SvgAssets.location,
                                          width: ConstantSize.backIconSize - 6,
                                          height: ConstantSize.backIconSize - 6,
                                          fit: BoxFit.fill,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Obx(
                                              ()=> TextBoldUrbanist(
                                            txt: '${Utils.convertMetersToKm(_serviceDetailCustomerController.userData.value.distance)} KM',
                                            textAlign: TextAlign.start,
                                            textSize:
                                            ConstantSize.commonSmallTxtSize,
                                            txtColor: AppColor.viewLineColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Obx(
                                                ()=> TextBoldUrbanist(
                                              txt: "${_serviceDetailCustomerController.userData.value.firstName} ${_serviceDetailCustomerController.userData.value.lastName}",
                                              textAlign: TextAlign.start,
                                              textSize:
                                              ConstantSize.commonMediumTxtSize,
                                              txtColor: AppColor.blackColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: ConstantSize.backIconSize - 5,
                                        ),
                                        TextBoldUrbanist(
                                          txt: '4.0',
                                          textAlign: TextAlign.start,
                                          fontWeight:
                                          AppFonts.urbanistMediumWeight,
                                          textSize:
                                          ConstantSize.commonSmallTxtSize,
                                          txtColor: AppColor.viewLineColor,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10,),

                                    Obx(
                                          ()=> TextBoldUrbanist(
                                        txt: '\$${_serviceDetailCustomerController.userData.value.serviceDetails?.chargePerService??0}',
                                        textAlign: TextAlign.start,
                                        textSize: ConstantSize.commonTxtSize,
                                        txtColor: AppColor.backGroundColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: Get.height * .015,
                                    )
                                  ],
                                ),
                              )*/
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .015,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: AppColor.liteGreen,
                              borderRadius: BorderRadius.circular(
                                  ConstantSize.commonBtnRadius)),
                          width: Get.width - ConstantSize.screenPadding * 2,
                          padding: const EdgeInsets.all(ConstantSize.commonBtnPadding),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const LoadSvg(
                                svgPath: SvgAssets.lightning_green,
                                height: ConstantSize.bigIconSize,
                                width: ConstantSize.backIconSize,
                                fit: BoxFit.fill,
                              ),
                              SizedBox(
                                width: Get.width * .02,
                              ),
                              TextBoldUrbanist(
                                txt: 'Save Up to 30% on this order',
                                textAlign: TextAlign.start,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.greenColor,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .01,
                        ),
                        TextBoldUrbanist(
                          txt: 'Description',
                          textAlign: TextAlign.start,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        Obx(
                              ()=> TextBoldUrbanist(
                            txt:
                            _serviceDetailCustomerController.userData.value.serviceDetails?.description??'',
                            textAlign: TextAlign.start,
                            fontWeight: AppFonts.urbanistMediumWeight,
                            textSize: ConstantSize.commonTxtSize,
                            txtColor: AppColor.viewLineColor,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .024,
                        ),
                        TextBoldUrbanist(
                          txt: 'Photos & Videos',
                          textAlign: TextAlign.start,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        SizedBox(
                          height: Get.height * .015,
                        ),
                        Obx(
                                () =>
                                GridView.builder(
                                    scrollDirection: Axis.vertical,
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: _serviceDetailCustomerController.userData.value.serviceDetails!.images?.length??0,

                                    gridDelegate: SliverQuiltedGridDelegate(
                                      crossAxisCount: 4,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      repeatPattern: QuiltedGridRepeatPattern
                                          .inverted,
                                      pattern: pattern,
                                    ),
                                    itemBuilder: (BuildContext context,
                                        int index) {
                                      return GestureDetector(
                                        onTap: () =>   Get.toNamed(RoutesName.imagePreview,
                                            arguments: [ ImageAssets.demoImageSecond,null,false,true]),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              ConstantSize.containerWelcomeRadius),
                                          child: Image.asset(
                                            ImageAssets.demoImageSecond,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      );
                                      // NetworkImageWidget(borderRadius: BorderRadius.circular(  ConstantSize.containerWelcomeRadius),
                                      //
                                      //   fit: BoxFit.fill,imageUrl: _serviceDetailCustomerController.userData.value.profilePicture??'',)
                                    })),
                        SizedBox(height: Get.height * .035,),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: ConstantSize.backIconSize - 5,
                            ),
                            Obx(
                              ()=> TextBoldUrbanist(
                                txt: '${'${_serviceDetailCustomerController.userData.value.averageRating??0}'} (${'${_serviceDetailCustomerController.userData.value.rating?.length??0}'} reviews)',
                                textAlign: TextAlign.start,
                                textSize:
                                ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                            ),
                            Spacer(),
                            TextBoldUrbanist(
                              txt: 'See All',
                              textAlign: TextAlign.end,
                              textSize:
                              ConstantSize.commonTxtSize,
                              txtColor: AppColor.backGroundColor,
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height * .015,),
                        Obx(
                              ()=> ListView.builder(itemBuilder: (context, index) =>
                              Container(margin: const EdgeInsets.only(bottom: 20),width: Get.width-ConstantSize.screenPadding*2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(
                                            width: ConstantSize.homeImageSize,
                                            height: ConstantSize.homeImageSize,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(
                                                  100),
                                              child: Image.asset(
                                                ImageAssets.demoImageSecond,
                                                fit: BoxFit.fill,
                                              ),
                                            )
                                        ),

                                        // Obx(() => NetworkImageWidget(borderRadius: BorderRadius.circular(100),
                                        //   height: ConstantSize.homeImageSize,
                                        //   width: ConstantSize.homeImageSize,
                                        //   fit: BoxFit.fill,imageUrl:  _serviceDetailCustomerController.userData.value.rating?[index].senderProfilePic??'',)),

                                        SizedBox(width: Get.width*.015,),
                                        Obx(
                                          ()=> TextBoldUrbanist(
                                            txt: _serviceDetailCustomerController.userData.value.rating?[index].senderName??'',
                                            textAlign: TextAlign.end,
                                            textSize:
                                            ConstantSize.commonMediumTxtSize,
                                            txtColor: AppColor.blackColor,
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 10)
                                          ,decoration:BoxDecoration(color: AppColor.liteBackGroundColor,borderRadius: BorderRadius.circular(ConstantSize.commonBtnRadius)),
                                          child:
                                          Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: ConstantSize.backIconSize - 5,
                                              ),
                                              Obx(
                                                ()=> TextBoldUrbanist(
                                                  txt: '${_serviceDetailCustomerController.userData.value.rating?[index].rating??0}',
                                                  textAlign: TextAlign.start,
                                                  fontWeight: AppFonts.urbanistMediumWeight,
                                                  textSize:
                                                  ConstantSize.commonTxtSize,
                                                  txtColor: AppColor.backGroundColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: Get.height*.01,),
                                    Obx(
                                          ()=> TextBoldUrbanist(
                                        txt: _serviceDetailCustomerController.userData.value.rating?[index].comments??'',
                                        textAlign: TextAlign.start,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        textSize:
                                        ConstantSize.commonTxtSize,
                                        txtColor: AppColor.viewLineColor,
                                      ),
                                    ),
                                    SizedBox(height: Get.height*.01,),
                                    Row(
                                      children: [
                                        index%2==0?const Icon(Icons.favorite_outline,color: AppColor.redColor,size: ConstantSize.backIconSize,):const Icon(Icons.favorite,color: AppColor.redColor,size: ConstantSize.backIconSize)
                                        ,SizedBox(width: Get.width*.01,)
                                        ,TextBoldUrbanist(
                                          txt: '3 Likes',
                                          textAlign: TextAlign.start,
                                          fontWeight: AppFonts.urbanistMediumWeight,
                                          textSize:
                                          ConstantSize.commonTxtSize,
                                          txtColor: AppColor.viewLineColor,
                                        ),

                                        SizedBox(width: Get.width*.05,),TextBoldUrbanist(
                                          txt: '${Utils.timeFormatForRating(_serviceDetailCustomerController.userData.value.rating?[index].createdAt??'')}',
                                          textAlign: TextAlign.start,
                                          fontWeight: AppFonts.urbanistMediumWeight,
                                          textSize: ConstantSize.commonTxtSize,
                                          txtColor: AppColor.viewLineColor,
                                        ),

                                      ],
                                    ),
                                    SizedBox(height: ConstantSize.commonBottomPadding,)
                                  ],
                                ),
                              ),
                            itemCount: _serviceDetailCustomerController.userData.value.rating?.length??0,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,),
                        )
                      ]))
          ):Container(),
        )
        ,bottomNavigationBar: Obx(
            ()=> _serviceDetailCustomerController.showLayout.value? Container(decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: const BorderRadius.only(topRight: Radius.circular(ConstantSize.containerWelcomeRadius),topLeft: Radius.circular(ConstantSize.containerWelcomeRadius )),
          boxShadow: [
            BoxShadow(
              color: AppColor.blackColor.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 10,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),padding: const EdgeInsets.symmetric(vertical: 15),
            width: Get.width,
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundButton(
                  title: "Message",
                  onPress: () {
                    _serviceDetailCustomerController.onChatClick('');
                  },
                  buttonColor: AppColor.liteBackGroundColor,
                  textColor: AppColor.backGroundColor,
                  width: (Get.width / 2) -
                      ConstantSize.screenPadding * 2.3,
                  height: Get.height * .055,
                  fontSize: ConstantSize.commonTxtTwelveSize,
                  fontWeight: AppFonts.poppinsMediumWeight,
                  fontFamily: AppFonts.poppinsFamily,
                ),
                SizedBox(width: Get.width*.05,),
                RoundButton(
                  title: "Book Now",
                  onPress: () {
                   _serviceDetailCustomerController.onBookNowClick(_serviceDetailCustomerController.userData.value.serviceDetails?.sId??'');
                  },
                  width: (Get.width / 2) -
                      ConstantSize.screenPadding * 2.3,
                  height: Get.height * .055,

                  fontSize: ConstantSize.commonTxtTwelveSize,
                  fontWeight: AppFonts.poppinsMediumWeight,
                  fontFamily: AppFonts.poppinsFamily,
                )
              ],
            )
        ):Container(),
      ),
      ),
    );
  }
}
