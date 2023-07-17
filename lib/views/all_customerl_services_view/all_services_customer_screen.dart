import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/utils/constants_size.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/network_image_widget.dart';
import '../../res/fonts/app_fonts.dart';
import '../home_customer_view/home_customer_controller.dart';
import 'customer_all_service_controlller.dart';

class AllservicesCustomerScreen extends StatefulWidget {
  const AllservicesCustomerScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AllServicesCustomerState();
  }
}

class _AllServicesCustomerState extends State<AllservicesCustomerScreen> {
  // final CustomerAllServicesController _customerAllServicesController = Get.put(CustomerAllServicesController());
  HomeCustomerController homeController = Get.find<HomeCustomerController>();

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
                // height: Get.height-Get.height*.15,
                // height: Get.height-AppBar().preferredSize.height,
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
                        () =>     GridView.builder(
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
                            return GestureDetector(
                                    onTap: () => Get.toNamed(RoutesName.allSubServices,arguments:[homeController.serviceList[index].iId?.categoriesName??'']),
                                    child: Column(children: [
                                // ClipRRect(
                                //     borderRadius: BorderRadius.circular(40),
                                //     child: Image.network(
                                //       homeController.serviceList[index].iId?.imageUrl??'',
                                //       fit: BoxFit.fill,
                                //       width: 45,
                                //       height: 45,
                                //     ),
                                // ),
                                      NetworkImageWidget(borderRadius: BorderRadius.circular(40),
                                        width: 45,
                                        height: 45,
                                        fit: BoxFit.cover,imageUrl:  homeController.serviceList[index].iId?.imageUrl??'https://upload.wikimedia.org/wikipedia/commons/b/b4/Lionel-Messi-Argentina-2022-FIFA-World-Cup_%28cropped%29.jpg',),

                                      TextBoldUrbanist(
                                    txt:homeController.serviceList[index].iId?.categoriesName??'' ,
                                    textAlign: TextAlign.start,
                                    fontWeight: AppFonts.urbanistMediumWeight,
                                    textSize: ConstantSize.commonTxtSize,
                                    txtColor: AppColor.blackColor,
                                )
                              ]),

                            );
                          },
                          itemCount: homeController.serviceList.length)),
                    ]))));
  }
}
