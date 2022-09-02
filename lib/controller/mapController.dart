import 'dart:async';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await initialize().whenComplete(() => setNewPosition());
  }

  void setNewPosition() async {
    Future.delayed(Duration(seconds: 4));
    await getoMyLocation();
  }

  Location location = new Location();
  LocationData? _locationData;
  bool? _serviceEnabled;
  PermissionStatus? _permissionGranted;
  Future<void> initialize() async {
    // LocationData? _locationData;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled!) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled!) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    update();
  }

  CameraPosition getDetails(
      {double? lat = 37.42796133580664, double? lon = -122.085749655962}) {
    printInfo(info: lat.toString());
    printInfo(info: lon.toString());

    return CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(lat!, lon!),
        tilt: 59.777777799143555,
        zoom: 19.151926048888888);
  }

  Completer<GoogleMapController> controller = Completer();

  Rx<CameraPosition> kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  ).obs;

  Future<void> getoMyLocation() async {
    final GoogleMapController mycontroller = await controller.future;
    mycontroller.animateCamera(CameraUpdate.newCameraPosition(
        getDetails(lon: _locationData!.longitude, lat: _locationData!.latitude)
        //   CameraPosition(
        // bearing: 192.8334901395799,
        // target: LatLng(lat, lon),
        // tilt: 59.440717697143555,
        // zoom: 19.151926040649414)
        ));
  }
}
