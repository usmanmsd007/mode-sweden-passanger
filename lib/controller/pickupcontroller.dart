import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickUpController extends GetxController {
  RxBool timelineIcon = false.obs;
  void setTimelineIcon(bool v) {
    timelineIcon.value = v;
    update();
  }

  List<String> places = [
    'Peshawar',
    'Motorway',
    'Islamabad',
    'Savour Foods',
    '6th Road',
    'Shamsabaad'
  ];
  var length = 0.obs;
  void updateLength() {
    length.value++;
    update();
  }

  var showListofPlace = false.obs;
  setListofPlaces(bool v) {
    showListofPlace.value = v;
    update();
  }

  void showBottomSheetWithPlaces(bool bool) {
    Get.bottomSheet(
        BottomSheet(
          clipBehavior: Clip.none,
          onClosing: () {},
          builder: (v) {
            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.location_on),
                title: Text(
                  places[index],
                ),
              ),
            );
          },
        ),
        clipBehavior: Clip.none,
        persistent: true);
  }
}
