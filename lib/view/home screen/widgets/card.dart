import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeToModeCard extends StatelessWidget {
  const WelcomeToModeCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.purple.shade50,
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'Welcome to Mode!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.arrow_forward,
                  color: Colors.black,
                  size: 25,
                )
              ],
            ),
          ),
          Container(
              // height: Get.height / 6,
              // width: Get.width / ,
              child: ClipRRect(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            child: Image.asset(
              'assets/drive.jpg',
              fit: BoxFit.cover,
              height: 80,
              width: Get.width / 5,
            ),
          ))
        ],
      ),
    );
  }
}
