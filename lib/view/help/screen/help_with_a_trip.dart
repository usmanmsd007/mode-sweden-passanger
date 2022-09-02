import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class HelpWithTrip extends StatelessWidget {
  const HelpWithTrip({Key? key}) : super(key: key);

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
              'Choose a trip',
              style: TextStyle(color: black),
            ),
          ),
          pinned: true,
        ),
        SliverFillRemaining(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'You haven\'t taken a trip yet.',
                style: TextStyle(fontSize: 16),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: Get.width / 2.5,
                  child: MainButton(
                    color: blue,
                    onpress: () {},
                    text: 'Retry',
                    hasborder: true,
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    ));
  }
}
