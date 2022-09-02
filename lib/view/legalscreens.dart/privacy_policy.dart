import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../public/public.dart';
import '../../widgets/mywidgets.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
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
                'Privacy Policy',
                style: TextStyle(
                  color: black,
                ),
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
                    TitleText(text: 'Introduction'),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    Text(
                      'When you use Uber, you trust us with your personal data. We’re committed to keeping that trust. That starts with helping you understand our privacy practices.'
                      'This notice describes the personal data we collect, how it’s used and shared, and your choices regarding this data. We recommend that you read this along with our privacy overview, which highlights key points about our privacy practices',
                    ),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    TitleText(text: 'OverView'),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    Text(
                        'his notice applies to users of Uber’s services anywhere in the world, including users of Uber’s apps, websites, features, or other services. This notice describes how Uber and its affiliates collect and use personal data. This notice applies to all users of our apps, websites, features, or other services anywhere in the world, unless covered by a separate privacy notice, such as the Uber Freight Privacy Notice or Careem Privacy Policy.'),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                        'This notice also governs Uber’s other collections of personal data in connection with its services. For example, we may collect the contact information of individuals who use accounts owned by Uber for Business customers, or of owners or employees of restaurants or other merchants; personal data of those who start but do not complete applications to be drivers or delivery persons; or other personal data in connection with our mapping technology and features.')
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
