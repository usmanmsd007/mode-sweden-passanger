import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/terms%20and%20privacy%20screen/termsandreviewprivacynotice.dart';

import '../../widgets/mywidgets.dart';

class InputName extends StatelessWidget {
  const InputName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: MyFAB(
            text: 'Next',
            onpress: () {
              Get.to(() => TermsAndReviewPrivacyNotice());
            },
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TitleText(
                  text: "What's your name?",
                  color: black,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Let us know how to properly address you"),
                SizedBox(
                  height: 10,
                ),
                // MyTextField(hint: 'Please enter first name'),
                // SizedBox(
                //   height: 10,
                // ),
                // MyTextField(hint: 'Please enter surname'),
              ],
            ),
          )),
    );
  }
}
