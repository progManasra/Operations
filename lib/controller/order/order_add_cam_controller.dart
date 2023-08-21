import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_add_data.dart';
import 'package:app01/data/datasource/remote/order_data/order_addcam_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderAddCamController extends GetxController {
  intailData();
  goToAddAudio();
  onchangeCamera(String value);
  onchangeLenses(String value);
  onchangeGimbal(String value);
  onchangeDron(String value);
  onchangeCrain(String value);
  backToHome();
}

class OrderAddCamControllerImp extends OrderAddCamController {
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
        //print(cameraList);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    selectedItemsCamera = [];
    selectedItemsLenses = [];
    selectedItemsGimbal = [];
    selectedItemsDron = [];
    selectedItemsCrain = [];
    CameraNote = TextEditingController();
    intailData();
    super.onInit();
  }

  List<String> selectedItemsCamera = [];
  List<String> selectedItemsLenses = [];
  List<String> selectedItemsGimbal = [];
  List<String> selectedItemsDron = [];
  List<String> selectedItemsCrain = [];

  @override
  goToAddAudio() {
    // print("=========selectedItemsCamera=======");
    // print(selectedItemsCamera.toList());
    // print("=========selectedItemsLenses=======");
    // print(selectedItemsLenses.toList());
    // print("=========selectedItemsGimbal=======");
    // print(selectedItemsGimbal.toList());
    // print("=========selectedItemsDron=======");
    // print(selectedItemsDron.toList());
    // print("=========selectedItemsCrain=======");
    // print(selectedItemsCrain.toList());
    myServices.sharedPreferences.setString("selectedItemsCamera", selectedItemsCamera.toString());
    myServices.sharedPreferences.setString("selectedItemsLenses", selectedItemsLenses.toString());
    myServices.sharedPreferences.setString("selectedItemsGimbal", selectedItemsGimbal.toString());
    myServices.sharedPreferences.setString("selectedItemsDron", selectedItemsDron.toString());
    myServices.sharedPreferences.setString("selectedItemsCrain", selectedItemsCrain.toString());
    myServices.sharedPreferences.setString("CameraNote", CameraNote.text);

    // print(selectedItemsCamera);
    // print(selectedItemsLenses);
    // print(selectedItemsGimbal);
    // print(selectedItemsDron);
    // print(selectedItemsCrain);
    // print(CameraNote.text);

    Get.toNamed(AppRoute.orderaddaudio);
  }

  @override
  onchangeCamera(value) {
    selectedItemsCamera = value as List<String>;
    update();
    // print("=========selectedItemsCamera=======");
    // print(selectedItemsCamera);
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
