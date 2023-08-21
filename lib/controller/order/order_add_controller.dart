import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_add_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderAddController extends GetxController {
  intailData();
  onchangeProduction(String value);
  onchangeOrderType(String value);
  goToAddCam();
  backToHome();
}

class OrderAddControllerImp extends OrderAddController {
  OrderAddData orderAddData = OrderAddData(Get.find());
  late TextEditingController OrderTitle;
  late TextEditingController OrderDisc;
  late String OrderStartDate;
  late String OrderStartTime;
  late String OrderStartDateTime;
  late String OrderEndtDate;
  late String OrderEndTime;
  late String OrderEndDateTime;
  List data_Order = [];
  List data_Production = [];
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  String? selectedValue_production_type;
  String? ProIndex;
  String? selectedValue_order_type;

  get response => null;

  @override
  intailData() async {
    data_Order.clear();
    data_Production.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderAddData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data_Order.addAll(response['Order_Type']);
        data_Production.addAll(response['Production_Type']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    OrderTitle = TextEditingController();
    OrderDisc = TextEditingController();
    OrderStartDate = DateTime.now().toString();
    OrderStartTime = DateTime.now().toString();
    OrderEndtDate = OrderStartDate;
    OrderEndTime = DateTime.now().toString();
    intailData();
    super.onInit();
  }

  @override
  goToAddCam() {
    OrderStartDateTime = OrderStartDate.substring(0, 10) + " " + OrderStartTime.substring(11, 19);
    //print(OrderStartDateTime);
    OrderEndDateTime = OrderEndtDate.substring(0, 10) + " " + OrderEndTime.substring(11, 19);
    //print(OrderEndDateTime);
    myServices.sharedPreferences.setString("OrderTitle", OrderTitle.text);
    myServices.sharedPreferences.setString("OrderDisc", OrderDisc.text);
    myServices.sharedPreferences.setString("OrderStartDateTime", OrderStartDateTime);
    myServices.sharedPreferences.setString("OrderEndDateTime", OrderEndDateTime);
    myServices.sharedPreferences
        .setString("selectedValue_production_type", selectedValue_production_type.toString());
    myServices.sharedPreferences
        .setString("selectedValue_order_type", selectedValue_order_type.toString());
    if (selectedValue_production_type == null || selectedValue_order_type == null) {
      Get.dialog(AlertDialog(
        title: Text("Production/Order Types: "),
        content: Text("Please Select Production/Order Types"),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Close"))
        ],
      ));
    } else {
      print("not empty");
      print(selectedValue_production_type);
      Get.toNamed(AppRoute.orderaddcam);
    }
  }

  @override
  onchangeProduction(value) {
    selectedValue_production_type = value as String;
    update();
  }

  @override
  onchangeOrderType(value) {
    selectedValue_order_type = value as String;
    update();
  }

  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
