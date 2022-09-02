import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:uber_ui/controller/mapController.dart';
import 'package:uber_ui/services/ride/sendrequest.dart';

class PlacesController extends GetxController {
  late GooglePlace googlePlace;
  TextEditingController firstSearchCtrl = TextEditingController();
  TextEditingController secondSearchCtrl = TextEditingController();
  late FocusNode startFocusNode;
  late FocusNode endFocusNode;
  DetailsResult? startingPoint;
  DetailsResult? endPoint;
  Set<Polyline> polylines = <Polyline>{};
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  // String googleAPiKey = "Please provide your api key";
  String? basicFare;
  String? premiumFare;
  String? comfortFare;
  String? request_id;

  final String _api_key = 'AIzaSyAjfITB9U_n7TWqVQLRZunTQb0NZetwzoc';

  var ctrl = Get.find<MapController>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    startFocusNode.dispose();
    endFocusNode.dispose();
    firstSearchCtrl.dispose();
    secondSearchCtrl.dispose();
  }
  // const String _api_key='AIzaSyAjfITB9U_n7TWqVQLRZunTQb0NZetwzoc';

  @override
  void onInit() async {
    super.onInit();
    startFocusNode = FocusNode();
    endFocusNode = FocusNode();
    firstSearchCtrl.text = ctrl.address;

    googlePlace = GooglePlace(_api_key);
  }

  RxBool expand = true.obs;
  void changeExpand(bool v) {
    expand.value = v;
    update();
  }

  RxList<AutocompletePrediction> predictions = <AutocompletePrediction>[].obs;
  Timer? _debounce;
  void autoComplete(String s, bool isFirst) async {
    _debounce = Timer(Duration(milliseconds: 1000), () async {
      if (_debounce?.isActive ?? false) _debounce?.cancel();
      if (s.isNotEmpty) {
        var result = await googlePlace.autocomplete.get(s);
        if (result != null && result.predictions != null) {
          predictions.value = await result.predictions!;

          predictions.refresh();
          // result.predictions!.forEach((element) {
          //   printInfo(info: element.description!);
          // });
        }
      } else {
        isFirst
            ? () {
                predictions.value = [];
                predictions.refresh();
                startingPoint = null;
              }
            : () {
                predictions.value = [];
                predictions.refresh();

                endPoint = null;
              };
      }
    });
  }

  addPolyLine() {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
        zIndex: 1,
        visible: true,
        width: 10,
        polylineId: id,
        color: Colors.red,
        points: polylineCoordinates);
    polylineCoordinates.forEach((element) {
      printInfo(
          info:
              element.latitude.toString() + " " + element.longitude.toString());
    });
    // printInfo(info: 'poly lines'+ polylineCoordinates.forEach((element) { }))
    polylines.add(polyline);
    // polylines.refresh();
    // setState(() {});
  }

  getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      _api_key,
      PointLatLng(ctrl.locationData!.latitude!, ctrl.locationData!.longitude!),
      PointLatLng(endPoint!.geometry!.location!.lat!,
          endPoint!.geometry!.location!.lat!),
      travelMode: TravelMode.driving,
      // wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
    );
    // printInfo(info: startingPoint!.geometry!.location!.lat!.toString()+" "+
    //         startingPoint!.geometry!.location!.lng!.toString());
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      polylineCoordinates.forEach((element) {
        printInfo(
            info: element.latitude.toString() +
                " " +
                element.longitude.toString());
      });
    }
    addPolyLine();
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  askRide() {
    var distance = calculateDistance(
        ctrl.locationData!.latitude!,
        ctrl.locationData!.longitude!,
        endPoint!.geometry!.location!.lat!,
        endPoint!.geometry!.location!.lng!);
    sendRequest(
            slat: ctrl.locationData!.latitude!,
            slng: ctrl.locationData!.longitude!,
            dlat: endPoint!.geometry!.location!.lat!,
            dlng: endPoint!.geometry!.location!.lng!,
            distnace: distance)
        .then((value) {
      if (value['data'][0]['type'] == 'basic') {
        basicFare = value['data'][0]['fare'];
        update();
      }
      if (value['data'][1]['type'] == 'premium') {
        premiumFare = value['data'][1]['fare'];
        update();
      }
      if (value['data'][2]['type'] == 'comfort') {
        comfortFare = value['data'][2]['fare'];
        update();
      }
      request_id = value['request_id'].toString();
      update();
    });
  }
}
