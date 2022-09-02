import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/accountsetting/invite_family_member.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class SetupFamily extends StatelessWidget {
  const SetupFamily({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ModeAppbar(
        leading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width,
                height: Get.height / 3,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TitleText(text: 'Treat your family to Mode'),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 8),
                      child: Text(
                        'You can add upto 4 people to a family. When they take a trip, you\'ll get trip notifications so you can follow along live on the map.',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MainButton(
                color: blue,
                onpress: () => Get.to(() => InviteFamilyMember()),
                text: 'Continue'),
          )
        ],
      ),
    ));
  }
}
