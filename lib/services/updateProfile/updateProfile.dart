import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UpdateProfile {
  static Future updateFirstName({required String firstName}) async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://modesweden.se/api/user/update/profile'));
    request.fields.addAll({
      'first_name': firstName,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var a = await response.stream.bytesToString();
      var b = jsonDecode(a);
      return b;
    } else {
      return response.statusCode;
    }
  }

  static Future updateLastName(
      {required String lastName, required String first_name}) async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;

    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://modesweden.se/api/user/update/profile'));
    request.fields.addAll({
      'last_name': lastName,
      'first_name': first_name,
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var a = await response.stream.bytesToString();
      var b = jsonDecode(a);
      print("This is b" + b.toString());
      print(b['message']);
      return b;
    } else {
      return response.statusCode;
    }
  }

  static updateEmail({required String email, required String firstName}) async {
    var prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token')!;
    var headers = {
      'Authorization': 'Bearer $token',
    };
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://modesweden.se/api/user/update/profile'));
    request.fields.addAll({'first_name': firstName, 'email': email});

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future updatePhone(
      {required String phoneNo,
      required first_name,
      required String countryCode}) async {
    var prefs = await SharedPreferences.getInstance();

    String token = prefs.getString('token')!;
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://modesweden.se/api/user/update/profile'));
    request.fields.addAll({
      'first_name': first_name,
      'country_code': countryCode,
      'mobile': phoneNo
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  static Future udpatePassword(
      {required String password, required String firstname}) async {}
}
