import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

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

  final String _api_key = 'AIzaSyAjfITB9U_n7TWqVQLRZunTQb0NZetwzoc';

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
      PointLatLng(startingPoint!.geometry!.location!.lat!,
          startingPoint!.geometry!.location!.lng!),
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
}
