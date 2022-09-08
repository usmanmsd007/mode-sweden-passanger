import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/view/pickup%20points/widgets/searchBox.dart';

import '../../../controller/pickupcontroller.dart';

class MyTimeLne extends StatelessWidget {
  MyTimeLne({
    Key? key,
  }) : super(key: key);
  var pickupctrl = Get.find<PickUpController>();

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
                            pickupctrl.predictions.value = [];
                            pickupctrl.predictions.refresh();
                            pickupctrl.firstSearchCtrl.clear();
                            pickupctrl.update();
                          },
                          focusNode: pickupctrl.startFocusNode,
                          ctrl: pickupctrl.firstSearchCtrl,
                          onChange: (p0) => pickupctrl.autoComplete(p0, true),
                          ontap: () {
                            // ctrl.setTimelineIcon(true);
                            pickupctrl.changeExpand(true);
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
                          pickupctrl.predictions.value = [];
                          pickupctrl.predictions.refresh();
                          pickupctrl.secondSearchCtrl.clear();
                        },
                        focusNode: pickupctrl.endFocusNode,
                        ctrl: pickupctrl.secondSearchCtrl,
                        onChange: (p0) => pickupctrl.autoComplete(p0, false),
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
