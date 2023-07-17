import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/views/my_profile_view/saved_card_view/saved_card_controller.dart';
import '../../../res/assets/image_assets.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/components/loadsvg.dart';
import '../../../res/components/round_button.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';
import '../../../utils/string_utils.dart';
import '../../../utils/utils.dart';

class SavedCardScreen extends StatefulWidget {
  const SavedCardScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SavedCardState();
  }
}

class _SavedCardState extends State<SavedCardScreen> {
  final SavedCardController savedCardController = Get.put(SavedCardController(),permanent: true);
@override
void dispose() {
  Get.delete<SavedCardController>(force: true);
    super.dispose();
  }

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
          txt: StringUtils.savedCards,
          textAlign: TextAlign.center,
          fontFamily: AppFonts.poppinsFamily,
          fontWeight: AppFonts.poppinsRagularWeight,
          textSize: ConstantSize.commonMediumTxtSize,
          txtColor: AppColor.blackColor,
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
              color: AppColor.whiteColor,
              width: Get.width,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * .047,
                    ),
                    Padding(
                      padding:  const EdgeInsets.symmetric(
                            horizontal: ConstantSize.screenPadding),
                      child: TextBoldUrbanist(
                        txt: 'Saved Cards',
                        textAlign: TextAlign.start,
                        textSize: ConstantSize.commonTxtSize,
                        txtColor: AppColor.blackColor,
                      ),
                    ),
                    Container(
                      width: Get.width ,
                      height: Get.height * .28,
                      color: AppColor.whiteColor,
                      child: Obx(
                          (){
                            if (kDebugMode) {
                              print('=================================rebuild list');
                            }
                            return ListView.builder(
                          itemBuilder: (context, index) => SizedBox(
                            width: Get.width,
                            child:index%2==0?  Stack(
                              alignment: Alignment.topLeft,
                              children: [
                                Image.asset(ImageAssets.bgCardRedColor,fit: BoxFit.cover,width: Get.width ,height:Get.height * .26 ,),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: Get.height*.042,),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          TextBoldUrbanist(
                                            txt:savedCardController.cardList[index].bankName,
                                            textAlign: TextAlign.start,
                                            fontFamily: AppFonts.poppinsFamily,
                                            fontWeight: AppFonts.poppinsRagularWeight,
                                            textSize: ConstantSize.commonBoldTxtSize-3,
                                            txtColor: AppColor.whiteColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Get.height*.03,),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          const LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          SizedBox(width: Get.width*.03,),
                                          const  LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          SizedBox(width: Get.width*.03,),
                                          const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          SizedBox(width: Get.width*.03,),
                                          TextBoldUrbanist(
                                            txt: Utils.getLastFourDigit(Utils.getLastFourDigit(savedCardController.cardList[index].cardLastNumber)),
                                            textAlign: TextAlign.start,
                                            fontFamily: AppFonts.poppinsFamily,
                                            fontWeight: AppFonts.poppinsRagularWeight,
                                            textSize: ConstantSize.commonBoldTxtSize-8,
                                            txtColor: AppColor.whiteColor,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextBoldUrbanist(
                                                txt: 'Expiration',
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtSize,
                                                txtColor: AppColor.liteRedColor,
                                              ),
                                              Obx(
                                                  ()=> TextBoldUrbanist(
                                                  txt: Utils.formatExpireDate(savedCardController.cardList[index].cardExpirationDate),
                                                  // txt: 'fh',
                                                  textAlign: TextAlign.start,
                                                  fontFamily: AppFonts.poppinsFamily,
                                                  fontWeight: AppFonts.poppinsRagularWeight,
                                                  textSize: ConstantSize.commonTxtSize,
                                                  txtColor: AppColor.whiteColor,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: Get.width*.03,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextBoldUrbanist(
                                                txt: 'Card holder ',
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtSize,
                                                txtColor: AppColor.liteRedColor,
                                              ),
                                              TextBoldUrbanist(
                                                txt: savedCardController.cardList[index].cardHolderName,
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtSize,
                                                txtColor: AppColor.whiteColor,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: Get.height*.05,),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => savedCardController.onEditClick(savedCardController.cardList[index].cardId,savedCardController.cardList[index].bankName, savedCardController.cardList[index].cardHolderName, savedCardController.cardList[index].cardExpirationDate, savedCardController.cardList[index].cardLastNumber, savedCardController.cardList[index].cardCvv),
                                              child: TextBoldUrbanist(
                                                txt: StringUtils.edit,
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtTwelveSize,
                                                txtColor: AppColor.redColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => savedCardController.onDeleteBankClick(savedCardController.cardList[index].cardId,index ),
                                              child: TextBoldUrbanist(
                                                txt: StringUtils.delete,
                                                textAlign: TextAlign.end,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtTwelveSize,
                                                txtColor: AppColor.redColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: Get.width*.13,),
                                        ],
                                      )
                                    ])
                              ],
                            ):Stack(
                              children: [
                                Image.asset(ImageAssets.bgCardPurpleColor,fit: BoxFit.cover,width: Get.width ,height:Get.height * .26 ,),
                                Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(height: Get.height*.042,),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          TextBoldUrbanist(
                                            txt: savedCardController.cardList[index].bankName,
                                            textAlign: TextAlign.start,
                                            fontFamily: AppFonts.poppinsFamily,
                                            fontWeight: AppFonts.poppinsRagularWeight,
                                            textSize: ConstantSize.commonBoldTxtSize-3,
                                            txtColor: AppColor.whiteColor,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: Get.height*.03,),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          const  LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),

                                          SizedBox(width: Get.width*.03,),

                                          const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const    LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          SizedBox(width: Get.width*.03,),

                                          const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const   LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const     LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          const  LoadSvg(svgPath: SvgAssets.whiteDot,),
                                          SizedBox(width: Get.width*.01,),
                                          SizedBox(width: Get.width*.03,),
                                          TextBoldUrbanist(
                                            txt: Utils.getLastFourDigit(savedCardController.cardList[index].cardLastNumber),
                                            textAlign: TextAlign.start,
                                            fontFamily: AppFonts.poppinsFamily,
                                            fontWeight: AppFonts.poppinsRagularWeight,
                                            textSize: ConstantSize.commonBoldTxtSize-8,
                                            txtColor: AppColor.whiteColor,
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextBoldUrbanist(
                                                txt: 'Expiration',
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtSize,
                                                txtColor: AppColor.liteBackGroundColor,
                                              ),
                                              TextBoldUrbanist(
                                                txt: Utils.formatExpireDate(savedCardController.cardList[index].cardExpirationDate),
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtSize,
                                                txtColor: AppColor.whiteColor,
                                              ),
                                            ],
                                          ),
                                          SizedBox(width: Get.width*.03,),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              TextBoldUrbanist(
                                                txt: 'Card holder ',
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtSize,
                                                txtColor: AppColor.liteBackGroundColor,
                                              ),
                                              TextBoldUrbanist(
                                                txt: savedCardController.cardList[index].cardHolderName,
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtSize,
                                                txtColor: AppColor.whiteColor,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(height: Get.height*.05,),
                                      Row(
                                        children: [
                                          SizedBox(width: Get.width*.13,),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => savedCardController.onEditClick(savedCardController.cardList[index].cardId,savedCardController.cardList[index].bankName, savedCardController.cardList[index].cardHolderName, savedCardController.cardList[index].cardExpirationDate, savedCardController.cardList[index].cardLastNumber, savedCardController.cardList[index].cardCvv),
                                              child: TextBoldUrbanist(
                                                txt: StringUtils.edit,
                                                textAlign: TextAlign.start,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtTwelveSize,
                                                txtColor: AppColor.backGroundColor,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () => savedCardController.onDeleteBankClick(savedCardController.cardList[index].cardId,index ),
                                              child: TextBoldUrbanist(
                                                txt: StringUtils.delete,
                                                textAlign: TextAlign.end,
                                                fontFamily: AppFonts.poppinsFamily,
                                                fontWeight: AppFonts.poppinsRagularWeight,
                                                textSize: ConstantSize.commonTxtTwelveSize,
                                                txtColor: AppColor.backGroundColor,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: Get.width*.13,),
                                        ],
                                      )
                                    ])
                              ],
                            ),
                            // child: Container(color: Colors.green,height:Get.height * .26),
                          ),
                          itemCount: savedCardController.cardList.length,
                          scrollDirection: Axis.horizontal,
                        );},
                      ),
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
              title: StringUtils.addNewCard,
              onPress: () => savedCardController.onAddCardClick('','','','',''),
            ),
            SizedBox(
              height: ConstantSize.commonBottomPadding,
            )
          ],
        ),
      ),
    );
  }
}
