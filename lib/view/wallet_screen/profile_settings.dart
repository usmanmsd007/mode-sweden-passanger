import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/wallet_screen/edit_profilename.dart';
import 'package:uber_ui/view/wallet_screen/receipt_email.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Get.back(),
            child: Icon(
              Icons.close,
              color: black,
              size: 30,
            ),
          ),
          elevation: 0,
          backgroundColor: white,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Profile settings',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              ListTile(
                onTap: () => Get.to(() => EditProfileName()),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.badge,
                  color: black,
                  size: 40,
                ),
                title: Text('Profile name'),
                subtitle: Text("Personal"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: grey5,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: Get.width / 6),
                child: Divider(),
              ),
              ListTile(
                onTap: () => Get.to(() => ReceiptEmail()),
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  Icons.email,
                  color: black,
                  size: 40,
                ),
                title: Text('Email for receipt'),
                subtitle: Text("phone-only-user"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: grey5,
                ),
              ),
              Divider(),
              Text(
                'When you take a trip using this profile, these preferences will be selected by default.',
                style: TextStyle(color: grey5),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
