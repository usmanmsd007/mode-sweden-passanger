import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyBottomSheet extends StatelessWidget {
  const MyBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (c) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Schedule a trip',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 23,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Text(
                'Sat 25 Jun',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Divider(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              // child: Text('Sat 25 Jun'),
              child: Text(
                'Sat 25 Jun',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, bottom: 40),
              child: Divider(),
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5), color: Colors.black),
              width: Get.width - 30,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Set pick-up time',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
