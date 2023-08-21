import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_delete_data.dart';
import 'package:app01/data/datasource/remote/order_data/order_view_main_data.dart';
import 'package:app01/data/model/order/orderviewmain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderViewMainController extends GetxController {
  intialData();
  getOrders();
  goToViewDetails();
  goToAddOrder();
  goToEditOrder();
  deleteOrder();
  backToHome();
}

class OrderViewMainContrllerImp extends OrderViewMainController {
  OrderViewMainData orderViewMainData = OrderViewMainData(Get.find());
  OrderDeleteData OrderDelete = OrderDeleteData(Get.find());
  List data = [];

  late StatusRequest statusRequest;
  late StatusRequest statusRequestOnDel;

  MyServices myServices = Get.find();
  late String resID;
  @override
  goToEditOrder() {
    myServices.sharedPreferences.remove("initselectedItemsCamera");
    myServices.sharedPreferences.remove("initselectedItemsGimbal");
    myServices.sharedPreferences.remove("initselectedItemsDron");
    myServices.sharedPreferences.remove("initselectedItemsCrain");
    myServices.sharedPreferences.remove("initselectedItemsLenses");
    myServices.sharedPreferences.remove("initselectedItemsMic");
    myServices.sharedPreferences.remove("initselectedItemsAirBese");
    myServices.sharedPreferences.remove("initselectedItemsMixer");
    myServices.sharedPreferences.remove("initselectedItemslightUnit");
    myServices.sharedPreferences.remove("initselectedItemsLaptop");
    myServices.sharedPreferences.remove("initselectedItemsAutoCues");
    myServices.sharedPreferences.remove("initselectedEmpStudio");
    myServices.sharedPreferences.remove("initselectedEmpDirection");
    myServices.sharedPreferences.remove("initselectedEmpCamera");
    myServices.sharedPreferences.remove("initselectedEmpAudio");
    myServices.sharedPreferences.remove("initselectedEmpLight");
    myServices.sharedPreferences.remove("initselectedItemsDriver");
    myServices.sharedPreferences.remove("initselectedEmpProgram");
    myServices.sharedPreferences.remove("initselectedEmpReporter");
    myServices.sharedPreferences.remove("initselectedEmpOffice_Boy");
    myServices.sharedPreferences.remove("initselectedEmpCreative");
    myServices.sharedPreferences.remove("initselectedEmpCG");
    myServices.sharedPreferences.remove("initselectedEmpProduction");
    myServices.sharedPreferences.remove("initselectedEmpPresentor");
    myServices.sharedPreferences.remove("initselectedItemsDriver");
    myServices.sharedPreferences.remove("initselectedItemsTransportation");
    myServices.sharedPreferences.remove("initCameraNote");
    myServices.sharedPreferences.remove("initAudioNote");
    myServices.sharedPreferences.remove("initLightNote");
    myServices.sharedPreferences.remove("initEquipmentNote");
    myServices.sharedPreferences.remove("initEmployeeNote");
    myServices.sharedPreferences.remove("initLocationNote");
    myServices.sharedPreferences.remove("resID");
    Get.toNamed(AppRoute.OrderEdit, arguments: {
      "resID": resID,
    });
    myServices.sharedPreferences.setString("resID", resID);
  }

  @override
  goToViewDetails() {
    print(resID);
    myServices.sharedPreferences.setString("resID", resID);
    Get.toNamed(AppRoute.OrderViewdetails, arguments: {
      "resID": resID,
    });
  }

  @override
  deleteOrder() {
    Get.defaultDialog(
      title: "Delete Order, Are You Sure: ",
      //confirm: Text("Confirm"),
      textConfirm: "Confirm",
      onConfirm: () async {
        statusRequestOnDel = StatusRequest.loading;
        print(resID);
        var response = await OrderDelete.postData(resID.toString());
        statusRequestOnDel = handlingData(response);
        if (StatusRequest.success == statusRequestOnDel) {
          if (response['status'] == "success") {
          } else {
            statusRequestOnDel = StatusRequest.failure;
          }
        }
        update();
        Get.offAllNamed(AppRoute.orderviewmain);
      },
      textCancel: "Cancel",
      onCancel: () {
        Get.back();
        update();
      },
    );
  }

  @override
  getOrders() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderViewMainData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToAddOrder() {
    Get.offAndToNamed(AppRoute.orderadd);
  }

  @override
  intialData() {
    update();
    getOrders();
    update();
  }

  @override
  void onInit() {
    myServices.sharedPreferences.remove("initselectedItemsCamera");
    myServices.sharedPreferences.remove("initselectedItemsGimbal");
    myServices.sharedPreferences.remove("initselectedItemsDron");
    myServices.sharedPreferences.remove("initselectedItemsCrain");
    myServices.sharedPreferences.remove("initselectedItemsLenses");
    myServices.sharedPreferences.remove("initselectedItemsMic");
    myServices.sharedPreferences.remove("initselectedItemsAirBese");
    myServices.sharedPreferences.remove("initselectedItemsMixer");
    myServices.sharedPreferences.remove("initselectedItemslightUnit");
    myServices.sharedPreferences.remove("initselectedItemsLaptop");
    myServices.sharedPreferences.remove("initselectedItemsAutoCues");
    myServices.sharedPreferences.remove("initselectedEmpStudio");
    myServices.sharedPreferences.remove("initselectedEmpDirection");
    myServices.sharedPreferences.remove("initselectedEmpCamera");
    myServices.sharedPreferences.remove("initselectedEmpAudio");
    myServices.sharedPreferences.remove("initselectedEmpLight");
    myServices.sharedPreferences.remove("initselectedItemsDriver");
    myServices.sharedPreferences.remove("initselectedEmpProgram");
    myServices.sharedPreferences.remove("initselectedEmpReporter");
    myServices.sharedPreferences.remove("initselectedEmpOffice_Boy");
    myServices.sharedPreferences.remove("initselectedEmpCreative");
    myServices.sharedPreferences.remove("initselectedEmpCG");
    myServices.sharedPreferences.remove("initselectedEmpProduction");
    myServices.sharedPreferences.remove("initselectedEmpPresentor");
    myServices.sharedPreferences.remove("initselectedItemsDriver");
    myServices.sharedPreferences.remove("initselectedItemsTransportation");
    myServices.sharedPreferences.remove("initCameraNote");
    myServices.sharedPreferences.remove("initAudioNote");
    myServices.sharedPreferences.remove("initLightNote");
    myServices.sharedPreferences.remove("initEquipmentNote");
    myServices.sharedPreferences.remove("initEmployeeNote");
    myServices.sharedPreferences.remove("initLocationNote");

    intialData();
    super.onInit();
  }

  @override
  backToHome() {
    Get.offAndToNamed(AppRoute.homepage);
    throw UnimplementedError();
  }
}
