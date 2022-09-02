import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';

import '../../insert phone number/InsertPhoneNumber.dart';

class ChooseNumberAlertDialog extends StatelessWidget {
  const ChooseNumberAlertDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Continue with',

              // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                2,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    // minVerticalPadding: 10,
                    onTap: () {
                      // InsertNumberBinding().dependencies();
                      Get.to(() => InsertPhoneNumber());
                    },
                    leading: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      radius: 25,
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    title: Text('03068303757'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'NONE OF THE ABOVE',
              style: TextStyle(
                fontSize: 15,
                // fontWeight: FontWeight.bold,
                color: black,
              ),
            )
          ]),
    );
  }
}
