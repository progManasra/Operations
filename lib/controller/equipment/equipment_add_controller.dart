import 'dart:io';

import 'package:app01/controller/equipment/equipment_view_by_dept_controller.dart';
import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/functions/uploadfile.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/equipment/equipment_add_edit_del_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EquipmentAddController extends GetxController {
  intialData();
  goToEquipmentViewDetails();
  backToHome();
  onChangeDep(String Value);
  sendData();
}

class EquipmentAddControllerImp extends EquipmentAddController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController? Equipment_Name_Controller;
  TextEditingController? Equipment_Serial_Number_Controller;
  TextEditingController? Equipment_Barcode_Controller;
  TextEditingController? Equipment_Specification_Controller;
  TextEditingController? Equipment_Model_Number_Controller;

  EquipmentAddEditDelData equipmentAddEditDelData = EquipmentAddEditDelData(Get.find());
  List DataEqipDept = [];
  List DataEqipCat = [];

  late StatusRequest statusRequest = StatusRequest.none;
  //StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  String? EquipID;

  @override
  goToEquipmentViewDetails() {
    //Get.toNamed(AppRoute.orderadd);
  }

  String? selectedValueDept;
  String? selectedValueDeptID;

  onChangeDep(Value) {
    selectedValueDept = Value as String;
    DataEqipDept.forEach((element) {
      if (element['Dep_Name'] == selectedValueDept) selectedValueDeptID = element['Dep_ID'];
    });

    update();
  }

  String? selectedValueCat;
  String? selectedValueCatID;

  onChangeCat(Value) {
    selectedValueCat = Value as String;
    DataEqipCat.forEach((element) {
      if (element['Equipment_Cat_Name'] == selectedValueCat)
        selectedValueCatID = element['Equipment_Cat_ID'];
    });

    update();
  }

  @override
  intialData() async {
    statusRequest = StatusRequest.loading;
    DataEqipDept.clear();
    DataEqipCat.clear();
    var response = await equipmentAddEditDelData.getInitData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      DataEqipDept.addAll(response['Department']);
      DataEqipCat.addAll(response['Equipment_Cat']);
      //print(DataEqipDept);
      //print(DataEqipCat);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  File? file;
  imageUploadCameraFunc() async {
    file = await imageUploadCamera();
    update();
  }

  fileUploadGalleryFunc() async {
    file = await fileUploadGallery();
    update();
  }

  sendData() async {
    if (formstate.currentState!.validate()) {
      if (file == null) {
        Get.snackbar("Warring", "Please Choose Picture");
      }

      Map data = {
        "Equipment_Name": Equipment_Name_Controller?.text,
        "Equipment_Category_ID": selectedValueCatID,
        "Equipment_Picture": "Equipment_Picture",
        "Equipment_Serial_Number": Equipment_Serial_Number_Controller?.text,
        "Equipment_Department_ID": selectedValueDeptID,
        "Equipment_Barcode": Equipment_Barcode_Controller?.text,
        "Equipment_Specification": Equipment_Specification_Controller?.text,
        "Equipment_Model_Number": Equipment_Model_Number_Controller?.text,
        "Equipment_Added_By_Emp_ID": myServices.sharedPreferences.getString("id").toString(),
      };

      var response = await equipmentAddEditDelData.addData(data, file!);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.offNamed(AppRoute.equipmentviewmain);
        EquipmentViewByDeptControllerImp c = Get.find();
        c.intialData();
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    Equipment_Name_Controller = TextEditingController();
    Equipment_Serial_Number_Controller = TextEditingController();
    Equipment_Barcode_Controller = TextEditingController();
    Equipment_Specification_Controller = TextEditingController();
    Equipment_Model_Number_Controller = TextEditingController();

    intialData();
    super.onInit();
  }

  @override
  backToHome() {
    Get.offAndToNamed(AppRoute.equipmentviewmain);
  }
}
