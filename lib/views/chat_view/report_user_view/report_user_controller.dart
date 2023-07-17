import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ReportUserController extends GetxController{
  RxBool scamCheckStatus=false.obs;
  RxBool contactDriverCheckStatus=false.obs;
  RxBool abusiveBehaviourCheckStatus=true.obs;
  RxBool wrongAddressCheckStatus=false.obs;
  TextEditingController explainController = TextEditingController();

}