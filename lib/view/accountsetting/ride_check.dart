import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/ride_check_controller.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class RideCheck extends StatelessWidget {
  RideCheck({Key? key}) : super(key: key);
  var rideCheckController = Get.find<RideCheckController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: yellow,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: black,
            size: 30,
          ),
        ),
        title: Text(
          'RideCheck',
          style: TextStyle(color: black),
        ),
      ),
      body: Column(children: [
        Container(
          width: Get.width,
          height: Get.height / 5,
          color: Colors.blue,
          child: Icon(
            Icons.shield_outlined,
            color: white,
            size: 40,
          ),
          alignment: Alignment.center,
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20.0,
                ),
                child: TitleText(text: 'What\'s a Ridecheck?'),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20.0,
                ),
                child: Text(
                    'In the case of an unexpected event, Mode will initiate a RideCheck, providing you with access to relevant safety tools so that you can quickly get the help you need.'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                child: ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text('RideCheck notifications'),
                  trailing: Obx(
                    () => Switch(
                      activeColor: black,
                      inactiveThumbColor: black,
                      focusColor: black,
                      activeTrackColor: Colors.black87,
                      inactiveTrackColor: grey5,
                      value: rideCheckController.rideCheckNotifications.value,
                      onChanged: (v) => rideCheckController.setnotifications(v),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                  bottom: 20.0,
                ),
                child: Text(
                    'When turned on, Mode will send you a RideCheck notification if a trip doesn\'t progress as planned.'),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}
