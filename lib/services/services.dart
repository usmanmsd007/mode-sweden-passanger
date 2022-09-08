import 'dart:convert';

import 'package:http/http.dart' as http;

Future signIn({
  required String device_token,
  required String device_id,
  required String device_type,
  required String username,
  required String password,
}) async {
  var request = http.MultipartRequest(
      'POST', Uri.parse('https://modesweden.se/api/user/oauth/token'));
  request.fields.addAll({
    'client_id': '8',
    'client_secret': 'Aq0ICvjI6IR73OeJ4faaf3ErMLmLZVBTkrnnIdDB',
    'password': password,
    'username': username,
    'device_type': device_type,
    'device_token': device_token,
    'device_id': device_id,
  });

  http.StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    var data = await response.stream.bytesToString();
    var json = jsonDecode(data);
    print("successful sign in" + json.toString());
    return json;
//
  } else {
    var data = await response.stream.bytesToString();
    var json = jsonDecode(data);
    print("error:" + json.toString());

//
  }
}

// Future signIn({required String username, required String password, required int id}) async {
//   var request = http.MultipartRequest(
//       'POST', Uri.parse('https://modesweden.se/api/user/oauth/token'));
//   request.fields.addAll({
//     'client_id': '8',
//     'client_secret': 'Aq0ICvjI6IR73OeJ4faaf3ErMLmLZVBTkrnnIdDB',
//     'grant_type': 'password',
//     'username': username,
//     'password': password,
//   });

//   http.StreamedResponse response = await request.send();

//   if (response.statusCode == 200) {
//     var data = await response.stream.bytesToString();
//     var json = jsonDecode(data);
//     return json;
//   } else {
//     var data = await response.stream.bytesToString();
//     var json = jsonDecode(data);
//     return json;
//   }
// }

Future<bool> signUp(
    {required String first_name,
    required String last_name,
    required String email,
    required String password,
    required String id}) async {
  try {
    var request = http.MultipartRequest(
        'POST', Uri.parse('https://modesweden.se/api/user/signup'));
    request.fields.addAll({
      'id': id.toString(),
      'first_name': first_name,
      'last_name': last_name,
      'password': password,
      'email': email,
    });

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var data = await response.stream.bytesToString();
      var abc = jsonDecode(data);
      print("register response" + abc.toString());
      return true;
    } else {
      print("error in sign up" + response.reasonPhrase.toString());
      var data = await response.stream.bytesToString();
      var abc = jsonDecode(data);
      print(abc);
      return false;
    }
  } catch (e) {
    print(e.toString());
    return false;
  }
}
