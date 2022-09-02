import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class ReceiptEmail extends StatelessWidget {
  const ReceiptEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText1(text: 'Receipt email', color: black),
              SizedBox(
                height: Get.height / 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email'),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                          decoration:
                              InputDecoration.collapsed(hintText: 'Email')),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          child:
              MainButton(color: black, onpress: () => Get.back(), text: 'Save'),
          height: Get.height / 12,
          width: Get.width - 40,
        ),
        appBar: AppBar(
            backgroundColor: white,
            elevation: 0,
            leading: InkWell(
              onTap: () => Get.back(),
              child: Icon(
                Icons.close,
                color: black,
              ),
            )),
      ),
    );
  }
}
