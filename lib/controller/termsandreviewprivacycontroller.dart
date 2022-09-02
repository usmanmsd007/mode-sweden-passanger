import 'package:get/get.dart';

class TermsandReviewPrivacyController extends GetxController {
  RxBool checked = false.obs;
  void setChecked(bool v) {
    checked.value = v;
    update();
  }
}
