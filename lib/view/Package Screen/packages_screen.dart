import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/Package%20Screen/screens/bottom_sheet.dart';
import 'package:uber_ui/view/Package%20Screen/screens/send_pkg_details.dart';
import 'package:uber_ui/view/Package%20Screen/widgets/package_screen_widgets.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class PackagesScreen extends StatelessWidget {
  const PackagesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/packages_illustration.png',
                height: 250,
                fit: BoxFit.fitHeight,
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundColor: yellow,
                    radius: 25,
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        arrow_back,
                        color: black,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: WhatToSendButton(
                  onpress: () => Get.bottomSheet(
                    BottomSheet(
                      onClosing: () {},
                      builder: (c) => WhatToSendBottomSheet(),
                    ),
                    isScrollControlled: true,
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Send packages with connect',
                  style: TextStyle(
                      fontSize: 33, fontWeight: FontWeight.w500, color: black),
                ),
                SizedBox(
                  height: 20,
                ),
                TitleText(
                  text: 'Get it delivered in the time it takes to drive there',
                  color: Colors.black,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                MainButton(
                  color: blue,
                  onpress: () {
                    Get.to(() => SendPackageDetails());
                  },
                  text: 'Send Packages',
                ),
                SizedBox(
                  height: 10,
                ),
                MainButton(
                  color: grey5,
                  onpress: () {
                    Get.to(() => SendPackageDetails());
                  },
                  text: 'Receive Packages',
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
