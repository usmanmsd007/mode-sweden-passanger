import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/wallet_screen/cash.dart';
import 'package:uber_ui/view/wallet_screen/mode_cash.dart';
import 'package:uber_ui/view/wallet_screen/profile_settings.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: yellow,
              leading: InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  arrow_back,
                  color: Colors.black,
                ),
              ),
              expandedHeight: Get.height / 8,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text(
                  'Wallet',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      // ignore: sort_child_properties_last
                      child: InkWell(
                        onTap: () => Get.to(() => ModeCash()),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, top: 20.0),
                              child: Text(
                                'Mode Cash',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            ListTile(
                              leading:
                                  HeadingText1(text: 'PKR 0.00', color: black),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 18, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.info,
                                    color: black,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  TitleText(
                                    text: 'Auto-refill is off',
                                    color: grey5,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Payment methods',
                      style: TextStyle(
                          color: grey5,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: ListTile(
                      onTap: () => Get.to(() => CashScreen()),
                      contentPadding: EdgeInsets.zero,
                      leading: Icon(
                        Icons.money_outlined,
                        color: Colors.green,
                        size: 40,
                      ),
                      title: Text(
                        'Cash',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15.0),
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, left: 20),
                    child: Text(
                      'Trip profiles',
                      style: TextStyle(
                          color: grey5,
                          fontSize: 14,
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      left: 20,
                    ),
                    child: ListTile(
                      onTap: () => Get.to(() => ProfileSettings()),
                      contentPadding: EdgeInsets.all(0),
                      leading: CircleAvatar(
                        backgroundColor: black,
                        radius: 20,
                        child: Icon(
                          Icons.person,
                        ),
                      ),
                      title: Text(
                        'Personal',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 15.0),
                    child: Divider(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
