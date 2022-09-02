import 'package:get/get.dart';

class VerifyTripsController extends GetxController {
  RxBool verifyviapin = false.obs;
  setverifypin(bool v) {
    verifyviapin.value = v;
    update();
  }
}
