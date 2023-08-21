import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/auth/login.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  late TextEditingController email;
  late TextEditingController password;
  bool issowpassword = true;
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  LoginData loginData = LoginData(Get.find());

  List data = [];

  showPassword() {
    issowpassword = issowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          myServices.sharedPreferences.setString("id", response['data']['Employee_ID']);
          String userid = myServices.sharedPreferences.getString("id")!;
          myServices.sharedPreferences
              .setString("firstname", response['data']['Employee_First_Name']);
          myServices.sharedPreferences.setString("email", response['data']['Employee_Email']);
          myServices.sharedPreferences.setString("phone", response['data']['Employee_Phone']);
          myServices.sharedPreferences
              .setString("permission", response['data']['Employee_Permission_ID']);
          myServices.sharedPreferences
              .setString("Employee_Dep_ID", response['data']['Employee_Dep_ID']);
          myServices.sharedPreferences.setString("step", "2");
          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users${userid}");

          Get.offNamed(AppRoute.homepage);
        } else {
          Get.defaultDialog(title: "Worning", middleText: "email or password is Wrong ...");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  goToSignUp() {
    Get.offNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("=============Token=============");
      print(value);
      print("=============Token=============");

      String? token = value;
    });
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.offNamed(AppRoute.forgetPassword);
  }
}
