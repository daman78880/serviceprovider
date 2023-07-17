import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/res/components/loadsvg.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../res/assets/svg_assets.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/network_image_widget.dart';
import '../../res/fonts/app_fonts.dart';
import '../../utils/constants_size.dart';
import 'home_customer_controller.dart';

class HomeCustomerScreenView extends StatefulWidget {
  const HomeCustomerScreenView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomeCustomerScreenState();
  }
}

class _HomeCustomerScreenState extends State<HomeCustomerScreenView> {
  HomeCustomerController homeController = Get.find<HomeCustomerController>();

  @override
  void initState() {
    print('customer home state called');
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      homeController.hitAllServicesList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
            color: AppColor.whiteColor,
            width: Get.width,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: ConstantSize.screenPadding,
                        right: ConstantSize.screenPadding),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          height: AppBar().preferredSize.height,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // ClipRRect(
                              //   borderRadius: BorderRadius.circular(200),
                              //   // child: Icon(Icons.add,size: ConstantSize.homeImageSize,)
                              //   child: Image.network(
                              //     'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',
                              //     fit: BoxFit.fill,
                              //     width: ConstantSize.homeImageSize,
                              //     height: ConstantSize.homeImageSize,
                              //   ),
                              // ),
                              NetworkImageWidget(borderRadius: BorderRadius.circular(200),
                                width: ConstantSize.homeImageSize,
                                height: ConstantSize.homeImageSize,
                                fit: BoxFit.cover,imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',),

                              SizedBox(
                                width: Get.width * .04,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBoldUrbanist(
                                    txt: 'Good Morning',
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonSmallTxtSize + 2,
                                    txtColor: AppColor.viewLineColor,
                                  ),
                                  TextBoldUrbanist(
                                    txt: 'Andrew Ainsleys',
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonMediumTxtSize,
                                    txtColor: AppColor.blackColor,
                                  ),
                                ],
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                SvgAssets.notification,
                                semanticsLabel: 'notification logo',
                                width: ConstantSize.bigIconSize,
                                height: ConstantSize.bigIconSize,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .03,
                        ),
                        GestureDetector(onTap: () => Get.toNamed(RoutesName.searchBarCustomer),
                          child: Container(
                            padding: const EdgeInsets.all(ConstantSize.commonBtnPadding),
                            decoration: BoxDecoration(
                              color: AppColor.countryContainerColor,
                              borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius)
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'What are you looking for?',
                                  style: TextStyle(
                                      fontSize: ConstantSize.commonTxtTwelveSize,
                                      color: AppColor.viewLineColor,
                                      fontWeight: AppFonts.poppinsRagularWeight,
                                      fontFamily: AppFonts.poppinsFamily),
                                  textAlign: TextAlign.left,
                                ),
                                Icon(Icons.search, color: AppColor.backGroundColor),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Get.toNamed(RoutesName.serviceDetailCustomer,arguments: ["sdf"]);
                          },
                          child: SizedBox(
                              width: Get.width,
                              height: Get.height * .2,
                              child: Image.asset(
                                ImageAssets.homeProviderPromotionBanner,
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          height: Get.height * .023,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBoldUrbanist(
                              txt: 'Services',
                              textAlign: TextAlign.start,
                              textSize: ConstantSize.commonMediumTxtSize,
                              txtColor: AppColor.blackColor,
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(RoutesName.allServicesScreen);
                              },
                              child: TextBoldUrbanist(
                                txt: 'See All',
                                textAlign: TextAlign.end,
                                textSize: ConstantSize.commonMediumTxtSize,
                                txtColor: AppColor.backGroundColor,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Get.height * .02,
                        ),
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: Get.height * .2
                          ),
                          child: Obx(
                              ()=> GridView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    mainAxisSpacing: 6,
                                    crossAxisSpacing: 6,
                                    childAspectRatio:
                                    MediaQuery.of(context).size.width /
                                        (MediaQuery.of(context).size.height /
                                            2.2)),
                                itemBuilder: (context, index) {
                                  return index<7?GestureDetector(
                                          onTap: () => homeController.onCategoryClick( homeController.serviceList[index] ),
                                          child: Column(children: [
                                      // ClipRRect(
                                      //     borderRadius: BorderRadius.circular(40),
                                      //     child: Image.network(
                                      //       homeController.serviceList[index].iId?.imageUrl??'',
                                      //      // 'https://c8.alamy.com/comp/2AKR9B1/house-cleaning-logo-2AKR9B1.jpg',
                                      //       fit: BoxFit.fill,
                                      //       width: 45,
                                      //       height: 45,
                                      //     ),
                                      // ),
                                            NetworkImageWidget(borderRadius: BorderRadius.circular(40),
                                              width: 45,
                                                    height: 45,
                                              fit: BoxFit.cover,imageUrl: homeController.serviceList[index].iId?.imageUrl??'https://c8.alamy.com/comp/2AKR9B1/house-cleaning-logo-2AKR9B1.jpg',),

                                            TextBoldUrbanist(
                                          txt: homeController.serviceList[index].iId?.categoriesName??'' ,
                                          textAlign: TextAlign.start,
                                          fontWeight: AppFonts.urbanistMediumWeight,
                                          textSize: ConstantSize.commonTxtSize,
                                          txtColor: AppColor.blackColor,
                                      )
                                    ]),
                                  ):index==7?GestureDetector(
                                  onTap: () => homeController.onCategoryClick( homeController.serviceList[index] ),
                                  child: Column(children: [
                                  ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  // child: Image.network(
                                  //   homeController.serviceList[index].imageUrl??'',
                                  //   fit: BoxFit.fill,
                                  //   width: 45,
                                  //   height: 45,
                                  // ),
                                  child: LoadSvg(svgPath: SvgAssets.moreIconService,width: 45,height: 45,),
                                  ),
                                  TextBoldUrbanist(
                                  txt: 'More' ,
                                  textAlign: TextAlign.start,
                                  fontWeight: AppFonts.urbanistMediumWeight,
                                  textSize: ConstantSize.commonTxtSize,
                                  txtColor: AppColor.blackColor,
                                  )
                                  ]),
                                  ):null;
                                },
                                itemCount: homeController.serviceList.length),
                          ),
                        ),
                        SizedBox(
                          height: Get.height * .03,
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: Get.width,
                    color: AppColor.liteBackGroundColor,
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child:
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: ConstantSize.screenPadding),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextBoldUrbanist(
                                txt: 'Body & Skin Care',
                                textAlign: TextAlign.start,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                              TextBoldUrbanist(
                                txt: 'See All',
                                textAlign: TextAlign.end,
                                textSize: ConstantSize.commonTxtSize,
                                txtColor: AppColor.blackColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * .015,
                          ),
                          SizedBox(
                            width: Get.width,
                            height: Get.width*.3,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount:   7,
                              itemBuilder: (context, index) =>  Container(
                                      margin: EdgeInsets.only(right: Get.width*.03),

                                      child: Stack(children: [
                                        SizedBox(
                                          width: Get.width*.3,
                                          height: Get.width*.3,
                                          child: ClipRRect(
                                          borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                          child: Image.asset(
                                            ImageAssets.demoImageSecond,
                                            fit: BoxFit.cover,
                                          ),
                                    ),
                                        ),
                                  Container(
                                    width: Get.width*.3,
                                    height: Get.width*.3,
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(bottom: 3,left: 3),
                                    child: TextBoldUrbanist(
                                        txt: index == 0
                                            ? 'Body Massage'
                                            : index == 1
                                            ? 'Face Massage'
                                            : index == 2
                                            ? 'Face Massage'
                                            : index == 3
                                            ? 'Laundry'
                                            : index == 4
                                            ? 'Appliance'
                                            : index == 5
                                            ? 'Plumbing'
                                            : index == 6
                                            ? 'Shifting'
                                            : 'More',
                                        textAlign: TextAlign.start,
                                        fontWeight: AppFonts.urbanistMediumWeight,
                                        textSize: ConstantSize.commonTxtTwelveSize,
                                        txtColor: AppColor.whiteColor,
                                    ),
                                  )
                                ]),
                                    ),

                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  Padding(
                    padding:  const EdgeInsets.symmetric(horizontal: ConstantSize.screenPadding),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBoldUrbanist(
                              txt: 'Appliance Repair',
                              textAlign: TextAlign.start,
                              textSize: ConstantSize.commonTxtSize,
                              txtColor: AppColor.blackColor,
                            ),
                            TextBoldUrbanist(
                              txt: 'See All',
                              textAlign: TextAlign.end,
                              textSize: ConstantSize.commonTxtSize,
                              txtColor: AppColor.backGroundColor,
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height*.015,),
                        Container(
                          width: Get.width,
                          height: Get.width*.45,
                          padding: const EdgeInsets.all(2),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:   7,
                            itemBuilder: (context, index) =>Container(
                                    width: Get.width*.35,
                                    alignment: Alignment.topLeft,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                        border: Border.all(color: AppColor.liteBackGroundColor)
                                    ),
                                    // height: Get.width*.35,
                                    margin: EdgeInsets.only(right: Get.width*.03),
                                    padding: const EdgeInsets.all(3),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                  SizedBox(
                                    width: Get.width*.35,
                                    height: Get.width*.25,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                      child: Image.asset(
                                        ImageAssets.demoImageSecond,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Get.height*.02,),
                                  Expanded(
                                    child: TextBoldUrbanist(
                                      txt: index == 0
                                          ? 'Microwave Repair'
                                          : index == 1
                                          ? 'Refrigerator Repair Repair'
                                          : index == 2
                                          ? 'AC Repair & Service0'
                                          : index == 3
                                          ? 'Laundry'
                                          : index == 4
                                          ? 'Appliance'
                                          : index == 5
                                          ? 'Plumbing'
                                          : index == 6
                                          ? 'Shifting'
                                          : 'More',
                                      textAlign: TextAlign.start,
                                      textSize: ConstantSize.commonTxtTwelveSize,
                                      txtColor: AppColor.blackColor,
                                    ),
                                  )
                                ]),
                              ),
                          ),
                        ),
                        SizedBox(height: Get.height*.02,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextBoldUrbanist(
                              txt: 'New & Noteworthy',
                              textAlign: TextAlign.start,
                              textSize: ConstantSize.commonTxtSize,
                              txtColor: AppColor.blackColor,
                            ),
                            TextBoldUrbanist(
                              txt: 'See All',
                              textAlign: TextAlign.end,
                              textSize: ConstantSize.commonTxtSize,
                              txtColor: AppColor.backGroundColor,
                            ),
                          ],
                        ),
                        SizedBox(height: Get.height*.015,),
                        ListView.builder(shrinkWrap: true,physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                color:AppColor.liteBackGroundColor
                            ),
                          width:Get.width-ConstantSize.screenPadding*2,
                                margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              SizedBox(
                                width: Get.width*.15,
                                height: Get.width*.15,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                  child: Image.asset(
                                    ImageAssets.demoImageSecond,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),SizedBox(width: Get.width*.025,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextBoldUrbanist(
                                    txt: 'House Cleaning',
                                    textAlign: TextAlign.start,
                                    textSize: ConstantSize.commonMediumTxtSize,
                                    txtColor: AppColor.blackColor,
                                  ),
                                  TextBoldUrbanist(
                                    txt: '30+ Service Providers',
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonSmallTxtSize,
                                    txtColor: AppColor.backGroundColor,
                                  ),
                                ],
                              ),
                              Spacer(),
                              const  LoadSvg(svgPath: SvgAssets.arrowRightColorFull)
                            ,const SizedBox(width: 8,),
                            ],
                          ),
                        ),
                        itemCount: homeController.serviceList.length,)
                      ],
                    ),
                  ),
                ])
        ),
      ),
    );
  }
}
