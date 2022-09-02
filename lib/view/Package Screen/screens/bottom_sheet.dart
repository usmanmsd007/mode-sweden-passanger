import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class WhatToSendBottomSheet extends StatelessWidget {
  const WhatToSendBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HeadingText1(text: 'Package guidelines', color: black),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10.0),
                  child: Text(
                    'For a successful deliery, make sure your package is:',
                    overflow: TextOverflow.clip,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                BulletText(
                  text: ' 15 kg or less',
                ),
                BulletText(
                  text: ' PKR 3000 or less in value',
                ),
                BulletText(
                  text: ' Securely sealed and ready for pick-up',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6.0),
                  child: TitleText(text: 'Prohibited items', color: black),
                ),
                const Text(
                  'Alcohol, medication, recreational drugs, firearms, and dangerous or illegal items. Violations may be reported to authorities.',
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                MainButton(
                    color: grey5,
                    onpress: () {},
                    text: 'See all prohibited items'),
                SizedBox(
                  height: 5,
                ),
                MainButton(
                  color: blue,
                  onpress: () {
                    Get.back();
                  },
                  text: 'OK',
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class BulletText extends StatelessWidget {
  BulletText({
    required this.text,
    Key? key,
  }) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 3.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyBullet(),
          Expanded(
            child: Text(
              text,
              overflow: TextOverflow.clip,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}

class MyBullet extends StatelessWidget {
  const MyBullet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
