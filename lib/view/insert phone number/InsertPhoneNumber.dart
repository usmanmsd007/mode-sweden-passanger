import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/authScreens/sign_in_screen.dart';

import '../../controller/authctrls/authCtrl.dart';
import '../../widgets/mywidgets.dart';

class InsertPhoneNumber extends StatelessWidget {
  InsertPhoneNumber({Key? key}) : super(key: key);
  var authctrl = Get.find<AuthCtrl>();
  // var ctrl = Get.find<InserPhoneController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleText(
                  text: "Enter your mobile number",
                  color: black,
                ),
                const SizedBox(
                  height: 10,
                ),
                IntlPhoneField(
                  controller: authctrl.phoneCtrl,
                  initialCountryCode: ' +92',
                  decoration: InputDecoration(
                    hintText: 'Phone number',
                    filled: true,
                    fillColor: Colors.grey.shade300,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: black),
                    ),
                  ),
                  onChanged: (phone) {},
                  validator: (s) {},
                  onCountryChanged: (country) {
                    authctrl.country = country.code;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                MainButton(
                  color: blue,
                  hasIcon: true,
                  text: 'Next',
                  onpress: () {
                    authctrl.sendOtpCode(
                      phone: authctrl.phoneCtrl.text,
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'By proceeding, you consent to get calls, WhatsApp or SMS messages, including by automated means, from Mode and its affiliates to the number provided.',
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 15,
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: new Container(
                                margin:
                                    const EdgeInsets.only(left: 0, right: 15.0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                          Text("or"),
                          Expanded(
                            child: new Container(
                                margin:
                                    const EdgeInsets.only(left: 15.0, right: 0),
                                child: Divider(
                                  color: Colors.black,
                                  height: 50,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                MainButton(
                  color: black,
                  hasIcon: true,
                  text: 'Sign In',
                  onpress: () {
                    Get.to(
                      () => SignInScreen(),
                    );
                  },
                ),
                // AuthButton(
                //     onpress: () {},
                //     text: 'Continue with Facebook',
                //     icon: "assets/fbicon.png"),
                // AuthButton(
                //     onpress: () {},
                //     text: 'Continue with Google',
                //     icon: "assets/googleicon.png")
              ],
            ),
            SizedBox(
              height: Get.height / 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'This site is protected by reCAPTCHA and the Google Privacy ',
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  'Policy and Terms of Services apple',
                  style: TextStyle(fontSize: 12),
                )
              ],
            )
          ]),
        ),
      ),
    ));
  }
}
