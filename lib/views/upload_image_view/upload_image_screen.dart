import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/views/add_service_view/add_servise_first_view/servicefirstviewmodel.dart';
import 'package:service_provider_two/views/upload_image_view/uploadimageviewmodel.dart';
import '../../res/colors/app_color.dart';
import '../../res/components/TextBoldUrbanist.dart';
import '../../res/components/round_button.dart';
import '../../utils/constants_size.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/string_utils.dart';
import '../../utils/utils.dart';
import '../add_service_view/add_service_second_view/service_second_viewModel.dart';
import '../specialty_view/specialty_view_model.dart';
import 'imageshowcontainer.dart';

class UploadImageScreen extends StatefulWidget {
  const UploadImageScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _UploadImageState();
  }
}

class _UploadImageState extends State<UploadImageScreen> {
  UploadImageViewModel uploadImageViewModel = Get.put(UploadImageViewModel(), permanent: true);
  void cleanResource(){
    Get.delete<ServiceFirstViewModel>(force: true);
    Get.delete<ServiceSecondViewModel>(force: true);
    Get.delete<UploadImageViewModel>(force: true);
    Get.delete<SpecialtyViewModel>(force: true);
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: ()async {
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
          ),
          body: SingleChildScrollView(
              child: GestureDetector(
                  onTap: () {
                    Utils.hideKeyBoard(context);
                  },
                  child: Container(
                      color: AppColor.whiteColor,
                      width: Get.width,
                      padding: const EdgeInsets.only(
                          left: ConstantSize.screenPadding,
                          right: ConstantSize.screenPadding),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: ConstantSize.commonTopPadding,
                            ),
                            TextBoldUrbanist(
                                txt: StringUtils.uploadImage, textAlign: TextAlign.start),
                            SizedBox(
                              height: Get.height * .035,
                            ),
                            Obx(
                                ()=> GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: kIsWeb?uploadImageViewModel.bitesImageList.length:uploadImageViewModel.imageList.length,
                                  itemBuilder: (context, index) {
                                    return Obx(() {
                                      return ImageShowContainer(title: uploadImageViewModel.imageList[index],onPress: () {
                                        if(kIsWeb){
                                          if (uploadImageViewModel
                                              .bitesImageList[index] != null) {
                                            Get.toNamed(RoutesName.imagePreview,
                                                arguments: ['',
                                                  uploadImageViewModel
                                                      .bitesImageList[index],false,false
                                                ]);
                                          }
                                        }else {
                                          if (uploadImageViewModel
                                              .imageList[index] != null) {
                                            Get.toNamed(RoutesName.imagePreview,
                                                arguments: [
                                                  uploadImageViewModel
                                                      .imageList[index]?.path ??
                                                      '',
                                                  null,false,false
                                                ]);
                                          }
                                        }
                                      },onDelete: () {
                                        uploadImageViewModel.onDeleteImage(index);
                                      },bitesImage:  uploadImageViewModel.bitesImageList[index],);});
                                  },
                                  gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: Get.height*.01,
                                    mainAxisSpacing: Get.height*.01,
                                    // crossAxisSpacing: 0,
                                    // mainAxisSpacing: 0,
                                    childAspectRatio: MediaQuery.of(context).size.width /
                                        (MediaQuery.of(context).size.height / 3.8),
                                  )),
                            ),
                            SizedBox(
                              height: Get.height * .035,
                            ),
                            InkWell(onTap: () {
                              uploadImageViewModel.pickImage();
                            },
                              child: DottedBorder(
                                color: AppColor.viewLineColor,
                                dashPattern: const [8, 3, 8, 3],
                                borderType: BorderType.RRect,
                                radius: const Radius.circular(ConstantSize.containerWelcomeRadius),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(ConstantSize.containerWelcomeRadius),
                                  child: Container(padding: const EdgeInsets.all(10),alignment: Alignment.center,decoration:const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.rectangle,
                                  ),width: Get.width,child: Column(
                                    children: [
                                      const Icon(Icons.add,color: AppColor.backGroundColor,size: 45,),
                                      TextBoldUrbanist(
                                          txt: StringUtils.addImage, textAlign: TextAlign.center,textSize: ConstantSize.smallIconSize,txtColor: AppColor.backGroundColor,),
                                    ],
                                  ),),
                                ),
                              ),
                            ),
                            SizedBox(height: ConstantSize.bottomScrollSize,),


                          ])))),bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 0.0, left: ConstantSize.screenPadding, right:ConstantSize.screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundButton(title: StringUtils.continuee, onPress: () {
              uploadImageViewModel.onContinueClicked();
            }),
            SizedBox(
              height: ConstantSize.commonBottomPadding,
            ),
          ],),
      ),),
    );
  }
}
