import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountSettingController extends GetxController {
  List safetysubtitle = [
    'share your trip status with family and friends with a single tap',
    'Use a PIN to make sure you getin the right car',
    'Manage your RideCheck notifications'
  ];

  List<String> safety = [
    'Manage trusted contacts',
    'Verify your trip',
    'RideCheck',
  ];
  List<String> favourites = [
    'Add home',
    'Add Work',
  ];

  List favouriteicons = [
    Icons.home,
    Icons.today_outlined,
    // Icons.masks_outlined
  ];

  List safetyicons = [
    Icons.person_search,
    Icons.dialpad_outlined,
    Icons.masks_outlined
  ];

  List family = [
    'Set up your family',
    'Security',
  ];
  List familysubs = [
    'Pay for your loved ones and get trip notifications',
    'Control your account security with 2-step verification',
  ];
}
