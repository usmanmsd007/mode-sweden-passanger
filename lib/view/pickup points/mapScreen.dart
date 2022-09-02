import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';
import 'package:uber_ui/controller/mapController.dart';
import 'package:uber_ui/view/pickup%20points/widgets/selectcar.dart';

import '../../controller/placesController/placesController.dart';
import '../../utils/mapUtils.dart';

class MapScreen extends StatelessWidget {
  MapScreen({
    Key? key,
    // required this.start,
    // required this.end,
  }) : super(
          key: key,
        );
  var placeCtrl = Get.find<PlacesController>();
  var mapCtrl = Get.find<MapController>();

  DetailsResult? start;
  DetailsResult? end;

  @override
  Widget build(BuildContext context) {
    start = placeCtrl.startingPoint;
    end = placeCtrl.endPoint;
    Set markers = {
      Marker(
          markerId: MarkerId('start'),
          position: LatLng(
            start!.geometry!.location!.lat!,
            start!.geometry!.location!.lng!,
          )),
      Marker(
          markerId: MarkerId('end'),
          position: LatLng(
            end!.geometry!.location!.lat!,
            end!.geometry!.location!.lng!,
          ))
    };
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            // zoomControlsEnabled: true,
            onMapCreated: (GoogleMapController c) async {
              Set<Marker> _markers = Set();

              _markers = Set.from(
                markers,
              );
              // mapCtrl.controller.complete(c);
              // mapCtrl.controller.

              Future.delayed(Duration(milliseconds: 2000), () {
                c.animateCamera(CameraUpdate.newLatLngBounds(
                    MapUtils.boundsFromLatLngList(
                        _markers.map((loc) => loc.position as LatLng).toList()),
                    2));
              });
              placeCtrl.getPolyline();
              placeCtrl.polylineCoordinates.forEach((element) {
                printInfo(
                    info: element.latitude.toString() +
                        " " +
                        element.longitude.toString());
              });
              // await placeCtrl.addPolyLine();
              // await placeCtrl
            },
            initialCameraPosition: CameraPosition(
                zoom: 14.4267,
                target: LatLng(
                  start!.geometry!.location!.lat!,
                  start!.geometry!.location!.lng!,
                )),
            markers: Set.from(markers),
            polylines: Set.from(placeCtrl.polylines),
          ),
          DraggableScrollableSheet(
              builder: (context, controller) => SelectCar())
        ],
      ),
    );
  }
}
