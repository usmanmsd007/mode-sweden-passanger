import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/verify_trips_controller.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class VerifyTrip extends StatelessWidget {
  VerifyTrip({Key? key}) : super(key: key);
  var ctrl = Get.find<VerifyTripsController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: yellow,
            leading: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: black,
              ),
              onTap: () {
                Get.back();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            bottom: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height / 3.2,
                    color: grey5,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText1(text: 'Verify your trips', color: black),
                    SizedBox(
                      height: Get.height / 18,
                    ),
                    const Text(
                        'Help make sure you get into the right car by verifying your trip with a PIN. You will receive a unique PIN for each trip, which you will need to share with your driver when they pick you up in order for the trip to start.')
                    // TitleText(text: 'Verify your trips')
                  ],
                ),
              ),
              Obx(
                () => ctrl.verifyviapin.value
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MainButton(
                            color: blue,
                            onpress: () => Get.back(),
                            text: 'Done'),
                      )
                    : ListTile(
                        title: Text('Use PIN to verify trips'),
                        trailing: Switch(
                          value: ctrl.verifyviapin.value,
                          onChanged: (v) => ctrl.setverifypin(v),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
