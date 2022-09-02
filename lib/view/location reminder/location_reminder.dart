import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/view/discount%20screen/discountscreen.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class LocationReminder extends StatelessWidget {
  const LocationReminder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton:
          Smallfab(onpress: () => Get.to(() => DiscountScreenReminder())),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  radius: 70,
                  child: Icon(
                    Icons.location_city_outlined,
                    size: 70,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: Get.height / 5,
            ),
            const Text('Get moving faster with Mode',
                style: TextStyle(fontSize: 18, color: Colors.black45)),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'For a reliable trip, Uber collects location data from the time you open the app untilla trip ends. This improves pick-ups, support and more.',
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black38,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Learn more',
                style: TextStyle(
                    // fontSize: 18
                    color: Colors.blue))
          ],
        ),
      ),
    );
  }
}
