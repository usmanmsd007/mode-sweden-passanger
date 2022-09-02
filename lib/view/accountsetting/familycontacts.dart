import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/invitefamilycontroller.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class FamilyContacts extends StatelessWidget {
  FamilyContacts({Key? key}) : super(key: key);
  var ctrl = Get.find<InviteFamilyController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: Icon(
              Icons.arrow_back,
              color: white,
              size: 30,
            ),
            backgroundColor: black,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Invite Your Family'),
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                TextFormField(
                    decoration: InputDecoration(hintText: 'Find contact')),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ...List.generate(
                            ctrl.name.length,
                            (index) => ListTile(
                                  title: Text(ctrl.name[index]),
                                  subtitle: Text(ctrl.numbers[index]),
                                )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
          width: Get.width,
          height: Get.height / 12,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: grey5),
              child: Text(
                'Continue',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {},
            ),
          )),
    ));
  }
}
