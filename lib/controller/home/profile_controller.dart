import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProfileController extends GetxController {
  logOff();
  getInfo();
  resetPassword();
  about();
  contactUs();
  editProfile();
}

class ProfileControllerImp extends ProfileController {
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  String? firstname;
  String? myEmail;

  @override
  logOff() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }

  getInfo() {
    firstname = myServices.sharedPreferences.getString("firstname");
    myEmail = myServices.sharedPreferences.getString("email");
  }

  @override
  void onInit() {
    getInfo();
    super.onInit();
  }

  @override
  resetPassword() {
    Get.offAllNamed(AppRoute.forgetPassword);
  }

  @override
  about() {
    Get.defaultDialog(
      title: 'About Us',
      titleStyle:
          TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: 24),
      middleText:
          'Sharjah Broadcasting Authority,\n Alsharqya From Kalba TV,\n IT Teams, \n App Ver: 1.0.0.1',
      middleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 1,
          textBaseline: TextBaseline.alphabetic),
      backgroundColor: AppColor.secoundColor,
    );
  }

  @override
  contactUs() {
    Get.defaultDialog(
      title: 'Contact Us',
      titleStyle:
          TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: 24),
      middleText: 'IT Teams \n Email: shq.it@sba.net.ae \n Phone: +971xxxxxxx',
      middleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 2,
          textBaseline: TextBaseline.alphabetic),
      backgroundColor: AppColor.secoundColor,
    );
  }

  @override
  editProfile() {
    Get.defaultDialog(
      title: 'Edit Personal Info',
      titleStyle:
          TextStyle(color: AppColor.primaryColor, fontWeight: FontWeight.bold, fontSize: 24),
      middleText:
          'Now is Disabled \n pleas contact with \n IT Teams \n Email: shq.it@sba.net.ae \n Phone: +971xxxxxxx',
      middleTextStyle: TextStyle(
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          letterSpacing: 2,
          textBaseline: TextBaseline.alphabetic),
      backgroundColor: AppColor.secoundColor,
    );
  }
}
