import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../res/assets/svg_assets.dart';
import '../../../../res/colors/app_color.dart';
import '../../../../res/components/TextBoldUrbanist.dart';
import '../../../../res/components/loadsvg.dart';
import '../../../../res/fonts/app_fonts.dart';
import '../../../../utils/constants_size.dart';
class BankDetailShowWidget extends StatelessWidget{
  final double verticalPading;
  final String bankName;
  final String bankNumber;
  final bool lastViewLine;
  final bool activeBankStatus;
  final VoidCallback onDeleteAccountClick;
  final VoidCallback onBankClick;

  BankDetailShowWidget({super.key,this.bankName='BankName',this.verticalPading=5,this.bankNumber='******321}',this.lastViewLine=false,this.activeBankStatus=false,required this.onDeleteAccountClick,required this.onBankClick});


  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: onBankClick,
      child: Container(
        alignment: Alignment.center,
        width: Get.width-ConstantSize.screenPadding*2,
        child: Column(
          children: [
            const Divider(
              color: AppColor.dividerColor,
            ),
            SizedBox(height: verticalPading,),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(
                      ConstantSize.containerWelcomeRadius),color: AppColor.darkGreyForBank),
                ),
                SizedBox(width: Get.width*.03,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Row(
                      children: [
                        TextBoldUrbanist(
                          txt: bankName,
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.blackColor,
                        ),
                        SizedBox(width: Get.width*.04,),
                        activeBankStatus?const LoadSvg(svgPath: SvgAssets.greenDot):Container(),
                        activeBankStatus?SizedBox(width: Get.width*.02,):Container(),
                        activeBankStatus?TextBoldUrbanist(
                          txt: 'Active',
                          textAlign: TextAlign.start,
                          fontWeight: AppFonts.urbanistMediumWeight,
                          textSize: ConstantSize.commonTxtSize,
                          txtColor: AppColor.viewLineColor,
                        ):Container(),
                      ],
                    ),
                    TextBoldUrbanist(
                      txt: bankNumber,
                      textAlign: TextAlign.start,
                      fontWeight: AppFonts.urbanistMediumWeight,
                      textSize: ConstantSize.commonTxtSize,
                      txtColor: AppColor.viewLineColor,
                    ),
                  ],
                ),
                Spacer(),
                InkWell(onTap: onDeleteAccountClick,child: const LoadSvg(svgPath: SvgAssets.trashIcon))
              ],
            ),
           SizedBox(height: verticalPading,),
            lastViewLine?const Divider(
              color: AppColor.dividerColor,
            ):Container(),
          ],
        ),
      ),
    );
  }

}