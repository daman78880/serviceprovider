import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../../models/selected_service_customer_model.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../utils/utils.dart';


class SelectedServiceDetailController extends GetxController{
  RxList<File?> imageList = <File?>[].obs;
  RxList<Uint8List?> bitesImageList = <Uint8List?>[].obs;
  List<String?> bitesImageNameList = <String?>[];
  RxList<SelectedServiceCustomerModel> itemList =<SelectedServiceCustomerModel>[
    SelectedServiceCustomerModel(title: 'Living Room',selected: 0.obs),
    SelectedServiceCustomerModel(title: 'Bedroom',selected: 0.obs),
    SelectedServiceCustomerModel(title: 'Bathroom',selected: 0.obs),
    SelectedServiceCustomerModel(title: 'Kitchen',selected: 0.obs),
  ].obs;
  String serviceProviderId='';

  @override
  void onInit() {
    serviceProviderId=Get.arguments[0];
    super.onInit();
  }


  void onContinueClick(){
      addDetailApi();
    // if(serviceProviderId.isNotEmpty) {
    //   addDetailApi();
    // }else{
    //   Utils.snackBar('ServiceProviderId empty', 'Something error');
    // }
  }

  void addDetailApi(){
    bool navigate=false;
    if(itemList[0].selected.value>0){
      navigate=true;
    }
    else if(itemList[1].selected.value>0){
      navigate=true;

    }
    else if(itemList[2].selected.value>0){
      navigate=true;

    }
    else {
      if(itemList[3].selected.value>0){
      navigate=true;
    }
    }
    if(imageList.isNotEmpty && bitesImageList.isNotEmpty){
    if(navigate){
      Get.offNamed(RoutesName.selectServiceDetailDateCustomerView);
      // Get.toNamed(RoutesName.selectServiceDetailDateCustomerView);
    }
    else{
      Utils.snackBar('Select service empty', 'Please select at least one service');
    }}else{
      Utils.snackBar('Image Empty', 'Please select image');

    }
  }


  void minisSelectedValue(int index){
    int selectedValue=itemList[index].selected.value;
    if(selectedValue>0) {
      itemList[index].selected.value=selectedValue-1;
      update();
    }
  }
  void plusSelectedValue(int index){
    int selectedValue=itemList[index].selected.value;
    itemList[index].selected.value=selectedValue+1;
  }

  void onDeleteImage(int index){
    imageList.removeAt(index);
    bitesImageList.removeAt(index);
    bitesImageNameList.removeAt(index);
  }


  getFromGallery() async {
    try {
      if (kIsWeb) {
        var output = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['png', 'jpeg', 'jpg',],
          allowMultiple: false,
        );
        FilePickerResult? finalOutput = output;
        var importFile = finalOutput!.files[0];
        PlatformFile platformFile = importFile;
        onAddImage(null, platformFile.bytes,platformFile.name);
      } else {
        var result = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: [
            'png',
            'jpeg',
            'jpg',
          ],
          allowMultiple: false,
        );
        if (result != null) {
          File file = File(result.files.single.path ?? '');
          onAddImage(file, null,'');
        } else {
          // User canceled the picker
        }
      }
    }catch(e){
      if (kDebugMode) {
        print('inside printing image picker error $e');
      }
    }
  }
  void onAddImage(File? file,Uint8List? data, String name){
      if(imageList.length<=6) {
        imageList.add(file);
        bitesImageList.add(data);
        bitesImageNameList.add(name);
      }else{
        Utils.snackBar('Upload limit exceeded', 'You can upload max 8 picture');
      }
  }
}