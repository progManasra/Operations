import 'dart:io';

import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/functions/uploadfile.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/equipment/equipment_add_edit_del_data.dart';
import 'package:app01/data/datasource/remote/equipment/equipment_detail_data.dart';
import 'package:app01/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class EquipmentEditController extends GetxController {
  intialData();
  intialData2();
  goToEquipmentViewDetails();
  onChangeDep(String Value);
  onChangeCat(String Value);

  imageUploadCameraFunc();
  fileUploadGalleryFunc();
  sendData();
  backToHome();
  deleteData();
  InitalDropDownList();
}

class EquipmentEditControllerImp extends EquipmentEditController {
  EquipmentViewDetailData equipmentViewDetailData = EquipmentViewDetailData(Get.find());
  EquipmentAddEditDelData equipmentAddEditDelData = EquipmentAddEditDelData(Get.find());

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  TextEditingController? Equipment_Name_Controller;
  TextEditingController? Equipment_Serial_Number_Controller;
  TextEditingController? Equipment_Barcode_Controller;
  TextEditingController? Equipment_Specification_Controller;
  TextEditingController? Equipment_Model_Number_Controller;

  List DataEqipDept = [];
  List DataEqipCat = [];
  List AllData = [];

  late StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String? EquipID;

  @override
  goToEquipmentViewDetails() {}

  String? selectedValueDept;
  String? selectedValueDeptID;

  String? selectedValueCat;
  String? selectedValueCatID;

  String? DataEqipDeptInit;
  String? DataEqipCatInit;
  String? DataEqipDeptInitID;
  String? DataEqipCatInitID;
  String? oldPicture;

  onChangeDep(Value) {
    selectedValueDept = Value as String;
    DataEqipDept.forEach((element) {
      if (element['Dep_Name'] == selectedValueDept) {
        selectedValueDeptID = element['Dep_ID'];
        DataEqipDeptInit = element['Dep_ID'];
        DataEqipDeptInitID = element['Dep_ID'];

        //print("New ID Dept -> : ${DataEqipDeptInit}");
      }
    });

    update();
  }

  InitalDropDownList() async {
    DataEqipDept.forEach((element) {
      //print(AllData.elementAt(0)['Equipment_Department_ID']);
      if (AllData[0]['Equipment_Department_ID'] == element['Dep_ID']) {
        DataEqipDeptInit = element['Dep_Name'];
        DataEqipDeptInitID = element['Dep_ID'];

        //print(DataEqipDeptInit);
        //print("element:  ${element['Dep_ID']}");
        update();
        //print(element['Dep_Name']);
      }

      // DataEqipCatInit
    });
    DataEqipCat.forEach((element) {
      if (AllData[0]['Equipment_Category_ID'] == element['Equipment_Cat_ID']) {
        DataEqipCatInit = element['Equipment_Cat_Name'];
        //print(DataEqipCatInit);
        DataEqipCatInitID = element['Equipment_Cat_ID'];

        update();
        //print(element['Dep_Name']);
      }

      // DataEqipCatInit
    });
    //print(AllData.elementAt(0)['Equipment_Department_ID']);

    print("element end   ----:");
  }

  onChangeCat(Value) {
    selectedValueCat = Value as String;
    DataEqipCat.forEach((element) {
      if (element['Equipment_Cat_Name'] == selectedValueCat) {
        selectedValueCatID = element['Equipment_Cat_ID'];
        DataEqipCatInit = element['Equipment_Cat_ID'];
        DataEqipCatInitID = element['Equipment_Cat_ID'];
        print("New ID Cat-> : ${DataEqipCatInit}");
      }
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

  @override
  intialData2() async {
    statusRequest = StatusRequest.loading;
    EquipID = Get.arguments['EquipID'];
    AllData.clear();
    var response = await equipmentViewDetailData.getData(EquipID!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      AllData.addAll(response['myData']);
      //print(AllData);
      Equipment_Name_Controller = TextEditingController(text: AllData[0]['Equipment_Name']);
      Equipment_Serial_Number_Controller =
          TextEditingController(text: '${AllData.elementAt(0)['Equipment_Serial_Number']}');
      Equipment_Barcode_Controller =
          TextEditingController(text: '${AllData.elementAt(0)['Equipment_Barcode']}');
      Equipment_Specification_Controller =
          TextEditingController(text: '${AllData.elementAt(0)['Equipment_Specification']}');
      Equipment_Model_Number_Controller =
          TextEditingController(text: '${AllData.elementAt(0)['Equipment_Model_Number']}');
      oldPicture = AllData.elementAt(0)['Equipment_Picture'];
      DataEqipDeptInit = AllData.elementAt(0)['Equipment_Department_ID'].toString();
      print("DataEqipDeptInit $DataEqipDeptInit");
      DataEqipCatInit = AllData.elementAt(0)['Equipment_Category_ID'].toString();
      print("DataEqipCatInit $DataEqipCatInit");
      //print("Old Picture:  ${oldPicture}");
      await InitalDropDownList();
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
      statusRequest = StatusRequest.loading;
      update();
      Map data = {
        "Equipment_ID": EquipID.toString(),
        "Equipment_Name": Equipment_Name_Controller?.text,
        "Equipment_Category_ID": DataEqipCatInitID.toString(),
        "Equipment_Serial_Number": Equipment_Serial_Number_Controller?.text,
        "Equipment_Department_ID": DataEqipDeptInitID.toString(),
        "Equipment_Barcode": Equipment_Barcode_Controller?.text,
        "Equipment_Specification": Equipment_Specification_Controller?.text,
        "Equipment_Model_Number": Equipment_Model_Number_Controller?.text,
        "Equipment_Added_By_Emp_ID": myServices.sharedPreferences.getString("id").toString(),
        "imageold": file != null ? oldPicture : '',
      };
      print(data);
      print("DataEqipDeptInitID $DataEqipDeptInitID");
      print("DataEqipCatInitID $DataEqipCatInitID");

      print("Step# Map data Done");
      var response = await equipmentAddEditDelData.editData(data, file);
      print("Step# Create response");

      statusRequest = handlingData(response);
      print("Step# response $response");

      if (StatusRequest.success == statusRequest) {
        print("Step# statusRequest");

        Get.offAllNamed(AppRoute.equipmentviewbydept);
      } else {
        statusRequest = StatusRequest.failure;
        Get.offAllNamed(AppRoute.equipmentviewbydept);
      }
      update();
    }
  }

  @override
  void onInit() async {
    await intialData();
    await intialData2();

    super.onInit();
  }

  @override
  backToHome() {
    Get.offAndToNamed(AppRoute.equipmentviewbydept);
  }

  @override
  deleteData() async {
    if (myServices.sharedPreferences.getString("permission") == '99') {
      Map data = {
        "Equipment_ID": EquipID,
        "Equipment_Picture": oldPicture,
      };
      var response = await equipmentAddEditDelData.DeleteData(data);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        print("Deleted Done");
        Get.offAllNamed(AppLink.EquipmentViewByDept);
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      Get.snackbar("Worrning", "Don't Have Permission");
    }
  }
}
