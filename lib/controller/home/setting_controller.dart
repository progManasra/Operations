import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SettingController extends GetxController {}

class SettingControllerImp extends SettingController {
  MyServices myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
}
