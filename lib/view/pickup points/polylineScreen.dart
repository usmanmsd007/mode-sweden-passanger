import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_place/google_place.dart';

import '../../utils/mapUtils.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};
  LatLng? _lat1;
  LatLng? _lat2;
  GoogleMapController? ctrl;
  List<LatLng> latlngSegment1 = [];
  @override
  Widget build(BuildContext context) {
    List<DetailsResult?> argumetns = Get.arguments as List<DetailsResult?>;

    _lat1 = LatLng(argumetns[0]!.geometry!.location!.lat!,
        argumetns[0]!.geometry!.location!.lng!);
    _lat2 = LatLng(argumetns[1]!.geometry!.location!.lat!,
        argumetns[1]!.geometry!.location!.lng!);
    latlngSegment1.add(_lat1!);
    latlngSegment1.add(_lat2!);

    return Scaffold(
      body: GoogleMap(
        //that needs a list<Polyline>
        polylines: _polyline,
        markers: _markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _lat1!,
          zoom: 11.0,
        ),
        mapType: MapType.normal,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controllerParam) {
    setState(() {
      ctrl = controllerParam;
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId('source'),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lat1!,
        infoWindow: InfoWindow(
          title: 'Awesome Polyline tutorial',
          snippet: 'This is a snippet',
        ),
      ));
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId('destination'),
        //_lastMapPosition is any coordinate which should be your default
        //position when map opens up
        position: _lat2!,
        infoWindow: InfoWindow(
          title: 'tu',
          snippet: 'yes',
        ),
      ));

      _polyline.add(Polyline(
        polylineId: PolylineId('line1'),
        visible: true,
        //latlng is List<LatLng>
        points: latlngSegment1,
        width: 10,
        color: Colors.blue,
      ));
    });
    Future.delayed(Duration(milliseconds: 2000), () {
      controllerParam.animateCamera(CameraUpdate.newLatLngBounds(
          MapUtils.boundsFromLatLngList(
              _markers.map((loc) => loc.position as LatLng).toList()),
          2));

      // pickupctrl.getPolyline();
    });

    //different sections of polyline can have different colors
  }
}


// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:google_place/google_place.dart';
// import 'package:uber_ui/controller/pickupcontroller.dart';

// import '../../utils/mapUtils.dart';

// class MapScreen extends StatelessWidget {
//   MapScreen({
//     Key? key,
//     // required this.start,
//     // required this.end,
//   }) : super(
//           key: key,
//         );
//   var pickupctrl = Get.find<PickUpController>();
//   // var mapCtrl = Get.find<MapController>();

//   DetailsResult? start;
//   DetailsResult? end;

//   @override
//   Widget build(BuildContext context) {
//     start = pickupctrl.startingPoint;
//     end = pickupctrl.endPoint;
//     Set markers = {
//       Marker(
//           markerId: MarkerId('start'),
//           position: LatLng(
//             start!.geometry!.location!.lat!,
//             start!.geometry!.location!.lng!,
//           )),
//       Marker(
//           markerId: MarkerId('end'),
//           position: LatLng(
//             end!.geometry!.location!.lat!,
//             end!.geometry!.location!.lng!,
//           ))
//     };
//     pickupctrl.getPolyline();
//     return Scaffold(
//       body: Obx(
//         () => GoogleMap(
//           onMapCreated: (GoogleMapController c) async {
//             Set<Marker> _markers = Set();

//             _markers = Set.from(
//               markers,
//             );

//             Future.delayed(Duration(milliseconds: 2000), () {
//               c.animateCamera(CameraUpdate.newLatLngBounds(
//                   MapUtils.boundsFromLatLngList(
//                       _markers.map((loc) => loc.position as LatLng).toList()),
//                   2));

//               pickupctrl.getPolyline();
//             });
//             // pickupctrl.getPolyline();
//             // pickupctrl.polylineCoordinates.forEach((element) {
//             //   printInfo(
//             //       info: element.latitude.toString() +
//             //           " " +
//             //           element.longitude.toString());
//             // });
//           },
//           initialCameraPosition: CameraPosition(
//               zoom: 14.4267,
//               target: LatLng(
//                 start!.geometry!.location!.lat!,
//                 start!.geometry!.location!.lng!,
//               )),
//           markers: Set.from(markers),
//           polylines: Set.from(pickupctrl.polylines),
//         ),
//       ),
//     );
//   }
// }
