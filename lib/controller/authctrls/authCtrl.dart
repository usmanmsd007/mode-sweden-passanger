import 'dart:io';
// import 'dart:js';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as messaging;

// import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber_ui/controller/storagectrl/storageCtrl.dart';
import 'package:uber_ui/model/signInResponse.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/services/services.dart';
import 'package:uber_ui/view/authScreens/sign_in_screen.dart';
import 'package:uber_ui/view/home%20screen/home_screen.dart';
import 'package:uber_ui/view/start%20screen/StartScreen.dart';
// import 'package:uber_ui/model/countries.dart';

class AuthCtrl extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    SignInResponse response = await StorageController.getSignInCredentials();
    if (response.toString().length == 0) {
      Get.to(() => StartScreen());
    } else {
      await getDeviceData().whenComplete(
        () async {
          await signInToMode(
            device_id: deviceid,
            device_token: devicetoken,
            device_type: deviceType,
            email: response.email,
            password: response.password,
          );
        },
      );
    }
  }

  TextEditingController emailCtrlSi = TextEditingController();
  TextEditingController passwordCtrlSi = TextEditingController();

  TextEditingController firstNameCtrl = TextEditingController();
  TextEditingController lastNmaeCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();

  SignInResponse signInModel =
      SignInResponse(password: '', email: '', accessToken: '');
  String deviceType = '';
  String deviceid = '';
  String devicetoken = '';

  Future getDeviceData() async {
    var token;
    try {
      token = await messaging.FirebaseMessaging.instance.getToken();
    } catch (e) {
      // var token = await messaging.FirebaseMessaging.instance.getToken();

      print(e);
    } finally {}

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

  signInToMode({
    required String email,
    required String password,
    required String device_token,
    required String device_id,
    required String device_type,
  }) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 1));

    var json = await signIn(
      device_id: device_id,
      device_token: device_token,
      device_type: device_type,
      username: email,
      password: password,
    );
    bool hasToken = json.containsKey(ACCESSTOKEN) ?? false;
    if (hasToken) {
      preferences.setString(ACCESSTOKEN, json['access_token']);
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

  disposeRegisterController() {
    emailCtrl.dispose();
    firstNameCtrl.dispose();
    lastNmaeCtrl.dispose();
    passwordCtrl.dispose();
  }

  disposeSignInController() {
    emailCtrlSi.dispose();
    passwordCtrlSi.dispose();
  }

  void signout() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    bool a = await preferences.clear();
    if (a) {
      Get.offAll(StartScreen());
    }
  }
}
