import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/termsandreviewprivacycontroller.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/location%20reminder/location_reminder.dart';

import '../../widgets/mywidgets.dart';

class TermsAndReviewPrivacyNotice extends StatelessWidget {
  TermsAndReviewPrivacyNotice({Key? key}) : super(key: key);
  var ctrl = Get.find<TermsandReviewPrivacyController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyFAB(
          text: "Next",
          onpress: () {
            Get.to(() => LocationReminder());
          },
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Icon(
                      Icons.receipt_rounded,
                      size: 70,
                    ),
                  ),
                  Expanded(
                    child: HeadingText1(
                      text: 'Accept Mode\'s Terms & Review Privacy Notice',
                      color: black,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                  'By Selecting \'I Agree\' below, I have reviewed and agree to the Terms of Use and acknowledge the Privacy Notice. I am at least 18 years of age',
                  overflow: TextOverflow.clip),
              SizedBox(
                height: Get.height / 2.3,
              ),
              Column(
                children: [
                  Divider(
                    height: 1.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'I agree',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Obx(() => Checkbox(
                          value: ctrl.checked.value,
                          onChanged: (v) {
                            ctrl.setChecked(v!);
                          }))
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
