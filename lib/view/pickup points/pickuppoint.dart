import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:uber_ui/controller/mapController.dart';
import 'package:uber_ui/controller/pickupcontroller.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/pickup%20points/polylineScreen.dart';
import 'package:uber_ui/view/pickup%20points/widgets/mytimeline.dart';
import 'package:uber_ui/view/pickup%20points/widgets/pickuppointwidgets.dart';

import '../../widgets/mywidgets.dart';

class PickUpPoint extends StatelessWidget {
  PickUpPoint({Key? key}) : super(key: key);
  var map = Get.find<MapController>();
  var pickupctrl = Get.find<PickUpController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          // Obx(
          //   () => GoogleMap(
          //       mapType: MapType.hybrid,
          //       initialCameraPosition: map.kGooglePlex.value,
          //       markers: Set.from(pickupctrl.markers),
          //       onMapCreated: (GoogleMapController controller) {
          //         if (map.controller.isCompleted == false) {
          //           map.controller.complete(controller);
          //         }
          //       }),
          // ),
          Obx(
            () => pickupctrl.predictions.isEmpty
                ? Container()
                : DraggableScrollableSheet(
                    initialChildSize: 0.77,
                    minChildSize: 0.2,
                    maxChildSize: 0.77,
                    builder: (contxt, _controller) {
                      return Container(
                        color: white,
                        child: Obx(
                          () => ListView.builder(
                            controller: _controller,
                            itemCount: pickupctrl.predictions.length,
                            itemBuilder: (c, i) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                color: Colors.grey.shade100,
                                child: ListTile(
                                  onTap: () async {
                                    final placeId =
                                        pickupctrl.predictions[i].placeId!;
                                    final details = await pickupctrl
                                        .googlePlace.details
                                        .get(placeId);
                                    if (details != null &&
                                        details.result != null) {
                                      if (pickupctrl.startFocusNode.hasFocus) {
                                        pickupctrl.startingPoint =
                                            details.result;
                                        pickupctrl.firstSearchCtrl.text =
                                            pickupctrl
                                                .predictions[i].description!;
                                        pickupctrl.predictions.value = [];
                                        pickupctrl.changeExpand(false);
                                        // pickupctrl.update();
                                      } else {
                                        pickupctrl.endPoint = details.result;
                                        pickupctrl.secondSearchCtrl.text =
                                            pickupctrl
                                                .predictions[i].description!;
                                        pickupctrl.predictions.value = [];
                                        pickupctrl.changeExpand(false);
                                        if (pickupctrl.startingPoint != null &&
                                            pickupctrl.firstSearchCtrl.text
                                                .isNotEmpty) {
                                          Future.delayed(Duration(seconds: 2))
                                              .whenComplete(
                                            () => Get.to(
                                              () => MapScreen(),
                                              arguments: [
                                                pickupctrl.startingPoint,
                                                pickupctrl.endPoint,
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                    }
                                  },
                                  leading: const Icon(
                                    Icons.place,
                                    color: black,
                                  ),
                                  title: TitleText(
                                    text:
                                        pickupctrl.predictions[i].description!,
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
