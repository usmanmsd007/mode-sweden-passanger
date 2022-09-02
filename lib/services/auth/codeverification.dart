import 'dart:convert';

import 'package:http/http.dart' as http;

Future verifyOTP({required String otp, required int id}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://modesweden.se/api/user/verify/otp'));
  request.fields.addAll({'id': id.toString(), 'otp': otp});

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var xyz = await response.stream.bytesToString();
    var abc = jsonDecode(xyz);
    return abc;
  } else {
    return response.statusCode;
  }
}
