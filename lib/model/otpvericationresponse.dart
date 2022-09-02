// To parse this JSON data, do
//
//     final otpVerification = otpVerificationFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

OtpVerification otpVerificationFromMap(String str) =>
    OtpVerification.fromMap(json.decode(str));

String otpVerificationToMap(OtpVerification data) => json.encode(data.toMap());

class OtpVerification {
  OtpVerification({
    required this.status,
    required this.message,
    required this.user,
  });

  final bool status;
  final String message;
  final User user;

  factory OtpVerification.fromMap(Map<String, dynamic> json) => OtpVerification(
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
    required this.firstName,
    required this.lastName,
    required this.paymentMode,
    required this.id,
    required this.userType,
    required this.gender,
    required this.countryCode,
    required this.mobile,
    required this.picture,
    required this.deviceToken,
    required this.deviceId,
    required this.deviceType,
    required this.loginBy,
    required this.socialUniqueId,
    required this.latitude,
    required this.longitude,
    required this.stripeCustId,
    required this.walletBalance,
    required this.rating,
    required this.otp,
    required this.language,
    required this.qrcodeUrl,
    required this.referralUniqueId,
    required this.referalCount,
    required this.updatedAt,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String paymentMode;
  final String userType;
  final String gender;
  final String countryCode;
  final String mobile;
  final dynamic picture;
  final String deviceToken;
  final String deviceId;
  final String deviceType;
  final String loginBy;
  final dynamic socialUniqueId;
  final dynamic latitude;
  final dynamic longitude;
  final dynamic stripeCustId;
  final int walletBalance;
  final String rating;
  final int otp;
  final dynamic language;
  final dynamic qrcodeUrl;
  final dynamic referralUniqueId;
  final int referalCount;
  final DateTime updatedAt;

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        paymentMode: json["payment_mode"],
        userType: json["user_type"],
        gender: json["gender"],
        countryCode: json["country_code"],
        mobile: json["mobile"],
        picture: json["picture"],
        deviceToken: json["device_token"],
        deviceId: json["device_id"],
        deviceType: json["device_type"],
        loginBy: json["login_by"],
        socialUniqueId: json["social_unique_id"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        stripeCustId: json["stripe_cust_id"],
        walletBalance: json["wallet_balance"],
        rating: json["rating"],
        otp: json["otp"],
        language: json["language"],
        qrcodeUrl: json["qrcode_url"],
        referralUniqueId: json["referral_unique_id"],
        referalCount: json["referal_count"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "payment_mode": paymentMode,
        "user_type": userType,
        "gender": gender,
        "country_code": countryCode,
        "mobile": mobile,
        "picture": picture,
        "device_token": deviceToken,
        "device_id": deviceId,
        "device_type": deviceType,
        "login_by": loginBy,
        "social_unique_id": socialUniqueId,
        "latitude": latitude,
        "longitude": longitude,
        "stripe_cust_id": stripeCustId,
        "wallet_balance": walletBalance,
        "rating": rating,
        "otp": otp,
        "language": language,
        "qrcode_url": qrcodeUrl,
        "referral_unique_id": referralUniqueId,
        "referal_count": referalCount,
        "updated_at": updatedAt.toIso8601String(),
      };
}
