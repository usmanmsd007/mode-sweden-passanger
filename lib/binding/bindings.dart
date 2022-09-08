import 'package:get/get.dart';
import 'package:uber_ui/controller/accountsettingctrl.dart';
import 'package:uber_ui/controller/authctrls/authCtrl.dart';
import 'package:uber_ui/controller/edit_account_controller.dart';
import 'package:uber_ui/controller/helpcontroller.dart';
import 'package:uber_ui/controller/home_screen_controller.dart';
import 'package:uber_ui/controller/invitefamilycontroller.dart';
import 'package:uber_ui/controller/mapController.dart';
import 'package:uber_ui/controller/pickupcontroller.dart';
import 'package:uber_ui/controller/profileScreenCtrl/profileScreenCtrl.dart';
import 'package:uber_ui/controller/ride_check_controller.dart';
import 'package:uber_ui/controller/send_package_ctrl.dart';
import 'package:uber_ui/controller/termsandreviewprivacycontroller.dart';
import 'package:uber_ui/controller/verify_trips_controller.dart';

import '../controller/authctrls/otp.dart';
import '../controller/choosenumberctrl.dart';
import '../controller/insertPhoneController.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChooseNumberController());
    Get.lazyPut(() => OtpVerificationCtrl());
    Get.lazyPut(() => AuthCtrl(), fenix: true);

    Get.lazyPut(() => ProfileScreenController(), fenix: true);
    Get.lazyPut(() => InserPhoneController());
    Get.lazyPut(
      () => HomeScreenController(),
    );
    Get.lazyPut(
      () => SendPackageController(),
    );
    Get.lazyPut(
      () => InviteFamilyController(),
      fenix: true,
    );

    Get.lazyPut(
      () => RideCheckController(),
    );
    Get.lazyPut(() => TermsandReviewPrivacyController());
    Get.lazyPut(() => PickUpController(), fenix: true);
    Get.lazyPut(() => MapController(), fenix: true);

    Get.lazyPut(() => AccountSettingController(), fenix: true);
    Get.lazyPut(() => VerifyTripsController(), fenix: true);

    Get.lazyPut(() => EditAccountController(), fenix: true);
    Get.lazyPut(() => HelpController(), fenix: true);
  }
}
