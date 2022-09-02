import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class CashScreen extends StatelessWidget {
  const CashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: black,
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(Icons.arrow_back),
          ),
          title: Text(
            'Cash',
            style: TextStyle(
              color: white,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Cash',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w500),
                ),
                trailing: Icon(
                  Icons.money_outlined,
                  color: Colors.green,
                  size: 50,
                ),
              ),
              SizedBox(
                height: Get.height / 8,
              ),
              TitleText(text: 'Pay for trips in cash'),
              Text(
                'Your driver\'s phone will show you the amount to pay at the end of the trip.',
                style: TextStyle(fontSize: 14, color: grey5),
              )
            ],
          ),
        ),
      ),
    );
  }
}
