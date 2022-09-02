// To parse this JSON data, do
//
//     final otpResponse = otpResponseFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpResponse otpResponseFromMap(String str) =>
    OtpResponse.fromMap(json.decode(str));

String otpResponseToMap(OtpResponse data) => json.encode(data.toMap());

class OtpResponse {
  OtpResponse({
    required this.status,
    required this.message,
    required this.user,
  });

  final bool status;
  final String message;
  final User user;

  factory OtpResponse.fromMap(Map<String, dynamic> json) => OtpResponse(
        status: json["status"],
        message: json["message"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "user": user.toMap(),
      };
}

class User {
  User({
    required this.deviceType,
    required this.deviceId,
    required this.deviceToken,
    required this.mobile,
    required this.countryCode,
    required this.paymentMode,
    required this.referralUniqueId,
    required this.updatedAt,
    required this.id,
  });

  final String deviceType;
  final String deviceId;
  final String deviceToken;
  final String mobile;
  final String countryCode;
  final String paymentMode;
  final dynamic referralUniqueId;
  final DateTime updatedAt;
  final int id;

  factory User.fromMap(Map<String, dynamic> json) => User(
        deviceType: json["device_type"],
        deviceId: json["device_id"],
        deviceToken: json["device_token"],
        mobile: json["mobile"],
        countryCode: json["country_code"],
        paymentMode: json["payment_mode"],
        referralUniqueId: json["referral_unique_id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toMap() => {
        "device_type": deviceType,
        "device_id": deviceId,
        "device_token": deviceToken,
        "mobile": mobile,
        "country_code": countryCode,
        "payment_mode": paymentMode,
        "referral_unique_id": referralUniqueId,
        "updated_at": updatedAt.toIso8601String(),
        "id": id,
      };
}
