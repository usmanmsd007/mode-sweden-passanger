import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_ui/binding/bindings.dart';
import 'package:uber_ui/firebase_options.dart';
import 'package:uber_ui/view/Package%20Screen/screens/send_pkg_details.dart';
import 'package:uber_ui/view/accountsetting/accountsetting.dart';
import 'package:uber_ui/view/accountsetting/familycontacts.dart';
import 'package:uber_ui/view/accountsetting/ride_check.dart';
import 'package:uber_ui/view/accountsetting/verify_trip.dart';
import 'package:uber_ui/view/authScreens/registerScreen.dart';
import 'package:uber_ui/view/authScreens/sign_in_screen.dart';
import 'package:uber_ui/view/choosePlace/choosePlace.dart';
import 'package:uber_ui/view/edit_account/edit_account.dart';
import 'package:uber_ui/view/edit_account/widgets/edit_accountwidgets.dart';
import 'package:uber_ui/view/help/helpScreen.dart';
import 'package:uber_ui/view/insert%20phone%20number/InsertPhoneNumber.dart';
import 'package:uber_ui/view/pickup%20points/mapScreen.dart';
import 'package:uber_ui/view/pickup%20points/pickuppoint.dart';
import 'package:uber_ui/view/profile/profile.dart';
import 'package:uber_ui/view/start%20screen/StartScreen.dart';
import 'package:uber_ui/view/choosephone/choosePhone.dart';
import 'package:uber_ui/view/start%20screen/loadingScreen.dart';
import 'package:uber_ui/view/terms%20and%20privacy%20screen/termsandreviewprivacynotice.dart';

import 'controller/authctrls/authCtrl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  MyBindings().dependencies();
  var authctrl = Get.find<AuthCtrl>();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: [
        GetPage(
          name: '/edit_account',
          page: () => EditAccount(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/choosephone',
          page: () => ChoosePhoneNumber(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/signinscreen',
          page: () => SignInScreen(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/registerScreen',
          page: () => RegisterScreen(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/accountSetting',
          page: () => AccountSetting(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/editAccountScreen',
          page: () => EditAccount(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/phoneresetdialog',
          page: () => PhoneResetDialog(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/phoneresetdialog',
          page: () => HelpScreen(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/invitefamily',
          page: () => FamilyContacts(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/ridecheck',
          page: () => RideCheck(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/verify_trip',
          page: () => VerifyTrip(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/termsandprivacy',
          page: () => TermsAndReviewPrivacyNotice(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/profScreen',
          page: () => ProfileWidget(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/insertphone',
          page: () => InsertPhoneNumber(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/mapscreen',
          page: () => MapScreen(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/accountsetting',
          page: () => AccountSetting(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/pickuppoint',
          page: () => PickUpPoint(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/chooseplaces',
          page: () => ChoosePlace(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/sendpackages',
          page: () => SendPackageDetails(),
          binding: MyBindings(),
        ),
        GetPage(
          name: '/loadingScreen',
          page: () => LoadingScreen(),
          binding: MyBindings(),
        ),
      ],
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}
