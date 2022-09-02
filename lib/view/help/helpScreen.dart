import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/helpcontroller.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/help/screen/accessibility.dart';
import 'package:uber_ui/view/help/screen/accountandpayment.dart';
import 'package:uber_ui/view/help/screen/help_with_a_trip.dart';
import 'package:uber_ui/view/help/screen/signing_up.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class HelpScreen extends StatelessWidget {
  HelpScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<HelpController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                'Help',
                style: TextStyle(color: black),
              )),
              leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(
                  arrow_back,
                  color: black,
                ),
              ),
              pinned: true,
              expandedHeight: Get.height / 8,
              backgroundColor: yellow,
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, bottom: 10, right: 10),
                      child: Text(
                        'All Topics',
                        style: TextStyle(color: grey5),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: ListTile(
                        onTap: () => Get.to(() => HelpWithTrip()),
                        contentPadding: EdgeInsets.all(0),
                        leading: TitleText(
                          text: ctrl.alltopics[0],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: ListTile(
                        // onTap: ctrl.ontap(i),
                        onTap: () => Get.to(() => AccountAndPayment()),

                        contentPadding: EdgeInsets.all(0),
                        leading: TitleText(
                          text: ctrl.alltopics[1],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: ListTile(
                        onTap: () => Get.to(() => Signing_UP()),
                        // onTap: ctrl.ontap(i),
                        contentPadding: EdgeInsets.all(0),
                        leading: TitleText(
                          text: ctrl.alltopics[2],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: ListTile(
                        onTap: () => Get.to(() => AccessibilityatMode()),
                        contentPadding: EdgeInsets.all(0),
                        leading: TitleText(
                          text: ctrl.alltopics[3],
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
