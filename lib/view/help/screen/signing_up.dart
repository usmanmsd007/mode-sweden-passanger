import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../public/public.dart';
import '../../../widgets/mywidgets.dart';

class Signing_UP extends StatelessWidget {
  const Signing_UP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          backgroundColor: yellow,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              arrow_back,
              color: black,
            ),
          ),
          expandedHeight: Get.height / 8,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text(
              'Signing up',
              style: TextStyle(color: black),
            ),
          ),
          pinned: true,
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10.0, right: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height / 10,
                  ),
                  TitleText(text: 'Signing up'),
                  SizedBox(
                    height: Get.height / 15,
                  ),
                  Text(
                      'Creating a Mode account requires a valid email address and phone number. You\'ll also need to create a password and agree to terms and conditions and our privacy notice.'),
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Text(
                      'Fill in your first and last name, phone number, and preferred language. Once you complete this part of the signup process, we send a text SMS to verify your phone number.'),
                  SizedBox(
                    height: Get.height / 20,
                  ),
                  Text(
                      'After you provide this info, we\'ll send an email to confirm your account registration. Once you confirm, you\'ll be able to use your app to request a ride.')
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
