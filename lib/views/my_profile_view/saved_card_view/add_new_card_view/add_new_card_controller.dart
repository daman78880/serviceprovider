import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:service_provider_two/respository/card_repository.dart';
import '../../../../utils/string_utils.dart';
import '../../../../utils/utils.dart';
import '../saved_card_controller.dart';

class AddNewCardController extends GetxController{
  final _myRepo = CardRepository();
  SavedCardController savedCardController = Get.find<SavedCardController>();

  TextEditingController bankNameController = TextEditingController();
  TextEditingController accountNameHolderController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  FocusNode bankNameHolderNode=FocusNode();
  FocusNode accountNameHolderNode=FocusNode();
  FocusNode cardNumberNode=FocusNode();
  FocusNode cvvNode=FocusNode();
  RxString expireDate=StringUtils.date.obs;
  String sendExpireDate='';
  bool addCardStatus=true;

  RxString selectedBank = 'Bank Name'.obs;



  @override
  void onInit() {

    String bankName=Get.arguments['bankName']??'';
    String cardHolderName=Get.arguments['cardHolderName']??'';
    String cardNumber=Get.arguments['cardNumber']??'';
    String cardExpirationDate=Get.arguments['cardExpirationDate']??'';
    String cardCvv=Get.arguments['cardCvv']??'';
    if(bankName.isNotEmpty&&cardHolderName.isNotEmpty&&cardNumber.isNotEmpty&&cardExpirationDate.isNotEmpty&&cardCvv.isNotEmpty){
    // if(cardNumber.isNotEmpty){
      this.selectedBank.value=bankName;
      accountNameHolderController.text=cardHolderName;
      cardNumberController.text=cardNumber;
      expireDate.value=cardExpirationDate;
      cvvController.text=cardCvv;
      addCardStatus=false;
      print('inside not add bank stauts');
    }else{
      print('inside add bank stauts');
      addCardStatus=true;
    }
    super.onInit();
  }

 void savedDetailClick(){
   String bankName=selectedBank.trim();
   String cardHolderName=accountNameHolderController.text.trim();
   String cardNumber=cardNumberController.text.trim();
   String expireDate=this.expireDate.value.trim();
   String cvvv=cvvController.text.trim();
    if(!addCardStatus){
      String cardId=Get.arguments['cardId']??'';
      // if(cardId.isNotEmpty &&cardId!='E') {
      if(cardId.isNotEmpty) {
        if (cardHolderName.isNotEmpty) {
          if (cardNumber.isNotEmpty) {
            if (cardNumber.length == 16) {
              if (expireDate.isNotEmpty && expireDate != StringUtils.date) {
                if (cvvv.isNotEmpty) {
                  var data = {
                    "cardId":cardId,
                    "bankName":bankName,
                    // "cardId":'6492ea2c88dce25ce98267fb',
                    "accountHolderName": cardHolderName,
                    "cardNo": cardNumber,
                    "expiryDate": expireDate,
                    "cvv": cvvv
                  };
                  BuildContext? context = Get.context;
                  Utils.showDialogProgressDialog(context!, true);
                  _myRepo.editCardDetail(data).then((value) {
                    Utils.showDialogProgressDialog(context!, false);
                    savedCardController.getCardDetailApi();
                    Get.back();
                  }).onError((error, stackTrace) {
                    Utils.showDialogProgressDialog(context!, false);
                    Utils.snackBar('Error', error.toString());
                    if (kDebugMode) {
                      print("error editCardDetail :$error");
                    }
                  });
                } else {}
              } else {
                Utils.snackBar(
                    'Empty expireDate', 'Please select expire date field.');
              }
            } else {
              Utils.snackBar(
                  'Invalid CardNumber', 'Please enter valid card number.');
            }
          } else {
            Utils.snackBar(
                'Empty CardNumber', 'Please enter card number field.');
          }
        } else {
          Utils.snackBar(
              'Empty CardHolderName', 'Please enter card holder name field.');
        }
      }else{
        Utils.snackBar(
            'Empty CardId', 'Please try again some time later.');
      }
    }

    else{
      if(bankName.isNotEmpty != 'Bank Name'){
        if(cardHolderName.isNotEmpty){
          if(cardNumber.isNotEmpty){
            if(cardNumber.length==16) {
              if (expireDate.isNotEmpty &&expireDate!=StringUtils.date ) {
                if (cvvv.isNotEmpty) {
                  var data = {
                    "bankName":bankName,
                    "accountHolderName": cardHolderName,
                    "cardNo": cardNumber,
                    "expiryDate": expireDate,
                    "cvv": cvvv
                  };
                  BuildContext? context = Get.context;
                  Utils.showDialogProgressDialog(context!, true);
                  _myRepo.addCardApi(data).then((value) {
                    Utils.showDialogProgressDialog(context!, false);
                    savedCardController.getCardDetailApi();
                    Get.back();
                  }).onError((error, stackTrace) {
                    Utils.showDialogProgressDialog(context!, false);
                    Utils.snackBar('Error', error.toString());
                    if (kDebugMode) {
                      print("error addCardApi :$error");
                    }
                  });
                } else {}
              } else {
                Utils.snackBar('Empty expireDate', 'Please select expire date field.');
              }
            }else{
              Utils.snackBar('Invalid CardNumber', 'Please enter valid card number.');

            }
          }else{
            Utils.snackBar('Empty CardNumber', 'Please enter card number field.');

          }
        }else
        {
          Utils.snackBar('Empty CardHolderName', 'Please enter card holder name field.');

        }
      }else{
        Utils.snackBar('Empty BankName', 'Please enter bank name field.');
      }
    }

 }

  Future<void> selectDatee(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
        selectedDate = picked;
        final DateFormat formatter = DateFormat('yyyy/MM/dd');
        final String formattedDate = formatter.format(picked);
        expireDate.value=formattedDate;
    }
  }
}