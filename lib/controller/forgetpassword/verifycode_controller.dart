import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/data/datasource/remote/forgetpassword/verifycode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class VerifyCodeController extends GetxController {
  checkCode();
  goToResetPassword(String verfiycode);
}

class VerifyCodeControllerImp extends VerifyCodeController {
  String? email;
  StatusRequest statusRequest = StatusRequest.none;
  VerifyCodeFForgetPasswordData verifyCodeFForgetPasswordData =
      VerifyCodeFForgetPasswordData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  checkCode() {}

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }

  @override
  goToResetPassword(verfiycode) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifyCodeFForgetPasswordData.postData(email!, verfiycode);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offNamed(AppRoute.resetPassword, arguments: {"email": email});
      } else {
        Get.defaultDialog(
            title: "Worning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
