import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uber_ui/public/public.dart';

Future getProfileDetails() async {
  var prefs = await SharedPreferences.getInstance();
  String token = prefs.getString(ACCESSTOKEN)!;
  print('this is the token $token');
  var headers = {
    'Authorization': 'Bearer $token',
  };
  // var headers = {
  // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdkOGE5NTMzMmViZWIyNzgwZGI4ZGRhZTgzMmJkYWJiY2Y4M2NlOGZhOTg5NGM2MjNiMmUxNjZiOTcyMTE5OWIwOGY3MzBjZjI0MjIzMGYwIn0.eyJhdWQiOiI4IiwianRpIjoiN2Q4YTk1MzMyZWJlYjI3ODBkYjhkZGFlODMyYmRhYmJjZjgzY2U4ZmE5ODk0YzYyM2IyZTE2NmI5NzIxMTk5YjA4ZjczMGNmMjQyMjMwZjAiLCJpYXQiOjE2NjIyOTExMzYsIm5iZiI6MTY2MjI5MTEzNiwiZXhwIjoxNjYzNTg3MTM2LCJzdWIiOiIyNiIsInNjb3BlcyI6W119.bF0vM85G0x0R8kjUxRMrLBEmU-ykzZHkTOYEKbb9VZHbLhzgXyBOe4cidyxeYwR7dbwIBTh1xvsBytenUJ8CNnGc3DvgqoAB8G8VbfTfxIw-8pfiOdrNiKFUETLkCxAJCaY0tPkKPoFPgoQPXs-cODjLpOWeeJI5R3VHhcvoJhaWX5ce3jDeUFpc1YjaoE4d_JtCvC-96Way4JQBHjQk3dmmltH0v_0MLgeYIjDkbT_neMB9LAWLFp6y-6b42uy46HYbgw_SX2RDSbtkcN9QJSjKYShr7sm7Pxyt5924in2vvqV61UUt2ENxnEovrcRtGdi67rnciLjwjR0QXwYbfjkxkzgJ-W7qfkm5gJov6X43VD8CFVXK4Rq90OTYri7avktgF5k47fIUUJf7OdxApd1NIiYPvLeXsvE5ybcguJK1-k8UOL9J-b9ChPXJsUMh2j2LZuN8l6UwEuUyZMxTLkoZTA0RF75HnRX4P0uoMmKNYKKyJSsN_3P5pfqhIksqm91HvIyoG2mcAHjnhLHp89UmjmoW8BBzszIWFp_rTGaONFN0qBFN4a6RYaGWMLlg6Uy6W0qwhDQvElRJ6eb3N2fqlVBJ-o8RFsE_ClQupmjRalVTXVj07PYwvl6Ot_h6kv2DUURVmbFmTmlB7JiuWxOxknJPdmDOFh5GYqv4yrY'
// };
  var request = http.MultipartRequest(
      'GET', Uri.parse('https://modesweden.se/api/user/details'));

  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    // print(await response.stream.bytesToString());
    var a = await response.stream.bytesToString();
    var b = jsonDecode(a);
    print(b.toString());
    return b;
  } else {
    print(response.reasonPhrase);
  }

  // var request = http.MultipartRequest(
  //     'GET', Uri.parse('https://modesweden.se/api/user/details'));
  // request.fields.addAll({'device_type': 'ios'});

  // request.headers.addAll(headers);

  // http.StreamedResponse response = await request.send();

  // if (response.statusCode == 200) {
  //   var a = await response.stream.bytesToString();
  //   var b = jsonDecode(a);
  //   return b;
  // } else {
  //   return response.statusCode;
  //   print(response.reasonPhrase);
  // }
}
