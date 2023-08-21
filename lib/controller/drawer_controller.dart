import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class DrawerController extends GetxController {
  logOff();
  getInfo();
  resetPassword();
  backToHome();
}

class DrawerControllerImp extends DrawerController {
  MyServices myServices = Get.find();

  String? firstname;
  String? myEmail;

  @override
  logOff() {
    String userid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic("users");
    FirebaseMessaging.instance.unsubscribeFromTopic("users$userid");

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
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}



//DrawerController