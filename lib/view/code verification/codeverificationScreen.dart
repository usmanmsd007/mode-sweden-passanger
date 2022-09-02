import 'package:flutter/material.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
// import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/authScreens/registerScreen.dart';
import 'package:uber_ui/view/code%20verification/widgets/digitBox.dart';
import 'package:uber_ui/view/input%20name/input_name.dart';
import '../../controller/authctrls/authCtrl.dart';
import '../../widgets/mywidgets.dart';

class CodeVerification extends StatelessWidget {
  CodeVerification({Key? key}) : super(key: key);
  var authctrl = Get.find<AuthCtrl>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Obx(
          () => authctrl.otpVerified.value == true
              ? MyFAB(
                  text: "Next",
                  onpress: () {
                    // authctrl.verifyOtp(
                    //     authctrl.code.value, Get.arguments['id']);
                    if (authctrl.otpVerified.value) {
                      Get.to(() => RegisterScreen());
                    }
                    // Get.to(() => RegisterScreen());
                  })
              : MyFAB(
                  text: "Next",
                  onpress: () {
                    // Get.to(() => RegisterScreen());
                  }),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleText(
                  color: black,
                  text:
                      'Enter the 6-digit code sent to you at ${authctrl.country}${Get.arguments['phone']}.'),
              const SizedBox(
                height: 10,
              ),
              // Obx(
              // () =>
              VerificationCode(
                  onCompleted: (code) {
                    if (code.length == 6) {
                      authctrl.verifyOtp(code, Get.arguments['id'] as int);
                      authctrl.setCode(code);
                      // authctrl.verifyOtp(code, Get.arguments['id']);
                      FocusScope.of(context).unfocus();
                    }
                  },
                  digitsOnly: true,
                  keyboardType: TextInputType.number,
                  length: 6,
                  itemSize: Get.width * 0.1,
                  onEditing: (v) {
                    authctrl.setonediting(v);
                    if (authctrl.onediting) FocusScope.of(context).unfocus();
                  }),
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.start,
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisSize: MainAxisSize.min,
              //   children: List.generate(
              //       6,
              //       (index) =>
              //           DigitBox(ctrl: authctrl.codeVerificationDigits[index])),
              // ),
              const SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(20)),
                width: Get.width / 1.5,
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'I haven\'t received the code(0:09)',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
