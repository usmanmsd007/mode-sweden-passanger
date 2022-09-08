import 'dart:async';
import 'package:location/location.dart' as l;
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

class PickUpController extends GetxController {
  late GooglePlace googlePlace;
  TextEditingController firstSearchCtrl = TextEditingController();
  TextEditingController secondSearchCtrl = TextEditingController();
  late FocusNode startFocusNode;
  late FocusNode endFocusNode;
  DetailsResult? startingPoint;
  DetailsResult? endPoint;
  RxSet<Polyline> polylines = <Polyline>{}.obs;
  List<LatLng> polylineCoordinates = [];
  PolylinePoints polylinePoints = PolylinePoints();
  RxSet<Marker> markers = <Marker>{}.obs;

  void addMarker(Marker marker) {
    markers.add(marker);
    markers.refresh();
  }

  final String _api_key = 'AIzaSyAjfITB9U_n7TWqVQLRZunTQb0NZetwzoc';

  @override
  void dispose() {
    super.dispose();
    startFocusNode.dispose();
    endFocusNode.dispose();
    firstSearchCtrl.dispose();
    secondSearchCtrl.dispose();
  }

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
          predictions.value = result.predictions!;

          predictions.refresh();
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
    polylines.add(polyline);

    polylines.refresh();
    update();
  }

  getPolyline() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      _api_key,
      PointLatLng(startingPoint!.geometry!.location!.lat!,
          startingPoint!.geometry!.location!.lng!),
      PointLatLng(endPoint!.geometry!.location!.lat!,
          endPoint!.geometry!.location!.lat!),
      travelMode: TravelMode.driving,
    );
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
