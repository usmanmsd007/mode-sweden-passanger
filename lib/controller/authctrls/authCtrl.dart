import 'dart:io';
// import 'dart:js';
import 'package:firebase_messaging/firebase_messaging.dart' as messaging;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber_ui/controller/storagectrl/storageCtrl.dart';
import 'package:uber_ui/model/otpresponse.dart';
import 'package:http/http.dart' as http;
import 'package:uber_ui/model/signInResponse.dart';
import 'package:uber_ui/services/auth/codeverification.dart';
import 'package:uber_ui/services/auth/sendotp.dart';
import 'package:uber_ui/services/services.dart';
import 'package:uber_ui/view/authScreens/registerScreen.dart';
import 'package:uber_ui/view/authScreens/sign_in_screen.dart';
import 'package:uber_ui/view/code%20verification/codeverificationScreen.dart';
import 'package:uber_ui/view/home%20screen/home_screen.dart';
import 'package:uber_ui/view/insert%20phone%20number/InsertPhoneNumber.dart';
import 'package:uber_ui/view/start%20screen/StartScreen.dart';
// import 'package:uber_ui/model/countries.dart';

class AuthCtrl extends GetxController {
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    int a = 10;
    SignInResponse response = await StorageController.getSignInCredentials();
    if
        // (a == 10) {
        (response.toString().length == 0) {
      Get.to(() => StartScreen());
    } else {
      signInToMode(email: response.email, password: response.password);
      // Get.to(HomeScreen());
    }
    await getDeviceData();
  }

  bool onediting = false;
  setonediting(v) {
    onediting = v;
    // update();
  }

  TextEditingController emailCtrlSi = TextEditingController();
  TextEditingController passwordCtrlSi = TextEditingController();

  String country = '+92';
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNmaeCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  String deviceType = '';
  String deviceid = '';
  String devicetoken = '';
  SignInResponse signInModel =
      SignInResponse(password: '', email: '', accessToken: '');

  signInToMode({required String email, required String password}) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 1));
    String id = preferences.getString('id')!;
    printInfo(info: 'this is the id of the User $id');

    var json = await signIn(username: email, password: password, id: id);
    bool hasToken = json.containsKey('access_token') ?? false;
    if (hasToken) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString('token', json['access_token']);
      preferences.setString('email', email);
      preferences.setString('password', password);

      Get.to(() => HomeScreen());
    } else {
      Get.snackbar('Error', json['message']);
    }
  }

  register(
      {
      // required String phone,
      required String firstName,
      required String last_Name,
      required String email,
      required String id,
      required String password}) async {
    bool registered = await signUp(
        id: id,
        device_id: deviceid,
        device_token: devicetoken,
        device_type: deviceType,
        login_by: 'manual',
        first_name: firstName,
        last_name: last_Name,
        email: email,
        // country_code: country,
        password: password);
    if (registered) {
      printInfo(info: 'registered');
      Get.to(() => SignInScreen());
    } else {
      printInfo(info: 'not registered');
    }
  }

  getDeviceData() async {
    var token = await messaging.FirebaseMessaging.instance.getToken();
    print(token);

    if (Platform.isAndroid) {
      deviceType = 'android';
      final deviceInfo = await PlatformDeviceId.getDeviceId;
      // device_id
      deviceid = deviceInfo!;

      devicetoken = token ?? "";
    } else {
      deviceType = 'ios';
      final deviceInfo = await PlatformDeviceId.getDeviceId;
      deviceid = deviceInfo ?? "";
      devicetoken = token ?? "";
    }
  }

  disposeRegisterController() {
    emailCtrl.dispose();
    firstNameCtrl.dispose();
    lastNmaeCtrl.dispose();
    passwordCtrl.dispose();
    phoneCtrl.dispose();
  }

  disposeSignInController() {
    emailCtrlSi.dispose();
    passwordCtrlSi.dispose();
  }

  void sendOtpCode({
    required String phone,
  }) async {
    var response = await sendOtp(
        devicetype: deviceType,
        deviceId: deviceid,
        deviceToken: devicetoken,
        phone: phone,
        countryCode: country);
    printInfo(info: response.toString());
    if (response['status'] == true) {
      var prefs = await SharedPreferences.getInstance();
      int i = response['user']['id'];

      await prefs.setString('id', i.toString());
      printInfo(info: i.toString());
      // printInfo(info: prefs.getInt('id')!.toString());
      // isPasswordsent.value = false;
      Get.to(CodeVerification(), arguments: {
        'phone': phone,
        'id': OtpResponse.fromMap(response).user.id
      });
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        title: "Failure",
        message: 'there was an error',
      ));
    }
  }

  RxBool otpVerified = false.obs;
  verifyOtp(String otp, int id) async {
    var data = await verifyOTP(otp: '123456', id: id);
    printInfo(info: 'date' + data.toString());
    if (data['status'] == true) {
      otpVerified.value = true;
    }
    otpVerified.value = true;
    update();
  }

  RxString code = ''.obs;
  setCode(String cod) {
    code.value = cod;
    update();
  }

  void signout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    bool a = await preferences.clear();
    if (a) {
      Get.offAll(StartScreen());
    }
  }
}
