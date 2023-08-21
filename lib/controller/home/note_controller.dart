import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/notification/notification_data.dart';
import 'package:flutter/material.dart';
import 'package:app01/core/constant/routes.dart';

import 'package:get/get.dart';

abstract class NoteController extends GetxController {
  backToHome();
  goToDetails();
  getInitData();
}

class NoteControllerImp extends NoteController {
  MyServices myService = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  NoteData noteData = NoteData(Get.find());
  List Data = [];
  String? ResvID;
  @override
  backToHome() {
    Get.toNamed(AppRoute.homepage);
  }

  @override
  goToDetails() {
    Get.offAndToNamed(AppRoute.OrderViewdetails, arguments: {
      "resID": ResvID.toString(),
    });
  }

  @override
  void onInit() {
    getInitData();
    super.onInit();
  }

  @override
  getInitData() async {
    Data.clear();
    statusRequest = StatusRequest.loading;
    var response = await noteData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        Data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
