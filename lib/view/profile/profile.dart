import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/profileScreenCtrl/profileScreenCtrl.dart';
import 'package:uber_ui/view/accountsetting/accountsetting.dart';
import 'package:uber_ui/view/edit_account/edit_account.dart';
import 'package:uber_ui/view/help/helpScreen.dart';
import 'package:uber_ui/view/home%20screen/widgets/profileicon.dart';
import 'package:uber_ui/view/legalscreens.dart/legal_screen.dart';
import 'package:uber_ui/view/messages/messages_screen.dart';
import 'package:uber_ui/view/profile/profile_widgets.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

import '../../public/public.dart';
import '../trips/tripsScreen.dart';
import '../wallet_screen/walletScreen.dart';

class ProfileWidget extends StatelessWidget {
  ProfileWidget({Key? key}) : super(key: key);
  var profilectrl = Get.find<ProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    // return Obx(() => profilectrl.model == null
    // return Center(
    //     child: CircularProgressIndicator(),
    //   )
    return SafeArea(
      child: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () => Get.back(),
                      child: Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 05.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: HeadingText1(
                                text: profilectrl.model.value.firstName +
                                    " " +
                                    profilectrl.model.value.lastName,
                                color: Colors.black),
                          ),
                        ),
                        ProfileIcon(
                          ontap: () {
                            Get.to(() => EditAccount());
                          },
                          size: 40,
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: grey2,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8, right: 8.0, top: 3, bottom: 3),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                              ),
                              Text(
                                profilectrl.model.value.rating.toString(),
                                style: const TextStyle(
                                    color: black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ProfileOption(
                                ontap: () {
                                  Get.to(() => HelpScreen());
                                },
                                icon: Icons.ads_click_outlined,
                                text: 'Help')),
                        Expanded(
                          child: ProfileOption(
                              ontap: () {
                                Get.to(() => WalletScreen());
                              },
                              icon: Icons.account_balance_wallet_rounded,
                              text: 'Wallet'),
                        ),
                        Expanded(
                            child: ProfileOption(
                                ontap: () {
                                  Get.to(() => TripsScreen());
                                },
                                icon: Icons.watch_later_rounded,
                                text: 'Trips'))
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 8,
              ),
              Column(children: [
                ListTile(
                  onTap: () => Get.to(() => MessagesScreen()),
                  leading: Icon(
                    Icons.email_rounded,
                    color: Colors.black,
                  ),
                  title: TitleText(
                    weight: FontWeight.w500,
                    text: "Messages",
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(() => AccountSetting()),
                  leading: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: TitleText(
                    weight: FontWeight.w500,
                    text: "Settings",
                    color: Colors.black,
                  ),
                ),
                ListTile(
                  onTap: () => Get.to(LegalScreen()),
                  leading: const Icon(
                    Icons.info,
                    color: Colors.black,
                  ),
                  title: TitleText(
                    weight: FontWeight.w500,
                    text: "Legal",
                    color: Colors.black,
                  ),
                ),
              ])
            ]),
      ),
    );
  }
}
