import 'package:get/get.dart';

class RideCheckController extends GetxController {
  RxBool rideCheckNotifications = false.obs;
  setnotifications(bool v) {
    rideCheckNotifications.value = v;
    update();
  }
}
