// ignore_for_file: deprecated_member_use

import 'package:app01/controller/auth/verfiycodesignup_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/widget/Auth/customtextbodyauth.dart';
import 'package:app01/view/widget/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(220, 253, 253, 253),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "41".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<VerifyCodeSignUpControllerImp>(builder: (controller) {
        return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: ListView(
                children: [
                  //LogoAuth(),
                  CustomTextTitleAuth(
                    text: '42',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextBodyAuth(
                    text: '29'.tr,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  OtpTextField(
                    fieldWidth: 45,
                    numberOfFields: 5,
                    borderRadius: BorderRadius.circular(20),
                    borderColor: Color.fromARGB(255, 247, 146, 31),
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),

                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
