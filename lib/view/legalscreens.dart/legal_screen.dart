import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/view/legalscreens.dart/privacy_policy.dart';
import 'package:uber_ui/view/legalscreens.dart/software_license.dart';
import 'package:uber_ui/view/legalscreens.dart/termsandconditions.dart';

import '../../public/public.dart';
import '../../widgets/mywidgets.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({Key? key}) : super(key: key);

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
              'Legal',
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
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: InkWell(
                      onTap: () => Get.to(
                        () => TermsAndConditionsScreen(),
                      ),
                      child: Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => SoftwareLicense()),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Software License',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.to(() => PrivacyPolicy()),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    ));
  }
}
