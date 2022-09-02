import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/pickupcontroller.dart';
import '../../../public/public.dart';
import '../../../widgets/mywidgets.dart';

//this is the bootm sheet

class DraggableSheet extends StatelessWidget {
  const DraggableSheet({
    Key? key,
    required this.ctrl,
  }) : super(key: key);

  final PickUpController ctrl;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.2,
      maxChildSize: 0.85,
      builder: (c, b) {
        return Container(
          color: white,
          child: ListView.builder(
            controller: b,
            itemCount: ctrl.places.length,
            itemBuilder: (c, i) => ListTile(
              leading: const Icon(
                Icons.place,
                color: black,
              ),
              title: TitleText(
                text: ctrl.places[i],
              ),
            ),
          ),
        );
      },
    );
  }
}

// this is a small widget used in pickup screen

class SwitchUserWidget extends StatelessWidget {
  const SwitchUserWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            arrow_back,
            size: 35,
          ),
        ),
        // Row(
        //   mainAxisSize: MainAxisSize.min,
        //   children: const [
        //     Text('Switch User'),
        //     Icon(
        //       Icons.keyboard_arrow_down_outlined,
        //     ),
        //   ],
        // ),
        Container()
      ],
    );
  }
}
