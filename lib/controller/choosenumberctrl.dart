import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/home_screen_controller.dart';
import 'package:uber_ui/view/insert%20phone%20number/InsertPhoneNumber.dart';

import '../view/choosephone/widgets/choosenumberalertdialog.dart';

class ChooseNumberController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onInit
    super.onReady();
    HomeScreenController();
    Get.dialog(ChooseNumberAlertDialog());
  }
}
