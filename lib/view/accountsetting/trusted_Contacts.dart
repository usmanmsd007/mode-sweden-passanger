import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/accountsetting/addtrustedcontact.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class TrustedContacts extends StatelessWidget {
  const TrustedContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: ModeAppbar(leading: true),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // InkWell(
            //   onTap: () => Get.back(closeOverlays: true),
            //   child: const Icon(
            //     Icons.arrow_back,
            //     color: black,
            //     size: 40,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.only(),
              child: Text(
                'Trusted Contacts',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: Text(
                    'Share your trip status',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'You\'ll be able to share your live location with one or more contacts during any ',
                      //  style:
                      //  TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                  leading: Icon(
                    Icons.switch_access_shortcut_add_sharp,
                    color: black,
                    size: 30,
                  ),
                  onTap: () => null,
                ),
                SizedBox(
                  height: Get.height / 16,
                ),
                ListTile(
                  title: Text(
                    'Set your emergency contacts',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'you can make a trusted contact an emergency contact, too. Mode can call them if we can\'t reach you in case of an emergency.',
                      //  style:
                      //  TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                    ),
                  ),
                  leading: Icon(
                    Icons.switch_access_shortcut_add_sharp,
                    color: black,
                    size: 30,
                  ),
                  onTap: () => null,
                ),
              ],
            ),
            MainButton(
                color: blue,
                onpress: () => Get.to(
                      () => AddTrustedContact(),
                    ),
                text: 'Add trusted contact')
          ],
        ),
      ),
    ));
  }
}
