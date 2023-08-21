import 'package:app01/controller/onboarding_controller.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    OnBoardingList.length,
                    (index) => AnimatedContainer(
                          margin: EdgeInsets.all(3),
                          duration: const Duration(milliseconds: 10),
                          width: controller.currentPage == index ? 20 : 6,
                          height: 6,
                          decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                        )),
              ],
            ));
  }
}
