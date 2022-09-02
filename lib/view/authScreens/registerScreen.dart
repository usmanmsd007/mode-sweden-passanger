import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber_ui/controller/authctrls/authCtrl.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var authctrl = Get.find<AuthCtrl>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'Register with Mode',
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
                hint: 'First Name',
                ctrl: authctrl.firstNameCtrl,
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              MyTextField(
                hint: 'Last Name',
                ctrl: authctrl.lastNmaeCtrl,
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              MyTextField(
                hint: 'Email',
                ctrl: authctrl.emailCtrl,
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              MyTextField(
                ctrl: authctrl.passwordCtrl,
                hint: 'Password',
                isPassowrd: true,
              ),
              SizedBox(height: Get.height / 40),
              ElevatedButton(
                  onPressed: () async {
                    var prefs = await SharedPreferences.getInstance();
                    Future.delayed(Duration(seconds: 1));

                    String id = prefs.getString('id')!;
                    // authctrl.getDeviceData();
                    // Future.delayed(Duration(seconds: 1));
                    await authctrl.register(
                        id: id,
                        // phone: authctrl.phoneCtrl.text,
                        firstName: authctrl.firstNameCtrl.text,
                        last_Name: authctrl.lastNmaeCtrl.text,
                        email: authctrl.emailCtrl.text,
                        password: authctrl.passwordCtrl.text);
                  },
                  child: Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}
