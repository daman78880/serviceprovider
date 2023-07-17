import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/models/card_detail_show_model.dart';
import 'package:service_provider_two/utils/routes/routes_name.dart';
import '../../../respository/card_repository.dart';
import '../../../utils/utils.dart';

class SavedCardController extends GetxController {
  final _myRepo = CardRepository();

  TextEditingController accountNameHolderController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  FocusNode accountNameHolderNode = FocusNode();
  FocusNode cardNumberNode = FocusNode();
  RxList<CardDetailShowModel> cardList = <CardDetailShowModel>[].obs;
  RxInt currentCardIndex = 0.obs;

  void getCardDetailApi() {
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.getAllCardDetails().then((value) {
      Utils.showDialogProgressDialog(context, false);
      print('Get all card list is ${value}');
      var len = value.data?.length ?? 0;
        cardList.clear();
      for (int i = 0; i < len; i++) {
        print('date is ${ value.data?[i].expiryDate}');
        cardList.add(CardDetailShowModel(
            cardId: value.data?[i].sId ?? '',
            cardHolderName: value.data?[i].accountHolderName ?? '',
            cardLastNumber: value.data?[i].cardNo ?? '',
            cardExpirationDate: Utils.formatApiExpireDate(
                value.data?[i].expiryDate ?? ''),
            bankName:  value.data?[i].bankName??'',
            cardCvv: value.data?[i].cvv ?? '',
          ));
        }
        }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error getAllCardDetails :$error");
      }
    });
  }

  void onDeleteBankClick(String id, int index) {
    BuildContext? context = Get.context;
    Utils.showDialogProgressDialog(context!, true);
    _myRepo.removeCardDetail(id).then((value) {
      Utils.showDialogProgressDialog(context!, false);
      print('Get all card list is ${value}');
      cardList.removeAt(index);
      // update();
      // Get.back();
    }).onError((error, stackTrace) {
      Utils.showDialogProgressDialog(context!, false);
      Utils.snackBar('Error', error.toString());
      if (kDebugMode) {
        print("error getting subCategory :$error");
      }
    });
  }


  @override
  void onReady() {

    super.onReady();
  }

  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    getCardDetailApi();
    });
/*    for (int i = 0; i < 10; i++) {
      cardList.add(CardDetailShowModel(
        cardId: '',
          cardHolderName: i % 2 == 0 ? 'Daman' : 'Vivek',
          cardLastNumber: i % 2 == 0 ? '123456781234567' : '9876543219876543',
          cardExpirationDate: i % 2 == 0 ? '2023/12/10' : '2023/10/18',
          bankName: i % 2 == 0 ? 'Axis Bank' : 'Punjab National Bank',
          cardCvv: "123"));
    }
    for (int i = 0; i < cardList.length; i++) {
      cardListWidget.add(CardShowWidget(
        bankName: cardList[i].bankName,
        cardExpirationDate: cardList[i].cardExpirationDate,
        cardHolderName: cardList[i].cardHolderName,
        lastCardNumber: cardList[i].cardLastNumber,
        red: i % 2 == 0 ? true : false,
        onEditClick: () {
          print('onEdit clicked');
          Get.toNamed(RoutesName.addNewCardScreen, arguments: {
            'cardId': cardList[i].cardId,
            'bankName': cardList[i].bankName,
            'cardHolderName': cardList[i].cardHolderName,
            'cardExpirationDate': cardList[i].cardExpirationDate,
            'cardNumber': cardList[i].cardLastNumber,
            'cardCvv': cardList[i].cardCvv
          });
        },
        onDeleteClick: () {},
      ));
    }*/
    super.onInit();
  }

  void onEditClick(String cardId,
      String bankName,
      String cardHolderName,
      String cardExpirationDate,
      String cardNumber,
      String cardCvv,) {
    print('onEdit click $cardId');
    Get.toNamed(RoutesName.addNewCardScreen, arguments: {
      'cardId': cardId,
      'bankName': bankName,
      'cardHolderName': cardHolderName,
      'cardExpirationDate': cardExpirationDate,
      'cardNumber': cardNumber,
      'cardCvv': cardCvv
    });
  }


  void onAddCardClick(String bankName,
      String cardHolderName,
      String cardExpirationDate,
      String cardNumber,
      String cardCvv,) {
    Get.toNamed(RoutesName.addNewCardScreen, arguments: {
      'cardId': '',
      'bankName': bankName,
      'cardHolderName': cardHolderName,
      'cardExpirationDate': cardExpirationDate,
      'cardNumber': cardNumber,
      'cardCvv': cardCvv
    });
  }
}
