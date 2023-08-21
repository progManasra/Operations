import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class InboxController extends GetxController {}

class InboxControllerImp extends InboxController {
  MyServices myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
}
