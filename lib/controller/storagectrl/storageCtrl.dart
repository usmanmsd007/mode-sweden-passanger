import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber_ui/model/signInResponse.dart';

class StorageController {
  // var prefs=await SharedPreferences.getInstance();
  static Future<bool> storeSignInCredentials(
      {required String email,
      required String password,
      required String token}) async {
    var prefs = await SharedPreferences.getInstance();
    if (await prefs.setString('email', email) ||
        await prefs.setString('password', password) ||
        await prefs.setString('token', email)) {
      return true;
    } else {
      return false;
    }
  }

  static Future<SignInResponse> getSignInCredentials() async {
    var prefs = await SharedPreferences.getInstance();
    Future.delayed(Duration(seconds: 1));
    // String email=prefs.getString('email')??"";
    return SignInResponse(
        email: prefs.getString('email') ?? "",
        password: prefs.getString('password') ?? "",
        accessToken: prefs.getString('token') ?? "");
  }
}
