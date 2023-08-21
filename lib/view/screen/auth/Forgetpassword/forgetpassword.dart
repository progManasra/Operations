// ignore_for_file: deprecated_member_use

import 'package:app01/controller/forgetpassword/forgetpassword_controller.dart';
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(220, 253, 253, 253),
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "14".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) {
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
                          text: '27'.tr,
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
                        CustomButtomAuth(
                          text: '30'.tr,
                          onPressed: () {
                            controller.checkemail();
                          },
                        ),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }
}
