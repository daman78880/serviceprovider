import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:service_provider_two/respository/profile_edit_repository.dart';
import '../../../../utils/constants.dart';
import '../../../utils/utils.dart';

class HelpSupportController extends GetxController {
  final _myRepo = ProfileRepository();
  TextEditingController emailController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode subjectFocusNode = FocusNode();
  FocusNode descriptionFocusNode = FocusNode();


  void onContinueClicked() {
    String email = emailController.text.trim();
    String subject = subjectController.text.trim();
    String description = descriptionController.text.trim();
    if (email.isNotEmpty) {
      if (Utils.isEmail(email)) {
        if (subject.isNotEmpty) {
          if (description.isNotEmpty) {
            if(description.length>20){
            if (Constants.apiWorking) {
              BuildContext? context = Get.context;
              var data = {
                "email":email,
                "subject":subject,
                "description":description,
              };
              Utils.showDialogProgressDialog(context!, true);
              _myRepo.helpAndSupportApi(data).then((value) {
                Utils.showDialogProgressDialog(context, false);
                if (kDebugMode) {
                  print("success login with number kDebug mode");
                }
                if(value.status!=null && value.status ==200){
                  Get.back();
                  Utils.snackBar('Mail send successfully', 'As soon as possible we reply to your mail.');
                }else{
                  Utils.snackBar(
                      'Msg', value.message);
                }
              }).onError((error, stackTrace) {
                Utils.showDialogProgressDialog(context, false);
                  Utils.snackBar('Error', error.toString());
                if (kDebugMode) {
                  print("error:${error.toString()}");
                }
              });
            } else {
              Get.back();
              Get.delete<HelpSupportController>();
            }
            }else{
              Utils.snackBar(
                  'Ivalid Description Field', 'Please enter valid length of Description field.');
            }
          } else {
            Utils.snackBar(
                'Description Empty', 'Please enter Description field.');
          }
        }
        else {
          Utils.snackBar('Subject Empty', 'Please enter subject field.');
        }
      } else {
        Utils.snackBar('Invalid Email', 'Please enter valid email.');
      }
    } else {
      Utils.snackBar('Email Empty', 'Please enter field.');
    }
  }
}
