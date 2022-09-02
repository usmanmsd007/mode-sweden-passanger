import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uber_ui/controller/profileScreenCtrl/profileScreenCtrl.dart';
import 'package:uber_ui/services/updateProfile/updateProfile.dart';

import '../../../controller/insertPhoneController.dart';
import '../../../public/public.dart';
import '../../../widgets/mywidgets.dart';

class SocialButtons extends StatelessWidget {
  SocialButtons({
    required this.path,
    required this.ontap,
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;
  String path;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.asset(
              path,
              height: 30,
              width: 30,
            ),
            SizedBox(
              width: Get.width / 15,
            ),
            TitleText(text: text)
          ],
        ),
      ),
    );
  }
}

class ProfileEmailWidget extends StatelessWidget {
  ProfileEmailWidget({
    Key? key,
    required this.text,
    required this.data,
    this.verified = false,
    required this.onpress,
    this.isPhone = true,
  }) : super(key: key);
  bool isPhone;
  bool verified;
  String text;
  VoidCallback onpress;
  String data;
  @override
  Widget build(BuildContext context) {
    printInfo(info: "this is country code: $data");
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: onpress,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontSize: 14,
                    color: grey5,
                  ),
                ),
              ),
              Row(
                children: [
                  if (isPhone)
                    Icon(
                      Icons.phone,
                      size: 35,
                    ),
                  Text(
                    data,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
            ],
          ),
        ),
        verified
            ? Text(
                'Verified',
                style: TextStyle(color: Colors.green),
              )
            : Text(
                'Not Verified',
                style: TextStyle(color: Colors.red),
              )
      ],
    );
  }
}

class ProfileTextFieldWidget extends StatelessWidget {
  ProfileTextFieldWidget({
    Key? key,
    required this.text,
    required this.ontap,
    required this.hint,
    this.isPassword = false,
  }) : super(key: key);
  bool isPassword;
  String hint;
  String text;
  VoidCallback ontap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Text(
            hint,
            style: TextStyle(
              fontSize: 14,
              color: grey5,
            ),
          ),
        ),
        TextFormField(
          obscureText: isPassword,
          readOnly: true,
          onTap: ontap,
          style: TextStyle(
            fontSize: 20,
            color: black,
          ),
          decoration: InputDecoration.collapsed(
            hintText: text,

            hintStyle: TextStyle(
              fontSize: 16,
              color: grey5,
            ),
            // hintStyle:
          ),
        ),
      ],
    );
  }
}

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          CircleAvatar(
            backgroundColor: Colors.black,
            radius: 50,
          ),
          Positioned(
              left: 5,
              bottom: 5,
              child: CircleAvatar(
                radius: 10,
                child: Icon(
                  Icons.edit_outlined,
                  color: Colors.white,
                  size: 15,
                ),
                backgroundColor: Colors.black,
              ))
        ],
      ),
    );
  }
}

class PasswordResetDialog extends StatelessWidget {
  PasswordResetDialog({Key? key}) : super(key: key);
  TextEditingController passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(onTap: () => Get.back(), child: Icon(arrow_back)),
              SizedBox(
                height: Get.height / 10,
              ),
              Text(
                'Enter a new Password',
                style: TextStyle(
                  fontSize: 14,
                  color: grey5,
                ),
              ),
              SizedBox(
                height: Get.height / 17,
              ),
              TextFormField(
                controller: passwordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: black, width: 5.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: black, width: 5.0)),
                  hintText: 'Enter a new Password',
                  suffixIcon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 17,
              ),
              Text(
                'Secure passwords are at least 8 characters long and include number and symbols.',
                style: TextStyle(color: grey5, fontSize: 16),
              ),
              SizedBox(
                height: Get.height / 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: Get.width - 50,
                      decoration: BoxDecoration(color: black),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'Update password',
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class ResetDialog extends StatelessWidget {
  TextEditingController ctrl = TextEditingController();
  ResetDialog({
    required this.i,
    Key? key,
    required this.firstName,
    required this.btnText,
    required this.text,
    required this.hint,
    this.lastName = '',
    this.isEmail = false,
  }) : super(key: key);
  int i;
  String firstName;
  String lastName;

  String text;
  String btnText;
  String hint;
  bool isEmail;
  @override
  Widget build(BuildContext context) {
    ctrl.text = text;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(arrow_back),
              SizedBox(
                height: Get.height / 10,
              ),
              Text(
                hint,
                style: TextStyle(
                  fontSize: 14,
                  color: grey5,
                ),
              ),
              SizedBox(
                height: Get.height / 17,
              ),
              TextFormField(
                // obscureText: true,
                controller: ctrl,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: black, width: 5.0)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: black, width: 5.0)),
                  hintText: isEmail ? 'name@example.com' : hint,
                ),
              ),
              SizedBox(
                height: Get.height / 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      var json;
                      if (i == 1) {
                        json = await UpdateProfile.updateFirstName(
                            firstName: ctrl.text);
                      }
                      if (i == 2) {
                        json = await UpdateProfile.updateLastName(
                            first_name: firstName, lastName: ctrl.text);
                      }
                      if (i == 3) {
                        printInfo(info: 'email is getting updates');
                        json = await UpdateProfile.updateEmail(
                            // last_name: lastName,
                            firstName: firstName,
                            email: ctrl.text);
                        printInfo(
                            info: 'well this is the json returned' +
                                json.toString());
                        printInfo(info: 'email ctrl text:' + ctrl.text);
                      }
                      printInfo(info: "response" + json.toString());
                      Future.delayed(Duration(seconds: 1));
                      Get.find<ProfileScreenController>().onInit();
                      Get.back();
                    },
                    child: Container(
                      width: Get.width - 50,
                      decoration: BoxDecoration(color: black),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          btnText,
                          style: TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                      alignment: Alignment.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class PhoneResetDialog extends StatelessWidget {
  PhoneResetDialog({
    Key? key,
    this.countryCode = '',
    this.phone = '',
    this.btnText = '',
    this.firstname = '',
    // required this.hint,
    // this.isEmail = false,
  }) : super(key: key);
  String btnText;
  TextEditingController phonectrl = TextEditingController();
  String countryCode;
  String phone;
  String firstname;
  // var ctrl = Get.find<InserPhoneController>();

  // String hint;
  // bool isEmail;
  @override
  Widget build(BuildContext context) {
    phonectrl.text = phone;
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 10, left: 15, right: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(arrow_back),
              SizedBox(
                height: Get.height / 10,
              ),
              Text(
                'Phone',
                style: TextStyle(
                  fontSize: 14,
                  color: grey5,
                ),
              ),
              SizedBox(
                height: Get.height / 17,
              ),
              Row(
                children: [
                  Expanded(
                      child: IntlPhoneField(
                    initialCountryCode: countryCode,
                    // initialValue: phonectrl.text,
                    controller: phonectrl,
                    invalidNumberMessage: "Please provide all the digits",
                    autovalidateMode: AutovalidateMode.disabled,
                    onCountryChanged: (c) {
                      this.countryCode = "+" + c.dialCode;
                    },
                  ))
                ],
              ),
              SizedBox(
                height: Get.height / 14,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () async {
                      await UpdateProfile.updatePhone(
                              first_name: firstname,
                              phoneNo: phonectrl.text,
                              countryCode: countryCode)
                          .whenComplete(() {
                        Get.find<ProfileScreenController>().onInit();

                        Get.back();
                      });
                    },
                    child: Container(
                      width: Get.width - 50,
                      decoration: const BoxDecoration(color: black),
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          btnText,
                          style: const TextStyle(color: white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
