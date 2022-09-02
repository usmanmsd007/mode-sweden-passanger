import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_ui/controller/mapController.dart';
import 'package:uber_ui/controller/pickupcontroller.dart';
import 'package:uber_ui/controller/placesController/placesController.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/pickup%20points/mapScreen.dart';
import 'package:uber_ui/view/pickup%20points/widgets/mytimeline.dart';
import 'package:uber_ui/view/pickup%20points/widgets/pickuppointwidgets.dart';

import '../../widgets/mywidgets.dart';

class PickUpPoint extends StatelessWidget {
  PickUpPoint({Key? key}) : super(key: key);
  var map = Get.find<MapController>();
  var pickupctrl = Get.find<PickUpController>();
  var placeCtrl = Get.find<PlacesController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: map.kGooglePlex.value,
              onMapCreated: (GoogleMapController controller) {
                if (map.controller.isCompleted == false) {
                  map.controller.complete(controller);
                }
              }),
          Obx(
            //{"key": 'value'}
            //
            () => placeCtrl.predictions.isEmpty
                ? Container()
                : DraggableScrollableSheet(
                    // snap: true,
                    // expand: placeCtrl.expand.value,
                    initialChildSize: 0.2,
                    minChildSize: 0.2,
                    maxChildSize: 0.77,
                    builder: (contxt, _controller) {
                      return Container(
                        color: white,
                        child: Obx(
                          () => ListView.builder(
                            controller: _controller,
                            itemCount: placeCtrl.predictions.length,
                            itemBuilder: (c, i) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                color: Colors.grey.shade100,
                                child: ListTile(
                                  onTap: () async {
                                    final placeId =
                                        placeCtrl.predictions[i].placeId!;
                                    final details = await placeCtrl
                                        .googlePlace.details
                                        .get(placeId);
                                    printInfo(
                                        info: details!.result!.name.toString() +
                                            details.result!.toString());
                                    if (details != null &&
                                        details.result != null) {
                                      if (placeCtrl.startFocusNode.hasFocus) {
                                        placeCtrl.startingPoint =
                                            details.result;
                                        placeCtrl.firstSearchCtrl.text =
                                            placeCtrl
                                                .predictions[i].description!;
                                        placeCtrl.predictions.value = [];
                                        placeCtrl.changeExpand(false);
                                        // placeCtrl.update();
                                      } else {
                                        placeCtrl.endPoint = details.result;
                                        placeCtrl.secondSearchCtrl.text =
                                            placeCtrl
                                                .predictions[i].description!;
                                        placeCtrl.predictions.value = [];
                                        placeCtrl.changeExpand(false);
                                        if (placeCtrl.startingPoint != null &&
                                            placeCtrl.firstSearchCtrl.text
                                                .isNotEmpty) {
                                          Future.delayed(Duration(seconds: 2))
                                              .whenComplete(
                                                  () => Get.to(() => MapScreen(
                                                      // start: placeCtrl.startingPoint, end: placeCtrl.endPoint,
                                                      )));
                                        }
                                      }
                                    }
                                  },
                                  leading: const Icon(
                                    Icons.place,
                                    color: black,
                                  ),
                                  title: TitleText(
                                    text: placeCtrl.predictions[i].description!,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SwitchUserWidget(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 5),
                    child: MyTimeLne(),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
