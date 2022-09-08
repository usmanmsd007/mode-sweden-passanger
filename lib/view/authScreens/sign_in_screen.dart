import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/view/authScreens/registerScreen.dart';
import 'package:uber_ui/view/insert%20phone%20number/InsertPhoneNumber.dart';

import '../../controller/authctrls/authCtrl.dart';
import '../../public/public.dart';
import '../../widgets/mywidgets.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  var authctrl = Get.find<AuthCtrl>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: Get.height / 50, horizontal: Get.width / 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: Get.height / 10,
              ),
              const Text(
                'Sign In to Mode',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              const Text(
                'Please provide the follwing information.',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black),
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              MyTextField(
                hint: 'Email',
                ctrl: authctrl.emailCtrlSi,
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              MyTextField(
                ctrl: authctrl.passwordCtrlSi,
                hint: 'Password',
                isPassowrd: true,
              ),
              SizedBox(height: Get.height / 40),
              MainButton(
                color: blue,
                text: 'Sign In',
                onpress: () async {
                  await authctrl.getDeviceData().whenComplete(() async {
                    await authctrl.signInToMode(
                        device_id: authctrl.deviceid,
                        device_token: authctrl.devicetoken,
                        device_type: authctrl.deviceType,
                        email: authctrl.emailCtrlSi.text,
                        password: authctrl.passwordCtrlSi.text);
                  });
                },
              ),
              SizedBox(
                height: Get.height / 50,
              ),
              MainButton(
                color: blue,
                text: 'Register',
                onpress: () async {
                  Get.to(InsertPhoneNumber());
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
