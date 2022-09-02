import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/choosePlace/choosePlace.dart';

class SavedPlaces extends StatelessWidget {
  const SavedPlaces({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              arrow_back,
              color: black,
            ),
          ),
          backgroundColor: yellow,
          title: Text(
            'Choose a destination',
            style: TextStyle(
              color: black,
              fontSize: 20,
            ),
          ),
        ),
        body: Column(
          children: [
            ListTile(
              onTap: () => Get.to(() => ChoosePlace()),
              title: const Text(
                'Add saved place',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15,
                ),
              ),
              subtitle: Text(
                'Get to your favourite destinations faster',
                style: TextStyle(
                  color: grey5,
                  fontSize: 13,
                ),
              ),
            ),
            Divider()
          ],
        ),
      ),
    );
  }
}
