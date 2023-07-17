import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/views/my_profile_view/bank_view/bank_detail/bank_detail_controller.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/TextBoldUrbanist.dart';
import '../../../../res/components/round_button.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../utils/constants_size.dart';
import 'bank_detail_show_widget.dart';

class BankDetailScreen extends StatefulWidget {
  const BankDetailScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BankDetailScreenState();
  }
}

class _BankDetailScreenState extends State<BankDetailScreen> {
  final BankDetailController _bankDetailController = Get.put(BankDetailController(),permanent: true);


  @override
  void dispose() {
    Get.delete<BankDetailController>(force: true);
    super.dispose();
  }
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
          txt: 'Bank Details',
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
              padding: const EdgeInsets.only(
                  left: ConstantSize.screenPadding,
                  right: ConstantSize.screenPadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: Get.height * .023,
                    ),
                    TextBoldUrbanist(
                      txt: 'Saved Accounts',
                      textAlign: TextAlign.start,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonTxtSize,
                      txtColor: AppColor.blackColor,
                    ),
                    SizedBox(
                      height: ConstantSize.bottomScrollSize,
                    ),
                    Obx(() =>
                        ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) =>
                              BankDetailShowWidget(bankName:_bankDetailController.bankList[index]
                                  .bankName ,
                                bankNumber:
                             '******${_bankDetailController.bankList[index].bankNumber % 10000}',
                                activeBankStatus: _bankDetailController
                                    .bankList[index].activeBankStatus
                                    ,
                                lastViewLine: index ==
                                    _bankDetailController.bankList.length - 1
                                    ? true
                                    : false,
                                onBankClick: () =>
                                    _bankDetailController.onEditBankDetailClick(
                                        bankName: _bankDetailController
                                            .bankList[index].bankName
                                            ,
                                        accountNumber: _bankDetailController
                                            .bankList[index].bankNumber
                                            ,
                                        ifceCode: _bankDetailController
                                            .bankList[index].ifceCode ,
                                        bankId: _bankDetailController
                                        .bankList[index].bankId),
                                onDeleteAccountClick: () {
                                  _bankDetailController.onDeleteAccount(index,_bankDetailController
                                      .bankList[index].bankId );
                                },
                              ),
                          itemCount: _bankDetailController.bankList.length,
                        )),
                    SizedBox(
                      height: ConstantSize.bottomScrollSize,
                    ),
                  ]))),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: 0.0,
            left: ConstantSize.screenPadding,
            right: ConstantSize.screenPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RoundButton(
              title: "Add New Bank Account",
              onPress: () => _bankDetailController.onContinueClicked(),
            ),
            SizedBox(
              height: ConstantSize.commonBottomPadding,
            ),
          ],
        ),
      ),
    );
  }
}
