// ignore_for_file: deprecated_member_use

import 'package:app01/controller/auth/signup_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/alertexitapp.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/widget/Auth/custombuttomauth.dart';
import 'package:app01/view/widget/Auth/customtextbodyauth.dart';
import 'package:app01/view/widget/Auth/customtextformauth.dart';
import 'package:app01/view/widget/Auth/customtexttitleauth.dart';
import 'package:app01/view/widget/Auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(220, 253, 253, 253),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "17".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<SignUpControllerImp>(builder: (controller) {
          return HandlingDataRequest(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      //LogoAuth(),
                      CustomTextTitleAuth(
                        text: '3',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomTextBodyAuth(
                        text: '4',
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 3, 100, "firstname");
                        },
                        hinttext: '47'.tr,
                        labletext: '50'.tr,
                        iconData: Icons.person_outline_outlined,
                        mycontroller: controller.firstname,
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 3, 100, "lastname");
                        },
                        hinttext: '48'.tr,
                        labletext: '51'.tr,
                        iconData: Icons.person_outline_outlined,
                        mycontroller: controller.lastname,
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 3, 100, "profile");
                        },
                        hinttext: '49'.tr,
                        labletext: '49'.tr,
                        iconData: Icons.card_membership_outlined,
                        mycontroller: controller.profile,
                        isNumber: true,
                      ),

                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 100, "email");
                        },
                        hinttext: '12'.tr,
                        labletext: '18'.tr,
                        iconData: Icons.email_outlined,
                        mycontroller: controller.email,
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 100, "phone");
                        },
                        hinttext: '22'.tr,
                        labletext: '21'.tr,
                        iconData: Icons.phone_android_outlined,
                        mycontroller: controller.phone,
                        isNumber: true,
                      ),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 100, "password");
                        },
                        hinttext: '13'.tr,
                        labletext: '19'.tr,
                        iconData: Icons.lock_open_outlined,
                        mycontroller: controller.password,
                        isNumber: false,
                      ),
                      CustomTextFormAuth(
                        valid: (val) {
                          return validInput(val!, 5, 100, "password");
                        },
                        hinttext: '40'.tr,
                        labletext: '40'.tr,
                        iconData: Icons.lock_open_outlined,
                        mycontroller: controller.password,
                        isNumber: false,
                      ),
                      CustomButtomAuth(
                        text: '17'.tr,
                        onPressed: () {
                          controller.signUp();
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomTextSignUpOrSignIn(
                        textone: '25'.tr,
                        texttwo: '26'.tr,
                        onTap: () {
                          controller.goToSignIn();
                        },
                      ),
                    ],
                  ),
                ),
              ));
        }),
      ),
    );
  }
}
