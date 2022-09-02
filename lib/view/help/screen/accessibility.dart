import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../public/public.dart';
import '../../../widgets/mywidgets.dart';

class AccessibilityatMode extends StatelessWidget {
  const AccessibilityatMode({Key? key}) : super(key: key);

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
                'Accessibility',
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
                    TitleText(text: 'Accessibility at Mode'),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    Text(
                        'State and federal laws prohibit discrimination against individuals with disabilities, including those accompanied by service animals. Partners using the Uber app agree to follow all applicable laws and Uber\'s policies, which state that partners may not deny service to or otherwise discriminate against riders with disabilities.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                        'Any report of unlawful discrimination or ride refusal may result in temporarily deactivating a driver\'s account while we review the incident.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                        'Additionally, partners are expected to assist riders using walkers, canes, folding wheelchairs, or other assistive devices to the maximum extent possible.')
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
