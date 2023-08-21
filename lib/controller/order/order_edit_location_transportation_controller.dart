import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_addlocation_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderEditLocationAndTransportationController extends GetxController {
  intailData();
  onchangeLocation(String value);
  onchangeTransportation(String value);
  onchangeDriver(String value);
  backToHome();
}

class OrderEditLocationAndTransportationControllerImp
    extends OrderEditLocationAndTransportationController {
  OrderAddLocationData orderAddData = OrderAddLocationData(Get.find());
  late TextEditingController LocationNote;
  List LocationList = [];
  List CarList = [];
  List DriverList = [];

  String? selectedItemsLocation;
  String? DefualtItemsLocation;

  List<String> selectedItemsTransportation = [];
  List<String> selectedItemsDriver = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  intailData() async {
    LocationList.clear();
    CarList.clear();
    DriverList.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderAddData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        LocationList.addAll(response['Location']); //  ['Location_Name']
        CarList.addAll(response['Car']); //  ['Car_Type']
        DriverList.addAll(response['Driver']); //  ['Employee_Email']
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    myServices.sharedPreferences.getStringList('initselectedItemsTransportation') == null
        ? selectedItemsTransportation = []
        : selectedItemsTransportation = myServices.sharedPreferences
            .getStringList('initselectedItemsTransportation') as List<String>;
//------
    myServices.sharedPreferences.getStringList('initselectedItemsDriver') == null
        ? selectedItemsDriver = []
        : selectedItemsDriver =
            myServices.sharedPreferences.getStringList('initselectedItemsDriver') as List<String>;
//------
    LocationNote =
        TextEditingController(text: myServices.sharedPreferences.getString('initLocationNote'));

    intailData();
    super.onInit();
  }

  @override
  goToAddSummary() {
    myServices.sharedPreferences
        .setString("selectedItemsLocation", selectedItemsLocation.toString());
    myServices.sharedPreferences
        .setString("selectedItemsTransportation", selectedItemsTransportation.toString());
    myServices.sharedPreferences.setString("selectedItemsDriver", selectedItemsDriver.toString());
    myServices.sharedPreferences.setString("LocationNote", LocationNote.text);
    if (selectedItemsLocation != null) {
      Get.offAndToNamed(AppRoute.ordereditsummary);
    } else {
      Get.dialog(AlertDialog(
        title: Text("Location: "),
        content: Text("Please Select Location"),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text("Close"))
        ],
      ));
    }
  }

  @override
  onchangeLocation(value) {
    selectedItemsLocation = value as String;
    update();
  }

  @override
  onchangeTransportation(value) {
    selectedItemsTransportation = value as List<String>;
    update();
  }

  @override
  onchangeDriver(value) {
    selectedItemsDriver = value as List<String>;
    update();
  }

  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
