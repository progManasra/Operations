import 'dart:convert';

import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_addcam_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderEditCamController extends GetxController {
  intailData();
  goToEditAudio();
  onchangeCamera(String value);
  onchangeLenses(String value);
  onchangeGimbal(String value);
  onchangeDron(String value);
  onchangeCrain(String value);
  backToHome();
}

class OrderEditCamControllerImp extends OrderEditCamController {
  OrderAddCamData orderAddCamData = OrderAddCamData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController CameraNote;
  List cameraList = [];
  List GimbalList = [];
  List DronList = [];
  List CrainList = [];
  List LensesList = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  intailData() async {
    cameraList.clear();
    GimbalList.clear();
    DronList.clear();
    CrainList.clear();
    LensesList.clear();

    statusRequest = StatusRequest.loading;
    var response = await orderAddCamData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        cameraList.addAll(response['camera']);
        GimbalList.addAll(response['Gimbal']);
        DronList.addAll(response['Dron']);
        CrainList.addAll(response['Crain']);
        LensesList.addAll(response['Lenses']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
//--------initselectedItemsCamera---------
    myServices.sharedPreferences.getStringList('initselectedItemsCamera') == null
        ? selectedItemsCamera = []
        : selectedItemsCamera =
            myServices.sharedPreferences.getStringList('initselectedItemsCamera') as List<String>;
//--------initselectedItemsLenses---------
    myServices.sharedPreferences.getStringList('initselectedItemsLenses') == null
        ? selectedItemsLenses = []
        : selectedItemsLenses =
            myServices.sharedPreferences.getStringList('initselectedItemsLenses') as List<String>;
//--------initselectedItemsGimbal---------
    myServices.sharedPreferences.getStringList('initselectedItemsGimbal') == null
        ? selectedItemsGimbal = []
        : selectedItemsGimbal =
            myServices.sharedPreferences.getStringList('initselectedItemsGimbal') as List<String>;
//--------selectedItemsDron---------
    myServices.sharedPreferences.getStringList('initselectedItemsDron') == null
        ? selectedItemsDron = []
        : selectedItemsDron =
            myServices.sharedPreferences.getStringList('initselectedItemsDron') as List<String>;
//--------selectedItemsCrain---------
    myServices.sharedPreferences.getStringList('initselectedItemsCrain') == null
        ? selectedItemsCrain = []
        : selectedItemsCrain =
            myServices.sharedPreferences.getStringList('initselectedItemsCrain') as List<String>;
//-----------------------------------
    CameraNote =
        TextEditingController(text: myServices.sharedPreferences.getString('initCameraNote'));

    intailData();
    super.onInit();
  }

  List<String> selectedItemsCamera = [];
  List<String> selectedItemsLenses = [];
  List<String> selectedItemsGimbal = [];
  List<String> selectedItemsDron = [];
  List<String> selectedItemsCrain = [];

  @override
  goToEditAudio() {
    myServices.sharedPreferences.setString("selectedItemsCamera", selectedItemsCamera.toString());
    myServices.sharedPreferences.setString("selectedItemsLenses", selectedItemsLenses.toString());
    myServices.sharedPreferences.setString("selectedItemsGimbal", selectedItemsGimbal.toString());
    myServices.sharedPreferences.setString("selectedItemsDron", selectedItemsDron.toString());
    myServices.sharedPreferences.setString("selectedItemsCrain", selectedItemsCrain.toString());
    myServices.sharedPreferences.setString("CameraNote", CameraNote.text);
    Get.offAndToNamed(AppRoute.ordereditaudio);
  }

  @override
  onchangeCamera(value) {
    selectedItemsCamera = value as List<String>;
    update();
  }

  @override
  onchangeLenses(value) {
    selectedItemsLenses = value as List<String>;
    update();
  }

  @override
  onchangeGimbal(value) {
    selectedItemsGimbal = value as List<String>;
    update();
  }

  @override
  onchangeDron(value) {
    selectedItemsDron = value as List<String>;
    update();
  }

  @override
  onchangeCrain(value) {
    selectedItemsCrain = value as List<String>;
    update();
  }

  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
