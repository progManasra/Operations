// ignore_for_file: deprecated_member_use

import 'package:app01/controller/auth/login_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/alertexitapp.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/widget/Auth/custombuttomauth.dart';
import 'package:app01/view/widget/Auth/customtextbodyauth.dart';
import 'package:app01/view/widget/Auth/customtextformauth.dart';
import 'package:app01/view/widget/Auth/customtexttitleauth.dart';
import 'package:app01/view/widget/Auth/logoauth.dart';
import 'package:app01/view/widget/Auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(220, 253, 253, 253),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "9".tr,
          style: Theme.of(context).textTheme.displayLarge!.copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: GetBuilder<LoginControllerImp>(builder: (controller) {
          return HandlingDataRequest(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Form(
                key: controller.formstate,
                child: ListView(
                  children: [
                    LogoAuth(),
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
                        return validInput(val!, 5, 100, "email");
                      },
                      hinttext: '12'.tr,
                      labletext: '18'.tr,
                      iconData: Icons.email_outlined,
                      mycontroller: controller.email,
                      isNumber: false,
                    ),
                    GetBuilder<LoginControllerImp>(
                        builder: (controller) => CustomTextFormAuth(
                              obsecureText: controller.issowpassword,
                              onTapIcon: () {
                                controller.showPassword();
                              },
                              isNumber: false,
                              valid: (val) {
                                return validInput(val!, 5, 20, "password");
                              },
                              hinttext: '13'.tr,
                              labletext: '19'.tr,
                              iconData: Icons.lock_open,
                              mycontroller: controller.password,
                            )),
                    InkWell(
                      onTap: () {
                        controller.goToForgetPassword();
                      },
                      child: Text(
                        "14".tr,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    CustomButtomAuth(
                      text: '26'.tr,
                      onPressed: () {
                        controller.login();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextSignUpOrSignIn(
                      textone: "16".tr,
                      texttwo: "17".tr,
                      onTap: () {
                        controller.goToSignUp();
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
