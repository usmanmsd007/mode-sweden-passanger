import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future getProfileDetails() async {
  var prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token')!;
  var headers = {
    'Authorization': 'Bearer $token',
  };
  var request = http.MultipartRequest(
      'GET', Uri.parse('https://modesweden.se/api/user/details'));
  request.fields.addAll({'device_type': 'ios'});

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var a = await response.stream.bytesToString();
    var b = jsonDecode(a);
    return b;
  } else {
    return response.statusCode;
    print(response.reasonPhrase);
  }
}
