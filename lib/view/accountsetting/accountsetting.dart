import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:uber_ui/controller/accountsettingctrl.dart';
import 'package:uber_ui/controller/authctrls/authCtrl.dart';
import 'package:uber_ui/controller/profileScreenCtrl/profileScreenCtrl.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/accountsetting/ride_check.dart';
import 'package:uber_ui/view/accountsetting/security.dart';
import 'package:uber_ui/view/accountsetting/setupFamily.dart';
import 'package:uber_ui/view/accountsetting/trusted_Contacts.dart';
import 'package:uber_ui/view/accountsetting/verify_trip.dart';
import 'package:uber_ui/view/choosePlace/choosePlace.dart';
import 'package:uber_ui/view/savedplaces/savedPlaces.dart';
import 'package:uber_ui/view/start%20screen/StartScreen.dart';

class AccountSetting extends StatelessWidget {
  AccountSetting({Key? key}) : super(key: key);
  var ctrl = Get.find<AccountSettingController>();
  var profilectrl = Get.find<ProfileScreenController>();
  var authctrl = Get.find<AuthCtrl>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: InkWell(
                onTap: () => Get.back(),
                child: Icon(
                  arrow_back,
                  color: black,
                ),
              ),
              expandedHeight: Get.height / 8,
              pinned: true,
              backgroundColor: yellow,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'Account settings',
                  style: TextStyle(color: black),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(10),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: black,
                        radius: 35,
                      ),
                      title: Column(
                        children: [
                          Text(
                            profilectrl.model.value.firstName +
                                " " +
                                profilectrl.model.value.lastName,
                          ),
                          Text(
                            profilectrl.model.value.mobile,
                          )
                        ],
                      ),
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Favourites',
                        style: TextStyle(color: grey5, fontSize: 16),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => ChoosePlace()),
                      leading: Icon(
                        ctrl.favouriteicons[0],
                        color: black,
                      ),
                      title: Text(ctrl.favourites[0]),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => ChoosePlace()),
                      leading: Icon(
                        ctrl.favouriteicons[1],
                        color: black,
                      ),
                      title: Text(ctrl.favourites[1]),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 15, bottom: 15, left: 20.0),
                      child: InkWell(
                        onTap: () => Get.to(() => const SavedPlaces()),
                        child: const Text(
                          'More save places',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Safety',
                        style: TextStyle(color: grey5, fontSize: 16),
                      ),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => TrustedContacts()),
                      leading: Icon(
                        ctrl.safetyicons[0],
                        color: black,
                      ),
                      title: Text(ctrl.safety[0]),
                      subtitle: Text(ctrl.safetysubtitle[0]),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => VerifyTrip()),
                      leading: Icon(
                        ctrl.safetyicons[1],
                        color: black,
                      ),
                      title: Text(ctrl.safety[1]),
                      subtitle: Text(ctrl.safetysubtitle[1]),
                    ),
                    ListTile(
                      onTap: () => Get.to(() => RideCheck()),
                      leading: Icon(
                        ctrl.safetyicons[2],
                        color: black,
                      ),
                      title: Text(ctrl.safety[2]),
                      subtitle: Text(ctrl.safetysubtitle[2]),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'Family',
                        style: TextStyle(color: grey5, fontSize: 16),
                      ),
                    ),
                    Column(
                      children: [
                        ListTile(
                          onTap: () => Get.to(() => SetupFamily()),
                          title: Text(
                            ctrl.family[0],
                            style: const TextStyle(color: Colors.blue),
                          ),
                          subtitle: Text(ctrl.familysubs[0]),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: Divider(),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ListTile(
                          onTap: () => Get.to(() => Security_Screen()),
                          title: Text(
                            ctrl.family[1],
                            style: const TextStyle(color: black),
                          ),
                          subtitle: Text(ctrl.familysubs[1]),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 0.0),
                          child: Divider(),
                        ),
                      ],
                    ),
                    ListTile(
                      onTap: () {
                        authctrl.signout();
                      },
                      title: Text(
                        'Sign out',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
