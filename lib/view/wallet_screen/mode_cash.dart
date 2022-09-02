import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class ModeCash extends StatelessWidget {
  const ModeCash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // backgroundColor: white,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back,
            color: black,
          ),
        ),
        title: Text(
          'Mode Cash',
          style: TextStyle(color: black),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            width: Get.width,
            height: Get.height / 4,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'PKR0',
                    style: TextStyle(fontSize: 40),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TitleText(
              text: 'No transaction yet',
            ),
          )
        ],
      ),
    ));
  }
}
