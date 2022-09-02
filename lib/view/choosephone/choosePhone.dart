import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/choosenumberctrl.dart';

class ChoosePhoneNumber extends StatelessWidget {
  ChoosePhoneNumber({Key? key}) : super(key: key);
  var ctrl = Get.find<ChooseNumberController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Colors.white,
          width: Get.width,
          height: Get.height,
        ),
      ),
    );
  }
}
