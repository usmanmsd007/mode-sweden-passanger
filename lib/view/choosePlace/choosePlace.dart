import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

import '../../controller/mapController.dart';
import '../../controller/pickupcontroller.dart';
import '../../public/public.dart';
import '../pickup points/widgets/pickuppointwidgets.dart';

class ChoosePlace extends StatelessWidget {
  ChoosePlace({Key? key}) : super(key: key);
  var ctrl = Get.find<MapController>();
  var pickupctrl = Get.find<PickUpController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ModeAppbar(title: 'Choose place'),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: ctrl.kGooglePlex.value,
                onMapCreated: (GoogleMapController controller) {
                  if (ctrl.controller.isCompleted == false) {
                    ctrl.controller.complete(controller);
                  }
                }),
            DraggableSheet(ctrl: pickupctrl),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                color: white,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0, top: 8, right: 10),
                        child: Container(
                          color: grey2,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Choose a place',
                                  fillColor: grey2,
                                  filled: true),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
