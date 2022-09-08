// To parse this JSON data, do
//
//     final profileModel = profileModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel profileModelFromMap(String str) =>
    ProfileModel.fromMap(json.decode(str));

String profileModelToMap(ProfileModel data) => json.encode(data.toMap());

class ProfileModel {
  ProfileModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.paymentMode,
    required this.userType,
    required this.gender,
    required this.countryCode,
    required this.mobile,
    required this.picture,
    required this.deviceToken,
    required this.deviceId,
    required this.deviceType,
    required this.loginBy,
    required this.email,
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
    required this.currency,
    required this.sos,
    required this.appContact,
    required this.measurement,
    required this.cash,
    required this.debitMachine,
    required this.voucher,
    required this.card,
    required this.payumoney,
    required this.paypal,
    required this.paypalAdaptive,
    required this.braintree,
    required this.paytm,
    required this.stripeSecretKey,
    required this.stripePublishableKey,
    required this.stripeCurrency,
    required this.payumoneyEnvironment,
    required this.payumoneyKey,
    required this.payumoneySalt,
    required this.payumoneyAuth,
    required this.paypalEnvironment,
    required this.paypalCurrency,
    required this.paypalClientId,
    required this.paypalClientSecret,
    required this.braintreeEnvironment,
    required this.braintreeMerchantId,
    required this.braintreePublicKey,
    required this.braintreePrivateKey,
    required this.referralCount,
    required this.referralAmount,
    required this.referralText,
    required this.referralTotalCount,
    required this.referralTotalAmount,
    required this.referralTotalText,
    required this.rideOtp,
    required this.rideToll,
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
  final String email;
  final dynamic socialUniqueId;
  final double latitude;
  final double longitude;
  final dynamic stripeCustId;
  final int walletBalance;
  final String rating;
  final int otp;
  final dynamic language;
  final String qrcodeUrl;
  final dynamic referralUniqueId;
  final int referalCount;
  final DateTime updatedAt;
  final String currency;
  final String sos;
  final String appContact;
  final String measurement;
  final int cash;
  final int debitMachine;
  final int voucher;
  final int card;
  final int payumoney;
  final int paypal;
  final int paypalAdaptive;
  final int braintree;
  final int paytm;
  final String stripeSecretKey;
  final String stripePublishableKey;
  final String stripeCurrency;
  final String payumoneyEnvironment;
  final String payumoneyKey;
  final String payumoneySalt;
  final String payumoneyAuth;
  final String paypalEnvironment;
  final String paypalCurrency;
  final String paypalClientId;
  final String paypalClientSecret;
  final String braintreeEnvironment;
  final String braintreeMerchantId;
  final String braintreePublicKey;
  final String braintreePrivateKey;
  final String referralCount;
  final String referralAmount;
  final String referralText;
  final String referralTotalCount;
  final int referralTotalAmount;
  final String referralTotalText;
  final int rideOtp;
  final int rideToll;

  factory ProfileModel.fromMap(Map<String, dynamic> json) => ProfileModel(
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
        email: json["email"],
        socialUniqueId: json["social_unique_id"],
        latitude: json["latitude"] ?? 0.0.toDouble(),
        longitude: json["longitude"] ?? 0.0.toDouble(),
        stripeCustId: json["stripe_cust_id"],
        walletBalance: json["wallet_balance"],
        rating: json["rating"],
        otp: json["otp"],
        language: json["language"],
        qrcodeUrl: json["qrcode_url"] ?? "",
        referralUniqueId: json["referral_unique_id"],
        referalCount: json["referal_count"],
        updatedAt: DateTime.parse(json["updated_at"]),
        currency: json["currency"],
        sos: json["sos"],
        appContact: json["app_contact"],
        measurement: json["measurement"],
        cash: json["cash"],
        debitMachine: json["debit_machine"],
        voucher: json["voucher"],
        card: json["card"],
        payumoney: json["payumoney"],
        paypal: json["paypal"],
        paypalAdaptive: json["paypal_adaptive"],
        braintree: json["braintree"],
        paytm: json["paytm"],
        stripeSecretKey: json["stripe_secret_key"],
        stripePublishableKey: json["stripe_publishable_key"],
        stripeCurrency: json["stripe_currency"],
        payumoneyEnvironment: json["payumoney_environment"],
        payumoneyKey: json["payumoney_key"],
        payumoneySalt: json["payumoney_salt"],
        payumoneyAuth: json["payumoney_auth"],
        paypalEnvironment: json["paypal_environment"],
        paypalCurrency: json["paypal_currency"],
        paypalClientId: json["paypal_client_id"],
        paypalClientSecret: json["paypal_client_secret"],
        braintreeEnvironment: json["braintree_environment"],
        braintreeMerchantId: json["braintree_merchant_id"],
        braintreePublicKey: json["braintree_public_key"],
        braintreePrivateKey: json["braintree_private_key"],
        referralCount: json["referral_count"],
        referralAmount: json["referral_amount"],
        referralText: json["referral_text"],
        referralTotalCount: json["referral_total_count"],
        referralTotalAmount: json["referral_total_amount"],
        referralTotalText: json["referral_total_text"],
        rideOtp: json["ride_otp"],
        rideToll: json["ride_toll"],
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
        "email": email,
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
        "currency": currency,
        "sos": sos,
        "app_contact": appContact,
        "measurement": measurement,
        "cash": cash,
        "debit_machine": debitMachine,
        "voucher": voucher,
        "card": card,
        "payumoney": payumoney,
        "paypal": paypal,
        "paypal_adaptive": paypalAdaptive,
        "braintree": braintree,
        "paytm": paytm,
        "stripe_secret_key": stripeSecretKey,
        "stripe_publishable_key": stripePublishableKey,
        "stripe_currency": stripeCurrency,
        "payumoney_environment": payumoneyEnvironment,
        "payumoney_key": payumoneyKey,
        "payumoney_salt": payumoneySalt,
        "payumoney_auth": payumoneyAuth,
        "paypal_environment": paypalEnvironment,
        "paypal_currency": paypalCurrency,
        "paypal_client_id": paypalClientId,
        "paypal_client_secret": paypalClientSecret,
        "braintree_environment": braintreeEnvironment,
        "braintree_merchant_id": braintreeMerchantId,
        "braintree_public_key": braintreePublicKey,
        "braintree_private_key": braintreePrivateKey,
        "referral_count": referralCount,
        "referral_amount": referralAmount,
        "referral_text": referralText,
        "referral_total_count": referralTotalCount,
        "referral_total_amount": referralTotalAmount,
        "referral_total_text": referralTotalText,
        "ride_otp": rideOtp,
        "ride_toll": rideToll,
      };
}
