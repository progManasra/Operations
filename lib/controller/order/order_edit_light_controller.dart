import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_addlight_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderEditLightController extends GetxController {
  intailData();
  onchangelightUnit(String value);
  backToHome();
}

class OrderEditLightControllerImp extends OrderEditLightController {
  OrderAddLightData orderAddData = OrderAddLightData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController LightNote;
  List lighting_unitList = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  intailData() async {
    lighting_unitList.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderAddData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        lighting_unitList.addAll(response['lighting_unit']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    myServices.sharedPreferences.getStringList('initselectedItemslightUnit') == null
        ? selectedItemslightUnit = []
        : selectedItemslightUnit = myServices.sharedPreferences
            .getStringList('initselectedItemslightUnit') as List<String>;
//------

    LightNote =
        TextEditingController(text: myServices.sharedPreferences.getString('initLightNote'));

    intailData();
    super.onInit();
  }

  @override
  goToAddEquipment() {
    myServices.sharedPreferences
        .setString("selectedItemslightUnit", selectedItemslightUnit.toString());
    myServices.sharedPreferences.setString("LightNote", LightNote.text);
    // print(selectedItemslightUnit);
    // print(LightNote.text);
    Get.toNamed(AppRoute.ordereditequipment);
  }

  @override
  onchangelightUnit(value) {
    selectedItemslightUnit = value as List<String>;
    update();
  }

  List<String> selectedItemslightUnit = [];
  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
