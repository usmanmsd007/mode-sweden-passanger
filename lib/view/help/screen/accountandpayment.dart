import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

import '../../../public/public.dart';

class AccountAndPayment extends StatelessWidget {
  const AccountAndPayment({Key? key}) : super(key: key);

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
              'Account & Payment',
              style: TextStyle(color: black),
            ),
          ),
          pinned: true,
        ),
        SliverFillRemaining(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 10.0, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: Get.height / 10,
                ),
                TitleText(text: 'Paying with Cash'),
                SizedBox(
                  height: Get.height / 15,
                ),
                Text(
                    'Mode is designed to be working with cash experience in most places.'),
                SizedBox(
                  height: Get.height / 20,
                ),
                Text(
                    'When a trip ends, the rider is supposed to pay the money in cash to the driver specified by Mode.')
              ],
            ),
          ),
        )
      ]),
    ));
  }
}
