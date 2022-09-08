import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart' as messaging;
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/otpresponse.dart';
import '../../services/auth/codeverification.dart';
import '../../services/auth/sendotp.dart';
import '../../view/code verification/codeverificationScreen.dart';

class OtpVerificationCtrl extends GetxController {
  TextEditingController phoneCtrl = TextEditingController();

  String country = '+92';

  bool onediting = false;
  setonediting(v) {
    onediting = v;
    // update();
  }

  void sendOtpCode({
    required String devicetoken,
    required String devType,
    required String devId,
    required String phone,
  }) async {
    var response = await sendOtp(
        devicetype: devType,
        deviceId: devId,
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
}
