import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:uber_ui/model/otpresponse.dart';

Future sendOtp(
    {required String devicetype,
    required String deviceId,
    required String deviceToken,
    required String phone,
    required String countryCode}) async {
  
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://modesweden.se/api/user/verify/phone'));
  request.fields.addAll({
    'device_type': devicetype,
    'device_id': deviceId,
    'device_token': deviceToken,
    'mobile': phone,
    'country_code': countryCode,
  });

  // request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var data = await response.stream.bytesToString();
    // print(await response.stream.bytesToString());
    print(await jsonDecode(data.toString()));

    var model = await jsonDecode(data.toString());
    return model;
  } else {
    return response.statusCode;
    print(response.reasonPhrase);
  }
}
