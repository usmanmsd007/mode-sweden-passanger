import 'package:get/get.dart';
import 'package:uber_ui/model/profileModel.dart';
import 'package:uber_ui/services/profiledetails/profiledetailsservice.dart';

class ProfileScreenController extends GetxController {
  // late Rx<ProfileModel> model;
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    var json = await getProfileDetails();
    print(json);
    model.value = ProfileModel.fromMap(json);
    update();
  }

  Rx<ProfileModel> model = ProfileModel(
          id: 0,
          firstName: '',
          lastName: '',
          paymentMode: '',
          userType: '',
          gender: '',
          countryCode: '',
          mobile: '',
          picture: '',
          deviceToken: '',
          deviceId: '',
          deviceType: '',
          loginBy: '',
          email: '',
          socialUniqueId: '',
          latitude: 0.0,
          longitude: 0.0,
          stripeCustId: '',
          walletBalance: 0,
          rating: '',
          otp: 112233,
          language: '',
          qrcodeUrl: '',
          referralUniqueId: 0,
          referalCount: 0,
          updatedAt: DateTime.now(),
          currency: '',
          sos: '',
          appContact: '',
          measurement: '',
          cash: 0,
          debitMachine: 0,
          voucher: 0,
          card: 0,
          payumoney: 3,
          paypal: 0,
          paypalAdaptive: 0,
          braintree: 0,
          paytm: 0,
          stripeSecretKey: '',
          stripePublishableKey: '',
          stripeCurrency: '',
          payumoneyEnvironment: '',
          payumoneyKey: '',
          payumoneySalt: '',
          payumoneyAuth: '',
          paypalEnvironment: '',
          paypalCurrency: '',
          paypalClientId: '',
          paypalClientSecret: '',
          braintreeEnvironment: '',
          braintreeMerchantId: '',
          braintreePublicKey: '',
          braintreePrivateKey: '',
          referralCount: '',
          referralAmount: '',
          referralText: '',
          referralTotalCount: '',
          referralTotalAmount: 0,
          referralTotalText: '',
          rideOtp: 0,
          rideToll: 0)
      .obs;
}
