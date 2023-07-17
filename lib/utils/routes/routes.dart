import 'package:get/get.dart';
import 'package:service_provider_two/views/add_service_view/add_service_second_view/addservicesecondscreen.dart';
import 'package:service_provider_two/views/add_service_view/add_servise_first_view/addservicefirstscreen.dart';
import 'package:service_provider_two/views/addbankdetailview/addbankdetailscreen.dart';
import 'package:service_provider_two/views/all_customerl_services_view/all_services_customer_screen.dart';
import 'package:service_provider_two/views/chat_view/chat_screen.dart';
import 'package:service_provider_two/views/chat_view/report_user_view/report_user_screen.dart';
import 'package:service_provider_two/views/chat_view/user_profile_view/chat_user_profile_screen.dart';
import 'package:service_provider_two/views/home_view/home_screen.dart';
import 'package:service_provider_two/views/home_view/my_services_view/my_services_screen.dart';
import 'package:service_provider_two/views/intro_view/intro_screen.dart';
import 'package:service_provider_two/views/my_profile_view/bank_view/add_edit_bank_detail/add_edit_bank_detail_screen.dart';
import 'package:service_provider_two/views/my_profile_view/change_language_view/change_language_screen.dart';
import 'package:service_provider_two/views/my_profile_view/help_support_view/help_support_screen.dart';
import 'package:service_provider_two/views/my_profile_view/privacy_policy_view/privacy_policy_screen.dart';
import 'package:service_provider_two/views/my_profile_view/review_view/review_screen.dart';
import 'package:service_provider_two/views/my_profile_view/saved_card_view/add_new_card_view/add_new_card_screen.dart';
import 'package:service_provider_two/views/my_profile_view/term_condition_view/term_condition_screen.dart';
import 'package:service_provider_two/views/otp_view/otp_screen.dart';
import 'package:service_provider_two/views/profile_setup_second_view/profile_setup_second.dart';
import 'package:service_provider_two/views/profile_setup_view/profile_setup.dart';
import 'package:service_provider_two/views/search_bar_customer_view/search_bar_customer_screen.dart';
import 'package:service_provider_two/views/service_detail_customer_view/add_location_service__detaile_view/add_location_service_view.dart';
import 'package:service_provider_two/views/service_detail_customer_view/service_detail_customer_screen.dart';
import 'package:service_provider_two/views/service_detail_customer_view/service_payment_view/service_payment_screen.dart';
import 'package:service_provider_two/views/service_detail_view/service_detail_screen.dart';
import 'package:service_provider_two/views/service_map_view/service_map_view.dart';
import 'package:service_provider_two/views/sign_in_view/sign_in_screen.dart';
import 'package:service_provider_two/views/specialty_view/choose_specialty_view/choose_specialty_screen.dart';
import 'package:service_provider_two/views/specialty_view/choose_sub_category_specialty/choosesubcategoryspecialtyscreen.dart';
import 'package:service_provider_two/views/specialty_view/specialty_screen.dart';
import 'package:service_provider_two/views/upload_image_view/upload_image_screen.dart';
import 'package:service_provider_two/views/welcome_view/welcome_as.dart';
import 'package:service_provider_two/views/welcome_view/welcome_dart.dart';
import '../../utils/routes/routes_name.dart';
import '../../views/all_customerl_services_view/customer_service_list_detail_view/customer_all_sub_categroy_service.dart';
import '../../views/all_customerl_services_view/on_click_service_customer/OnClickServiceCustomer.dart';
import '../../views/home_customer_view/home_customer_screen.dart';
import '../../views/home_view/home_empty_service_view/home_empty_service_screen.dart';
import '../../views/my_profile_view/bank_view/bank_detail/bank_detail_screen.dart';
import '../../views/my_profile_view/edit_profile_view/edit_profile_screen.dart';
import '../../views/my_profile_view/saved_card_view/saved_card_screen.dart';
import '../../views/preview_image/image_preview.dart';
import '../../views/review_service_view/reviewservicescreen.dart';
import '../../views/service_detail_customer_view/select_service_detail_date_view/select_service_detail_date_screen.dart';
import '../../views/service_detail_customer_view/select_service_detail_view/selec_service_detail_screen.dart';
import '../../views/splash_view/splash_screen.dart';
import '../constants_size.dart';

class Routes {
  static appRoutes() => [
                GetPage(
            name: RoutesName.splashScreen,
            page: () => const SplashScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.homeScreen,
            page: () =>const HomeScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),

        GetPage(
            name: RoutesName.homeCustomerScreen,
            page: () =>const HomeCustomerScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.introScreen,
            page: () => IntroScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.welcomeScreen,
            page: () => WelcomeScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.signInScreen,
            page: () =>const SignInScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.otpScreen,
            page: () => const OtpScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.profileSetupScreen,
            page: () =>const ProfileSetupScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.profileSetupSecondScreen,
            page: () =>const ProfileSetupSecondScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.specialtyScreen,
            page: () =>const SpecialtyScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.chooseSpecialtyScreen,
            page: () =>const ChooseSpecialtyScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.chooseSubCategorySpecialtyScreen,
            page: () =>const ChooseSubCategorySpecialtyScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.addServiceFirstScreen,
            page: () =>const AddServiceFirstScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.addServiceSecondScreen,
            page: () =>const AddServiceSecondScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.uploadImageScreen,
            page: () =>const UploadImageScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.addBankDetailScreen,
            page: () =>const AddBankDetailScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.reviewServiceScreen,
            page: () =>const ReviewServiceScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.editProfileScreen,
            page: () =>const EditProfileScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.bankDetailScreen,
            page: () =>const BankDetailScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.addEditBankDetail,
            page: () =>const AddEditBankDetail(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.changeLanguage,
            page: () =>const ChangeLanguageScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.helpSupport,
            page: () =>const HelpSupportScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.ratingReview,
            page: () =>const ReviewScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.serviceDetail,
            page: () =>const ServiceDetailScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.termCondition,
            page: () =>const TermConditionScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.privacyPolicy,
            page: () =>const PrivacyPolicyScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.chatScreen,
            page: () =>const ChatScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.chatUserProfile,
            page: () =>const ChatUserProfileScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.chatReportUser,
            page: () =>const ReportUserScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.emptyService,
            page: () =>const HomeEmptyServiceScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.myService,
            page: () =>const MyServicesScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.serviceMap,
            page: () =>const ServiceMapView(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.searchBarCustomer,
            page: () =>const SearchBarCustomer(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.allServicesScreen,
            page: () =>const AllservicesCustomerScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.allSubServices,
            page: () =>const CustmoerAllSubCategoryService(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.onClickCustomerService,
            page: () =>const OnClickServiceCustomer(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.serviceDetailCustomer,
            page: () =>const ServiceDetailCustomerScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.selectServiceDetailCustomerView,
            page: () =>const SelectServiceDetailScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.selectServiceDetailDateCustomerView,
            page: () =>const SelectServiceDetailDateScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.addLocationServiceScreen,
            page: () =>const AddLocationServiceScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.servicePaymentScreen,
            page: () =>const ServicePaymentScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.welcomeAsScreen,
            page: () =>const WelcomeAsScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.savedCardScreen,
            page: () =>const SavedCardScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.addNewCardScreen,
            page: () => AddNewCardScreen(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
        GetPage(
            name: RoutesName.imagePreview,
            page: () => ImagePreviewC(),
            transitionDuration: const Duration(
                milliseconds: ConstantSize.screenTransitionDuration),
            transition: Transition.rightToLeftWithFade),
      ];
}
