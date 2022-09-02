import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/view/home%20screen/home_screen.dart';

import '../../widgets/mywidgets.dart';

class DiscountScreenReminder extends StatelessWidget {
  const DiscountScreenReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Smallfab(onpress: () {
        Get.to(() => HomeScreen());
      }),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.message_sharp,
                  size: 120,
                ),
              ],
            ),
            SizedBox(
              height: Get.height / 5,
            ),
            const Text('Receive Mode\'s discounts and news',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Mode would like to share special offers, recommendations and product updates. To opt out of promotional messages, you can click the link below or manage your privacy settings in the app at any time.',
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Unsubscribe',
                style: TextStyle(
                    // fontSize: 18
                    color: Colors.blue))
          ],
        ),
      ),
    );
  }
}
