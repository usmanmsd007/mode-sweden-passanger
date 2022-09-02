import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/model/countries.dart';

class InserPhoneController extends GetxController {
  var selectedCountry = Icon(Icons.flag).obs;

  List<Icon> countries = [
    Icon(Icons.flag),
    Icon(Icons.countertops),
    Icon(Icons.face),
    Icon(Icons.yard_outlined),
    Icon(Icons.child_friendly_sharp),
  ];

  void setSelectedCountry(Icon? value) {
    selectedCountry.value = value!;
    update();
  }
}
