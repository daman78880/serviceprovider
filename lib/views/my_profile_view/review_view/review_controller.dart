import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/res/assets/image_assets.dart';
import 'package:service_provider_two/respository/home_repository.dart';
import 'package:service_provider_two/utils/constants.dart';
import '../../../models/rating_review_model.dart';
import '../../../utils/utils.dart';

class ReviewController extends GetxController {
  final _myRepo = HomeRepository();

  late RxList<RatingReviewModel> ratingList = <RatingReviewModel>[].obs;
  List<String> words = [
    'Lorem',
    'ipsum',
    'dolor',
    'sit',
    'amet',
    'consectetur',
    'adipiscing',
    'elit',
    'sed',
    'do',
    'eiusmod',
    'tempor',
    'incididunt',
    'ut',
    'labore',
    'et',
    'dolore',
    'magna',
    'aliqua',
  ];
  RxInt averateRating = 0.obs;

  @override
  void onInit() {

    super.onInit();
  }
  @override
  void onReady() {
    if(Constants.apiWorking){
      getReviews();
    }else{
      for (int i = 0; i < 10; i++) {
        int rating = Random().nextInt(5);
        ratingList.add(RatingReviewModel(
            profileUrl: ImageAssets.demoImage,
            name: 'User ${i + Random().nextInt(10)}',
            rating: rating != 0 ? rating : 1,
            time: '${Random().nextInt(10)} Day ago',
            content: generateRandomString(30)));
      }
      averateRating.value = getAverage();
    }
    super.onReady();
  }
  void getReviews(){
    BuildContext? context=Get.context;
      Utils.showDialogProgressDialog(context!, true);
    _myRepo.getReviewApi().then((value ) {
      Utils.showDialogProgressDialog(context, false);
      if((value.data?.length??0)>0) {
        averateRating.value = value.data?[0].averageRating ?? 0;
      }else{
        averateRating.value = 0;
      }
      value.data?.forEach((element) {
        ratingList.add(RatingReviewModel(
          profileUrl: ImageAssets.demoImage,
          name: element.senderName??'',
          rating: element.rating??1,
          time: Utils.timeFormatForRating(element.createdAt??''),
          content: element.comments??'',));
      });
      if (kDebugMode) {
        print("getting review sucssfull");
      }
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error:${error.toString()}");
      }
    });
  }

  int getAverage() {
    List<int> list =[];
    for (var element in ratingList) {
      RatingReviewModel data = element;
      list.add(data.rating);
    }
    int totalAverate = 0;
    for (var element in list) {
      totalAverate+=element;
    }
    return totalAverate~/list.length;
  }

  String generateRandomString(int wordCount) {
    Random random = Random();
    String randomString = '';
    for (int i = 0; i < wordCount; i++) {
      int randomIndex = random.nextInt(words.length);
      randomString += '${words[randomIndex]} ';
    }
    return randomString.trim();
  }
}
