import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/assets/svg_assets.dart';
import 'package:service_provider_two/views/my_profile_view/review_view/review_controller.dart';
import '../../../res/colors/app_color.dart';
import '../../../res/components/TextBoldUrbanist.dart';
import '../../../res/fonts/app_fonts.dart';
import '../../../utils/constants_size.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ReviewScreenState();
  }
}

class _ReviewScreenState extends State<ReviewScreen> {
  final ReviewController _reviewController = Get.put(ReviewController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                color: AppColor.whiteColor,
                width: Get.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: AppBar().preferredSize.height,
                        color: AppColor.backGroundColor,
                      ),
                      Stack(
                        children: [
                          SizedBox(
                              width: Get.width,
                              height: Get.height * .35,
                              child: Image.asset(
                                ImageAssets.ratingReview,
                                fit: BoxFit.fill,
                              )),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: ConstantSize.screenPadding,
                              ),
                              InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: AppColor.whiteColor,
                                  size: ConstantSize.backIconSize,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextBoldUrbanist(
                                txt: 'Rating & Reviews',
                                textAlign: TextAlign.center,
                                fontWeight: AppFonts.urbanistMediumWeight,
                                textSize: ConstantSize.commonMediumTxtSize,
                                txtColor: AppColor.whiteColor,
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                                bottom: 0.0,
                                top: 0.0,
                                left: ConstantSize.screenPadding,
                                right: ConstantSize.screenPadding),
                            alignment: Alignment.center,
                            width: Get.width,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: Get.height * .035,
                                ),
                                Obx(()=>
                                   TextBoldUrbanist(
                                    txt: "${_reviewController.averateRating}.0",
                                    textAlign: TextAlign.center,
                                    fontWeight: AppFonts.poppinsBoldWeight,
                                    fontFamily: AppFonts.poppinsFamily,
                                    textSize: 80,
                                    txtColor: AppColor.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 0.0,
                            top: 0.0,
                            left: ConstantSize.screenPadding,
                            right: ConstantSize.screenPadding),
                        child: Obx(
                          ()=> ListView.builder(
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: EdgeInsets.only(
                                    bottom: Get.height * .02),
                                width: Get.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: Image.asset(
                                  _reviewController.ratingList[index]
                                      .profileUrl ,
                                  fit: BoxFit.fill,
                                  width:
                                  ConstantSize.bigIconSize * 2 - 5,
                                  height:
                                  ConstantSize.bigIconSize * 2 - 5,
                                ),
                              ),
                              SizedBox(width: Get.width*.04,),
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                              TextBoldUrbanist(
                              txt: _reviewController
                                  .ratingList[index].name ,
                              textAlign: TextAlign.center,
                              textSize:
                              ConstantSize.commonTxtSize,
                              txtColor: AppColor.blackColor,
                              ),
                              Row(
                              children: [
                              RatingBar.builder(
                              initialRating: _reviewController.ratingList[index].rating.toDouble(),
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) =>
                              SvgPicture.asset(
                              SvgAssets.startSilver,
                              colorFilter: const ColorFilter.mode(Colors.amber, BlendMode.srcIn),
                              semanticsLabel: 'A red up arrow'
                              ),

                              onRatingUpdate: (rating) {
                              if (kDebugMode) {
                                print(rating);
                              }
                              },
                                itemSize: 20,
                                unratedColor: AppColor.silverColor,
                                ignoreGestures: true,
                              ),
                              TextBoldUrbanist(
                              txt:" ${_reviewController.ratingList[index].rating.toString()}.0",
                              textAlign: TextAlign.center,
                              textSize:
                              ConstantSize.commonTxtSize,
                              txtColor: AppColor.blackColor,
                              ),
                              ],
                              ),
                              ],
                              ),
                              Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              TextBoldUrbanist(
                              txt: _reviewController
                                  .ratingList[index].time ,
                              textAlign: TextAlign.end,
                              fontWeight:
                              AppFonts.urbanistMediumWeight,
                              textSize:12,
                              txtColor: AppColor.viewLineColor,
                              ),
                              ],
                              )
                              ],
                              ),
                              TextBoldUrbanist(
                              txt: _reviewController.ratingList[index].content,
                              textAlign: TextAlign.start,
                              textSize: ConstantSize.commonTxtSize,
                              txtColor: AppColor.viewLineColor,
                              ),
                              ],
                              ),
                              );
                              },
                            itemCount: _reviewController.ratingList.length,
                            physics: const NeverScrollableScrollPhysics(),
                          ),
                        ),
                      )
                    ]))));
  }
}
