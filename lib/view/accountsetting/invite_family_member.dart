import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/accountsetting/familycontacts.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class InviteFamilyMember extends StatelessWidget {
  const InviteFamilyMember({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ModeAppbar(
        leading: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TitleText(text: 'Invite you family member'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 85,
                backgroundColor: Colors.grey,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MainButton(
                color: Colors.white,
                onpress: () => Get.to(() => FamilyContacts()),
                text: 'Invite member'),
          ),
        ],
      ),
    ));
  }
}
