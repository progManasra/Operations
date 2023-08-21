import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_add_data.dart';
import 'package:app01/data/datasource/remote/order_data/order_addequip_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderAddEquipmentController extends GetxController {
  intailData();
  onchangeLaptop(String value);
  onchangeAutoCues(String value);
  backToHome();
}

class OrderAddEquipmentControllerImp extends OrderAddEquipmentController {
  OrderAddEqiupData orderAddData = OrderAddEqiupData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController EquipmentNote;

  List laptopList = [];
  List AutoCuesList = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  intailData() async {
    laptopList.clear();
    AutoCuesList.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderAddData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        laptopList.addAll(response['laptop']);
        AutoCuesList.addAll(response['AutoCues']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    selectedItemsLaptop = [];
    selectedItemsAutoCues = [];
    EquipmentNote = TextEditingController();
    intailData();
    super.onInit();
  }

  @override
  goToAddemployee() {
    myServices.sharedPreferences.setString("selectedItemsLaptop", selectedItemsLaptop.toString());
    myServices.sharedPreferences
        .setString("selectedItemsAutoCues", selectedItemsAutoCues.toString());
    myServices.sharedPreferences.setString("EquipmentNote", EquipmentNote.text);
    print(selectedItemsLaptop);
    print(selectedItemsAutoCues);
    print(EquipmentNote.text);
    Get.toNamed(AppRoute.orderaddemployee);
  }

  @override
  onchangeLaptop(value) {
    selectedItemsLaptop = value as List<String>;
    update();
  }

  @override
  onchangeAutoCues(value) {
    selectedItemsAutoCues = value as List<String>;
    update();
  }

  List<String> selectedItemsLaptop = [];
  List<String> selectedItemsAutoCues = [];
  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
