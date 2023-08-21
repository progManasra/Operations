// ignore_for_file: deprecated_member_use

import 'package:app01/controller/forgetpassword/resetpassword_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/widget/Auth/custombuttomauth.dart';
import 'package:app01/view/widget/Auth/customtextbodyauth.dart';
import 'package:app01/view/widget/Auth/customtextformauth.dart';
import 'package:app01/view/widget/Auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(220, 253, 253, 253),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "39".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: GetBuilder<ResetPasswordControllerImp>(builder: (controller) {
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
                      text: '35'.tr,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextBodyAuth(
                      text: '34'.tr,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 100, "password");
                      },
                      hinttext: '34'.tr,
                      labletext: '19'.tr,
                      iconData: Icons.lock_open,
                      mycontroller: controller.password,
                      isNumber: false,
                    ),
                    CustomTextFormAuth(
                      valid: (val) {
                        return validInput(val!, 5, 100, "password");
                      },
                      hinttext: '39'.tr,
                      labletext: '39'.tr,
                      iconData: Icons.lock_open,
                      mycontroller: controller.repassword,
                      isNumber: false,
                    ),
                    CustomButtomAuth(
                      text: '33'.tr,
                      onPressed: () {
                        controller.goToSuccessResetPassword();
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
