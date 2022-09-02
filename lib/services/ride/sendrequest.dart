import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future sendRequest({
  required double slat,
  required double slng,
  required double dlat,
  required double dlng,
  required double distnace,
}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('token');
  try {
    var headers = {'Authorization': 'Bearer $token'};
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://modesweden.se/api/user/send/request'));
    request.fields.addAll({
      's_latitude': slat.toString(),
      'd_latitude': dlat.toString(),
      's_longitude': slng.toString(),
      'd_longitude': dlng.toString(),
      'service_type': '1',
      'distance': distnace.toString()
    });

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      var result = jsonDecode(res);
      return result;
    } else {
      Get.snackbar('Error', response.reasonPhrase!,
          snackPosition: SnackPosition.BOTTOM);
    }
  } catch (e) {
    Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
  }
}
