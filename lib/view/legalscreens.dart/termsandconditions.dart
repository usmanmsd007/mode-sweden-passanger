import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/widgets/mywidgets.dart';

import '../../public/public.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: yellow,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                arrow_back,
                color: black,
              ),
            ),
            expandedHeight: Get.height / 8,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text(
                'Terms and Conditions',
                style: TextStyle(color: black),
              ),
            ),
            pinned: true,
          ),
          SliverFillRemaining(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleText(text: '1. Contractual Relationship.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'These Mode Terms and Conditions govern your access and use of applications, content, products, and services made available by Mode, a private limited liability company established in the Netherlands, having its offices at Mr. Treublaan 7, 1097 DP, Amsterdam, the Netherlands, registered at the Amsterdam Chamber of Commerce under number 56317441 ("Mode") that enable you to arrange and schedule the delivery of package(s) (the \“Package(s)\”) to a designated address by independent third party providers of delivery services who have an agreement with Mode or its affiliates',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '2. Access and Use of Mode.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'This section sets out rights and obligations that apply to your use of Mode. These terms apply in addition to any other rights or obligations set out in the Terms.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '3. Payment.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'The charges for delivery of the Packages in accordance with the terms of Use will be presented to you in the Application and/or Website you use to access Mode . Mode reserves the right to facilitate payment for the reasonable charges associated with the delivery, return, redelivery or disposal of your Package on behalf of the Third Party Provider using any of your payment methods designated in your Account. Such amounts will be transferred by Mode to the applicable Third Party Provider. Unless otherwise specified by Mode, you acknowledge and agree that payment for delivery transactions may only be made by you using a digital or electronic payment method on file. For the avoidance of doubt cash payments are not accepted. Notwithstanding the foregoing, where Mode makes available the option to pay for the delivery of Packages in cash, you shall be responsible for paying the Third Party Provider.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '4. Limitation of Liability; Indemnity.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'Mode is not liable under or in relation to these  Terms including, but not limited to, liability in contract, tort (including negligence, misrepresentation), restitution or otherwise for any of the following ed to the use of Mode: (i) loss of profits; (ii) loss of sales or business; (iii) loss of agreements or contracts; (iv) loss of anticipated savings; (v) loss of use or corruption of software, data or information; (vi) loss of or damage to goodwill, (vii) indirect or consequential loss and (viii) Loss, theft, tampering or delay in regards to the Packages that you send using Mode.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '5. Termination.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'You acknowledge and agree that Mode  will be made available by Mode on a temporary basis. Accordingly, and unless terminated earlier in connection with the Services Agreement or the Terms, Mode may, in its sole discretion, terminate these Terms or discontinue Mode  at any time by giving you reasonable advance notice in writing.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '6. Privacy.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'Where applicable, you confirm that you have obtained consent from the sender and/or recipient to share their address details with Mode, and that their personal data will be processed in accordance with our Privacy Notice.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '7. Dispute Resolution Process.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'Mode may make available to users acting as consumers a mediation scheme for consumer disputes related to the Services or these Terms with a view to their amicable resolution. For any dispute of a contractual nature relating to these Terms which could not have been resolved in the context of a complaint previously submitted to Mode’s customer service, eligible consumers can submit complaints to the European Commission’s online dispute resolution platform accessible here pursuant to the Regulation (EU) No 524/2013 of 21 May 2013. Mode does not commit to using an online dispute resolution platform to resolve consumer disputes.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '8. Governing Law and Jurisdiction.'),
                    SizedBox(
                      height: Get.height / 20,
                    ),
                    Text(
                      'These Terms shall be exclusively governed by and construed in accordance with the laws of the Netherlands, excluding its rules on conflicts of laws, unless, if you reside in the EU, statutory consumer protection regulations in your country of residence contain provisions that are more beneficial for you, in which case those provisions may apply. The Vienna Convention on the International Sale of Goods of 1980 (CISG) shall not apply. You may bring judicial proceedings relating to these Terms before a competent Dutch court. If you reside in the EU you may also bring judicial proceedings relating to these Terms before the competent court of your country of residence. If you reside in the EU, we may only bring judicial proceedings against you in your country of residence, unless you are acting as a business in which case you agree to submit to the exclusive jurisdiction of the Dutch courts.',
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    TitleText(text: '9. General.'),
                    SizedBox(
                      height: Get.height / 15,
                    ),
                    Text(
                      'Mode may immediately terminate these Terms or any Services with respect to you, or generally cease offering or deny access to the Services or any portion thereof, at any time for any reason.',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
