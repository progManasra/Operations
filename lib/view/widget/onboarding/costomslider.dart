// ignore_for_file: deprecated_member_use

import 'package:app01/controller/onboarding_controller.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSliderOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomSliderOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller.pageController,
      onPageChanged: (value) {
        controller.onPageChanged(value);
      },
      itemCount: OnBoardingList.length,
      itemBuilder: (context, i) => Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            OnBoardingList[i].title!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: AppColor.black),
          ),
          SizedBox(
            height: 30,
          ),
          Image.asset(
            OnBoardingList[i].image!,
            height: Get.height / 2.3,
            width: Get.width / 1.5,
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text(
                OnBoardingList[i].body!,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText1,
              )),
        ],
      ),
    );
  }
}
