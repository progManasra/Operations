import 'package:app01/controller/auth/successresetpassword_controller.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/widget/Auth/custombuttomauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(220, 253, 253, 253),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "32".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.check_circle_outline,
                size: 250,
                color: AppColor.primaryColor,
              ),
            ),
            Spacer(),
            Text("36".tr),
            Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtomAuth(
                text: '26'.tr,
                onPressed: () {
                  controller.goToPageLogin();
                },
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
    ;
  }
}
