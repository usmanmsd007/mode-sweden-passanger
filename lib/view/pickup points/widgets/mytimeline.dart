import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/view/pickup%20points/widgets/searchBox.dart';

import '../../../controller/pickupcontroller.dart';
import '../../../controller/placesController/placesController.dart';

class MyTimeLne extends StatelessWidget {
  MyTimeLne({
    Key? key,
  }) : super(key: key);
  var placesCtrl = Get.find<PlacesController>();

  var ctrl = Get.find<PickUpController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // CustomTimeline(ctrl: ctrl),
        SizedBox(
          height: Get.height / 6,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  width: Get.width / 1.1,
                  height: Get.height / 8,
                  child: Column(
                    children: [
                      FirstSearchBox(
                          suffixontap: () {
                            placesCtrl.predictions.value = [];
                            placesCtrl.predictions.refresh();
                            placesCtrl.firstSearchCtrl.clear();
                            placesCtrl.update();
                          },
                          focusNode: placesCtrl.startFocusNode,
                          ctrl: placesCtrl.firstSearchCtrl,
                          onChange: (p0) => placesCtrl.autoComplete(p0, true),
                          ontap: () {
                            // ctrl.setTimelineIcon(true);
                            placesCtrl.changeExpand(true);
                          },
                          text: 'Choose a pick-up point',
                          val: false),
                      // ),
                      const SizedBox(
                        height: 10,
                      ),
                      SecondSearchBox(
                        // enabled: placesCtrl.firstSearchCtrl.text.isNotEmpty &&
                        //     placesCtrl.startingPoint != null,
                        suffixontap: () {
                          placesCtrl.predictions.value = [];
                          placesCtrl.predictions.refresh();
                          placesCtrl.secondSearchCtrl.clear();
                        },
                        focusNode: placesCtrl.endFocusNode,
                        ctrl: placesCtrl.secondSearchCtrl,
                        onChange: (p0) => placesCtrl.autoComplete(p0, false),
                        ontap: () {
                          // ctrl.setTimelineIcon(false);
                          // placesCtrl.changeExpand(true);
                          // ctrl.showBottomSheetWithPlaces(false);
                        },
                        text: 'Where to go?',
                        val: false,
                      ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Container()
      ],
    );
  }
}
