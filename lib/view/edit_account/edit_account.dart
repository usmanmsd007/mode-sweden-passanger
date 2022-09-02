import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uber_ui/public/public.dart';
import 'package:uber_ui/view/edit_account/widgets/edit_accountwidgets.dart';

import '../../controller/profileScreenCtrl/profileScreenCtrl.dart';

class EditAccount extends StatelessWidget {
  EditAccount({Key? key}) : super(key: key);

  var profilectrl = Get.find<ProfileScreenController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(leading: Icon(arrow_back),backgroundColor: black,),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: black,
            leading: InkWell(onTap: () => Get.back(), child: Icon(arrow_back)),
            flexibleSpace: FlexibleSpaceBar(title: Text('Edit Account')),
            pinned: true,
            expandedHeight: Get.height / 7,
          ),
          SliverFillRemaining(
            child: Obx(
              () => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ProfileCircleAvatar(),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, top: 15, bottom: 15, right: 10.0),
                      child: Column(
                        children: [
                          ProfileTextFieldWidget(
                            ontap: () {
                              Get.to(ResetDialog(
                                firstName: profilectrl.model.value.firstName,
                                i: 1,
                                text: profilectrl.model.value.firstName,
                                btnText: 'Save',
                                hint: 'First Name',
                              ));
                            },
                            text: profilectrl.model.value.firstName,
                            hint: 'First Name',
                          ),
                          SizedBox(
                            height: Get.height / 16,
                          ),
                          ProfileTextFieldWidget(
                            ontap: () {
                              Get.to(ResetDialog(
                                i: 2,
                                text: profilectrl.model.value.lastName,
                                firstName: profilectrl.model.value.firstName,
                                btnText: 'Save',
                                hint: 'Last Name',
                              ));
                            },
                            hint: 'Last Name',
                            text: profilectrl.model.value.lastName,
                          ),
                          SizedBox(
                            height: Get.height / 16,
                          ),
                          ProfileEmailWidget(
                            verified: false,
                            onpress: () {
                              Get.to(() => PhoneResetDialog(
                                    firstname:
                                        profilectrl.model.value.firstName,
                                    countryCode:
                                        profilectrl.model.value.countryCode,
                                    phone: profilectrl.model.value.mobile,
                                    btnText: 'Save',
                                  ));
                            },
                            text: "Phone Number",
                            data: profilectrl.model.value.countryCode +
                                profilectrl.model.value.mobile,
                          ),
                          SizedBox(
                            height: Get.height / 16,
                          ),
                          ProfileEmailWidget(
                            onpress: () => Get.to(() => ResetDialog(
                                  firstName: profilectrl.model.value.firstName,
                                  i: 3,
                                  text: profilectrl.model.value.email,
                                  isEmail: true,
                                  btnText: 'Verify',
                                  hint: 'Confirm your email address',
                                  lastName: profilectrl.model.value.lastName,
                                )),
                            data: profilectrl.model.value.email,
                            text: "Email",
                            isPhone: false,
                          ),
                          SizedBox(
                            height: Get.height / 16,
                          ),
                          ProfileTextFieldWidget(
                            text: "********",
                            ontap: () => Get.to(
                              () => PasswordResetDialog(),
                              // fullscreenDialog: true
                            ),
                            isPassword: true,
                            hint: "Password",
                          ),
                          SizedBox(
                            height: Get.height / 16,
                          ),
                          Column(
                            children: [
                              SocialButtons(
                                ontap: () {},
                                path: 'assets/googleicon.png',
                                text: 'Add Google Account',
                              ),
                              SocialButtons(
                                ontap: () {},
                                text: 'Add Facebook Account',
                                path: 'assets/fbicon.png',
                              )
                            ],
                          )
                        ],
                      ),
                    )
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
