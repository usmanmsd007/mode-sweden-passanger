import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_ui/controller/mapController.dart';
import 'package:uber_ui/controller/pickupcontroller.dart';
import 'package:uber_ui/public/public.dart';

import '../../../widgets/mywidgets.dart';
import '../../pickup points/widgets/mytimeline.dart';
import '../../pickup points/widgets/pickuppointwidgets.dart';

class SendPackageDetails extends StatelessWidget {
  SendPackageDetails({Key? key}) : super(key: key);
  var ctrl = Get.find<MapController>();
  var pickupctrl = Get.find<PickUpController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ModeAppbar(title: 'Where\'s  it going?'),
      body: Padding(
        padding: EdgeInsets.zero,
        child: Stack(
          // fit: StackFit.,
          // alignment: Alignment.,
          children: [
            GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: ctrl.kGooglePlex.value,
                onMapCreated: (GoogleMapController controller) {
                  // ctrl.controller.complete(controller);
                  if (ctrl.controller.isCompleted == false) {
                    ctrl.controller.complete(controller);
                  }
                }),
            Container(
              // margin: EdgeInsets.only(bottom: 20),
              color: white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // const SwitchUserWidget(),

                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: Get.height / 44),
                    child: MyTimeLne(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            DraggableSheet(ctrl: pickupctrl)
          ],
        ),
      ),
    ));
  }
}
