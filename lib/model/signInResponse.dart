// To parse this JSON data, do
//
//     final signInResponse = signInResponseFromMap(jsonString);

import 'dart:convert';

SignInResponse signInResponseFromMap(String str) =>
    SignInResponse.fromMap(json.decode(str));

String signInResponseToMap(SignInResponse data) => json.encode(data.toMap());

class SignInResponse {
  SignInResponse({
    required this.password,
    required this.email,
    required this.accessToken,
  });

  final String accessToken;
  final String email;
  final String password;
  factory SignInResponse.fromMap(Map<String, dynamic> json) => SignInResponse(
        password: json["password"],
        accessToken: json["access_token"],
        email: json["email"],
      );

  Map<String, dynamic> toMap() => {
        "password": password,
        "email": email,
        "access_token": accessToken,
      };

  @override
  String toString() {
    return this.accessToken + this.password + this.email;
  }
}
