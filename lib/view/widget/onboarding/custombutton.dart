import 'package:app01/controller/onboarding_controller.dart';
import 'package:app01/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: MaterialButton(
        height: 40,
        onPressed: () {
          controller.next();
        },
        color: AppColor.primaryColor,
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 90),
        child: Text("8".tr),
      ),
    );
  }
}
