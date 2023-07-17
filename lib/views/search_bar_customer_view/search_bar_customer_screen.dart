import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/colors/app_color.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/res/fonts/app_fonts.dart';
import 'package:service_provider_two/views/search_bar_customer_view/search_bar_customer_controller.dart';

import '../../res/assets/image_assets.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/components/InputFieldCommon.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/continer_with_dropdownbtn.dart';
import '../../res/components/network_image_widget.dart';
import '../../utils/constants_size.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';

class SearchBarCustomer extends StatefulWidget {
  const SearchBarCustomer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SearchBarCustomerState();
  }
}
// for empty Screen Status 0
// For recent SearchScreen status 1
// For  SearchSearch result status 2

class _SearchBarCustomerState extends State<SearchBarCustomer> {
  final SearchBarCustomerController _searchController = Get.put(SearchBarCustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.only(
                      left: ConstantSize.screenPadding,
                      right: ConstantSize.screenPadding),
                  color: AppColor.whiteColor,
                  width: Get.width,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: Get.width*.8-ConstantSize.screenPadding * 2,
                              child:  TextField(
                                onChanged: (value) {
                                  _searchController.onTextChange();
                                },
                                textCapitalization:TextCapitalization.sentences,
                                maxLines: 1,
                                keyboardType: TextInputType.text,
                                onSubmitted: (value) {
                                  Utils.hideKeyBoard(context);
                                  _searchController.onTextChange();
                                },
                                controller: _searchController.txtController,
                                style: TextStyle(
                                    fontSize: ConstantSize.commonTxtSize,
                                    color: AppColor.blackColor,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    fontFamily: AppFonts.urbanistFamily),
                                decoration: InputDecoration(
                                    suffixIcon:   GestureDetector(
                                      onTap: () {
                                        Utils.hideKeyBoard(context);
                                        _searchController.onTextChange();
                                      },
                                      child: LoadSvg(
                                        svgPath: SvgAssets.searchIconTwo,
                                        width: 10,
                                        height: 10,
                                      ),
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: ConstantSize.commonTxtSize,
                                        color: AppColor.blackColor,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        fontFamily: AppFonts.urbanistFamily),
                                    enabledBorder: OutlineInputBorder(

                                        borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                        borderSide: BorderSide(color: AppColor.backGroundColor)),
                                    hintText: 'Search',
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                        borderSide: BorderSide(color: AppColor.backGroundColor)),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                    ),
                                    fillColor: AppColor.liteBackGroundColor,
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: ConstantSize.commonBtnPadding * 2,
                                        vertical: 0)),
                              ),
                            ),
                            Spacer(),
                            const LoadSvg(
                              svgPath: SvgAssets.filter_horizontal,
                              height: ConstantSize.thirtySizeIcon * 1.5,
                              width: ConstantSize.thirtySizeIcon * 1.5,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .01,
                        ),
                        Obx(
                          ()=> Column(
                            children: [
                              _searchController.displayStatus.value==2?
                              Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextBoldUrbanist(
                                            txt: 'Results for “${_searchController.searchTxt.value}”',
                                            textAlign: TextAlign.start,
                                            textSize: ConstantSize.commonTxtSize,
                                            txtColor: AppColor.blackColor,
                                          ),
                                          TextBoldUrbanist(
                                            txt: '${_searchController.searchResultList.length} Found',
                                            textAlign: TextAlign.end,
                                            textSize: ConstantSize.commonTxtSize,
                                            txtColor: AppColor.backGroundColor,
                                          ),
                                        ],
                                      ),
                              SizedBox(
                                height: Get.height * .01,
                              ),
                              const Divider(
                                color: AppColor.dividerColor,
                              ),

                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),

                                itemCount:
                                _searchController.searchResultList.length,
                                itemBuilder: (context, index) => InkWell(
                                  onTap: () {
                                  },
                                  child: Container(
                                    width: Get.width-ConstantSize.screenPadding*2,
                                    margin: EdgeInsets.only(bottom: Get.height * .02),
                                    padding: EdgeInsets.all(Get.height*.013),
                                    decoration: BoxDecoration(border: Border.all(color: AppColor.dividerColor,),borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius)),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,

                                      children: [
                                        // SizedBox(
                                        //   width: Get.width*.2,
                                        //   height: Get.width*.2,
                                        //   child: ClipRRect(
                                        //     borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                        //     child: Image.asset(
                                        //       ImageAssets.demoImageSecond,
                                        //       fit: BoxFit.fill,
                                        //     ),
                                        //   ),
                                        // ),
                                        NetworkImageWidget(borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                          width: Get.width * .2,
                                          height: Get.width * .2,
                                          fit: BoxFit.cover,imageUrl: _searchController.searchResultList[index].profilePicture??'',),
                                        SizedBox(width: Get.width*.02,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                TextBoldUrbanist(
                                                  txt:"${_searchController.searchResultList[index].firstName} ${_searchController.searchResultList[index].lastName}",
                                                  textAlign: TextAlign.start,
                                                  fontWeight: AppFonts.urbanistMediumWeight,
                                                  textSize: ConstantSize.commonTxtTwelveSize,
                                                  txtColor: AppColor.blackColor,
                                                ),
                                                const SizedBox(width: 5,),
                                                const Icon(Icons.star,color: Colors.amber,size: ConstantSize.backIconSize,),
                                                TextBoldUrbanist(
                                                  txt:"${_searchController.searchResultList[index].averageRating??0}",
                                                  textAlign: TextAlign.start,
                                                  fontWeight: AppFonts.urbanistMediumWeight,
                                                  textSize: ConstantSize.commonSmallTxtSize,
                                                  txtColor: AppColor.viewLineColor,
                                                ),
                                              ],
                                            ),
                                            TextBoldUrbanist(
                                              txt:"${_searchController.searchResultList[index].serviceDetails?.subCategoriesName}",
                                              textAlign: TextAlign.start,
                                              textSize: ConstantSize.commonMediumTxtSize,
                                              txtColor: AppColor.blackColor,
                                            ),
                                            SizedBox(height: Get.height*.01,),
                                            TextBoldUrbanist(
                                              txt:"\$${_searchController.searchResultList[index].serviceDetails?.chargePerService}",
                                              textAlign: TextAlign.start,
                                              textSize: ConstantSize.commonTxtSize,
                                              txtColor: AppColor.backGroundColor,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                                          InkWell(
                                            // onTap: () =>_searchController.recentSearchList.removeAt(index)
                                            onTap: () {}
                                            ,
                                            child: const LoadSvg(
                                              svgPath: SvgAssets.archive_add,
                                              fit: BoxFit.fill,
                                              width: ConstantSize.bigIconSize + 5,
                                              height: ConstantSize.bigIconSize + 5,
                                            ),
                                          ),
                                          SizedBox(height: Get.height*.025,),
                                          TextBoldUrbanist(
                                            txt:Utils.convertMetersToKm(_searchController.searchResultList[index].distance),
                                            textAlign: TextAlign.start,
                                            textSize: ConstantSize.commonSmallTxtSize,
                                            txtColor: AppColor.viewLineColor,
                                          ),
                                        ],)

                                      ],
                                    ),
                                  ),
                                ),
                              )  ],
                          ) :
                              _searchController.displayStatus.value==1?
                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextBoldUrbanist(
                                        txt: 'Search result for "${_searchController.searchTxt.value}"',
                                        textAlign: TextAlign.start,
                                        textSize: ConstantSize.commonTxtSize,
                                        txtColor: AppColor.blackColor,
                                      ),
                                      GestureDetector(
                                        onTap: () => _searchController.recentSearchList.clear(),
                                        child: TextBoldUrbanist(
                                          txt: '0 Found',
                                          textAlign: TextAlign.end,
                                          textSize: ConstantSize.commonTxtSize,
                                          txtColor: AppColor.backGroundColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: Get.height*.15,),
                                  SizedBox(
                                    width: Get.width*.5,
                                    height : Get.width*.5,
                                    child:
                                    Image.asset(ImageAssets.emptySearchImg,fit: BoxFit.fill,),
                                  ),
                                  SizedBox(height: Get.height*.01,),
                                  TextBoldUrbanist(
                                    txt: 'Not Found',
                                    textAlign: TextAlign.center,
                                    textSize: 20,
                                    fontWeight: AppFonts.poppinsRagularWeight,
                                    fontFamily: AppFonts.poppinsFamily,
                                    txtColor: AppColor.blackColor,
                                  ),
                                  SizedBox(height: Get.height*.01,),
                                  TextBoldUrbanist(
                                    txt: 'Try search for other service or adjust the filters',
                                    textAlign: TextAlign.center,
                                    fontWeight: AppFonts.poppinsRagularWeight,
                                    fontFamily: AppFonts.poppinsFamily,
                                    textSize: ConstantSize.commonTxtTwelveSize,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                ],
                              ):Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextBoldUrbanist(
                                        txt: 'Recent',
                                        textAlign: TextAlign.start,
                                        textSize: ConstantSize.commonTxtSize,
                                        txtColor: AppColor.blackColor,
                                      ),
                                      GestureDetector(
                                        onTap: () => _searchController.recentSearchList.clear(),
                                        child: TextBoldUrbanist(
                                          txt: 'Clear All',
                                          textAlign: TextAlign.end,
                                          textSize: ConstantSize.commonTxtSize,
                                          txtColor: AppColor.backGroundColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                  ListView.builder(
                                    physics: const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount:
                                    _searchController.recentSearchList.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: Get.height * .02),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextBoldUrbanist(
                                              txt: _searchController
                                                  .recentSearchList[index],
                                              textAlign: TextAlign.start,
                                              fontWeight: AppFonts.urbanistMediumWeight,
                                              textSize: ConstantSize.commonMediumTxtSize,
                                              txtColor: AppColor.viewLineColor,
                                            ),
                                            InkWell(
                                              onTap: () =>_searchController.recentSearchList.removeAt(index)
                                              ,
                                              child: const LoadSvg(
                                                svgPath: SvgAssets.cancel_icon_lite_grey,
                                                fit: BoxFit.fill,
                                                width: ConstantSize.bigIconSize + 5,
                                                height: ConstantSize.bigIconSize + 5,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ])))),
    );
  }
}
