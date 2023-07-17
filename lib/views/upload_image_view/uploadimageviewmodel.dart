import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';

class UploadImageViewModel extends GetxController {

  RxList<File?> imageList = <File?>[].obs;
  RxList<Uint8List?> bitesImageList = <Uint8List?>[].obs;
  List<String?> bitesImageNameList = <String?>[];
  @override
  void onInit() {
    for(int i=0;i<4;i++){
      imageList.add(null);
      bitesImageList.add(null);
      bitesImageNameList.add(null);
    }
    super.onInit();
  }

  void onContinueClicked() {
    var temp=0;
    if(kIsWeb){
      for (int i = 0; i < bitesImageList.length; i++) {
        if (bitesImageList[i] != null && bitesImageList.isNotEmpty) {
          temp += 1;
        }
      }
    }else {
      for (int i = 0; i < imageList.length; i++) {
        if (imageList[i] != null && imageList.isNotEmpty) {
          temp += 1;
        }
      }
    }
    if(temp>=1) {
        Get.offNamed(RoutesName.reviewServiceScreen,arguments: {"showActionTitle":false,"selectedIndex":-1});
    }else{
      Utils.snackBar('Please select image', 'At least select 4 image');
    }
  }
  void onDeleteImage(int index){
    imageList.removeAt(index);
    bitesImageList.removeAt(index);
    bitesImageNameList.removeAt(index);
    if(imageList.length<4){
      imageList.add(null);
      bitesImageList.add(null);
      bitesImageNameList.add(null);
    }
  }

  void pickImage()async{
    try {
      if (kIsWeb) {
        var output = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowedExtensions: ['png', 'jpeg', 'jpg',],
          allowMultiple: false,
        );
        FilePickerResult? finalOutput = output;
        var importFile = finalOutput!.files[0];
        var fileName = importFile.name;
        var fileType = '';
        if (fileName.contains(".png")) {
          fileType = "png";
        } else if (fileName.contains(".jpeg")) {
          fileType = "jpeg";
        } else if (fileName.contains(".jpg")) {
          fileType = "jpg";
        }
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
      print('inside printing image picker errro $e');
    }

  }

  void onAddImage(File? file,Uint8List? data, String name)async{
    if(!kIsWeb){
      for(int i=0;i<imageList.length;i++){
        if(imageList[i]==null){
          imageList[i]=file;
          bitesImageList[i]=null;
          bitesImageNameList[i]=name;
          break;
        }
        if(i==imageList.length-1 && imageList[i]!=null ){
          if( imageList.length<6) {
            imageList.add(file);
            bitesImageList.add(null);
            bitesImageNameList.add(name);
            break;
          }else{
            Utils.snackBar('Upload limit exceeded', 'You can upload max 6 picture');
          }
        }
      }
    }else{
      for(int i=0;i<bitesImageList.length;i++){
      if(bitesImageList[i]==null){
        bitesImageList[i]=data;
        bitesImageNameList[i]=name;
        imageList[i]=null;
        break;
      }
      if(i==bitesImageList.length-1 && bitesImageList[i]!=null ){
        if( bitesImageList.length<6) {
          bitesImageList.add(data);
          bitesImageNameList.add(name);
          imageList.add(null);
          break;
        }else{
          Utils.snackBar('Upload limit exceeded', 'You can upload max 8 picture');
        }
      }
    }
    }
  }
}