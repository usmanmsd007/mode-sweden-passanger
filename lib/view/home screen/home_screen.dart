import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uber_ui/controller/home_screen_controller.dart';
import 'package:uber_ui/controller/mapController.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/home%20screen/widgets/bottom_sheet_trip.dart';
import 'package:uber_ui/view/home%20screen/widgets/card.dart';
import 'package:uber_ui/view/home%20screen/widgets/profileicon.dart';
import 'package:uber_ui/view/home%20screen/widgets/riderbox.dart';
import 'package:uber_ui/view/pickup%20points/pickuppoint.dart';
import 'package:uber_ui/view/profile/profile.dart';
import 'package:uber_ui/view/savedplaces/savedPlaces.dart';
import '../../widgets/mywidgets.dart';
import '../Package Screen/packages_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var ctrl = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProfileIcon(
                    ontap: () {
                      Get.to(
                        () => ProfileWidget(),
                      );
                    },
                  )
                ],
              ),
              const WelcomeToModeCard(),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RideBox(
                    ontap: () {
                      Get.to(() => PickUpPoint());
                    },
                    text: 'Ride',
                    pathtoicon: "assets/car.png",
                  ),
                  RideBox(
                    ontap: () => Get.to(() => const PackagesScreen()),
                    text: "Package",
                    pathtoicon: 'assets/packages.png',
                  )
                ],
              ),

              // )
              const SizedBox(
                height: 10,
              ),
              WhereToGo(
                onTextFieldTap: () {
                  Get.to(
                    () => PickUpPoint(),
                  );
                },
                onNowTap: () {
                  Get.bottomSheet(MyBottomSheet());
                },
              ),
              MyListTile(
                icon: Icons.star,
                text: "Choose a saved place",
                onpress: () {
                  Get.to(() => SavedPlaces());
                },
              ),
              MyListTile(
                icon: Icons.location_on,
                text: "Set a Destination on map",
                onpress: () {},
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                child: Divider(),
              ),
              TitleText(
                text: 'Around you',
                color: black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Container(
                  width: Get.width / 1.1,
                  height: Get.height / 2.5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Obx(
                      () => GoogleMap(
                          markers: {
                            Marker(
                                position: LatLng(
                                    ctrl.kGooglePlex.value.target.latitude,
                                    ctrl.kGooglePlex.value.target.longitude),
                                markerId: MarkerId('1'),
                                icon:
                                    BitmapDescriptor.defaultMarkerWithHue(80)),
                          },
                          mapType: MapType.normal,
                          initialCameraPosition: ctrl.kGooglePlex.value,
                          onMapCreated: (GoogleMapController controller) {
                            ctrl.controller.complete(controller);
                          }),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
