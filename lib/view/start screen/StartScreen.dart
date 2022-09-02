import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/authScreens/registerScreen.dart';
import 'package:uber_ui/view/authScreens/sign_in_screen.dart';
import 'package:uber_ui/view/choosephone/choosePhone.dart';
import 'package:uber_ui/view/insert%20phone%20number/InsertPhoneNumber.dart';
import 'package:uber_ui/view/start%20screen/loadingScreen.dart';

import '../../widgets/mywidgets.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, bottom: 20, top: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: Get.height / 1.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Mode',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.drive_eta,
                        color: Colors.black,
                        size: 100,
                      ),
                      Text('Move with safety',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black))
                    ],
                  ),
                ),
                MainButton(
                  hasIcon: true,
                  color: blue,
                  text: 'Get started',
                  onpress: () {
                    // Get.to(() => RegisterScreen());
                    // ChooseNumberBinding().dependencies();
                    Get.to(
                      () => SignInScreen(),
                    );
                  },
                )
              ]),
        ),
      ),
    );
  }
}
