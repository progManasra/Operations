import 'dart:convert';

import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_add_data.dart';
import 'package:app01/data/datasource/remote/order_data/order_view_detail_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderEditController extends GetxController {
  intailData();
  onchangeProduction(String value);
  onchangeOrderType(String value);
  goToEditCam();
  getOrders();
  backToHome();
}

class OrderEditControllerImp extends OrderEditController {
  OrderAddData orderAddData = OrderAddData(Get.find());
  //
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
//from detials
  OrderViewDetailsData orderViewdetailsData = OrderViewDetailsData(Get.find());
  String? resID;
  List dataReservation = [];
  List dataReservation_Location = [];
  List dataReservation_Status = [];
  List dataReservation_Order_Type = [];
  List dataReservation_Production_Type = [];
  List dataReservation_Car = [];
  List dataReservation_Employee = [];
  List dataReservation_Equip = [];

  bool isLoading = true;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  String? selectedValue_production_type;
  String? ProIndex;
  String? selectedValue_order_type;

  //Camera Page==============
  List<String> initselectedItemsCamera = [];
  List<String> initselectedItemsLenses = [];
  List<String> initselectedItemsGimbal = [];
  List<String> initselectedItemsDron = [];
  List<String> initselectedItemsCrain = [];
  String? initCameraNote;

  //Audio Page===============
  List<String> initselectedItemsMic = [];
  List<String> initselectedItemsAirBese = [];
  List<String> initselectedItemsMixer = [];
  String? initAudioNote;

  //Light Page===============
  List<String> initselectedItemslightUnit = [];
  String? initLightNote;

  //General Eqip Page========
  List<String> initselectedItemsLaptop = [];
  List<String> initselectedItemsAutoCues = [];
  String? initEquipmentNote;

  //Employees Page===========
  List<String> initselectedEmpProduction = [];
  List<String> initselectedEmpProgram = [];
  List<String> initselectedEmpStudio = [];
  List<String> initselectedEmpDirection = [];
  List<String> initselectedEmpCamera = [];
  List<String> initselectedEmpAudio = [];
  List<String> initselectedEmpLight = [];
  List<String> initselectedEmpPresentor = [];
  List<String> initselectedEmpReporter = [];
  List<String> initselectedEmpOffice_Boy = [];
  List<String> initselectedEmpCreative = [];
  List<String> initselectedEmpCG = [];
  String? initEmployeeNote;

  //Location Page============
  String? initselectedItemsLocation;
  String? initDefaultselectedItemsLocation;

  List<String> initselectedItemsTransportation = [];
  List<String> initselectedItemsDriver = [];
  String? initLocationNote;

  get response => null;

  @override
  getOrders() async {
    resID = Get.arguments['resID'];

    dataReservation.clear();
    dataReservation_Car.clear();
    dataReservation_Employee.clear();
    dataReservation_Equip.clear();
    dataReservation_Location.clear();
    dataReservation_Status.clear();
    dataReservation_Order_Type.clear();
    dataReservation_Production_Type.clear();

    statusRequest = StatusRequest.loading;
    var response = await orderViewdetailsData.getData(resID!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        dataReservation.addAll(response['Reservation']);
        dataReservation_Order_Type.addAll(response['Reservation_Order_Type']);
        dataReservation_Car.addAll(response['Reservation_Car']);
        dataReservation_Employee.addAll(response['Reservation_Employee']);
        dataReservation_Equip.addAll(response['Reservation_Equip']);
        dataReservation_Location.addAll(response['Reservation_Location']);
        dataReservation_Status.addAll(response['Reservation_Status']);
        dataReservation_Production_Type.addAll(response['Reservation_Production_Type']);

        print(dataReservation);
        print(dataReservation_Location);
        print(dataReservation_Status);
        print(dataReservation_Order_Type);
        print(dataReservation_Production_Type);
        print(dataReservation_Car);
        print(dataReservation_Employee);
        print(dataReservation_Equip);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  intailData() async {
    //data_Order.clear();
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
  void onInit() async {
    await getOrders();

    OrderDisc =
        TextEditingController(text: '${dataReservation.elementAt(0)['Reserv_Descriptions']}');
    // DateTime temp;
    // temp = dataReservation.elementAt(0)['Reserv_Start_DateTime']; //DateTime.now().toString();
    OrderStartDate = DateTime.now().toString();
    OrderStartTime = DateTime.now().toString();
    OrderEndtDate = DateTime.now().toString();
    OrderEndTime = DateTime.now().toString();
    OrderTitle = TextEditingController(text: '${dataReservation.elementAt(0)['Reserv_Title']}');
//OrderTitle = dataReservation.elementAt(0)['Reserv_Title'];
    //myServices.sharedPreferences.getStringList('selectedItemsCamera')?.clear();

    print("Im here ...");
    isLoading = false;
    await intailData();
    super.onInit();
  }

  @override
  goToEditCam() {
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
      Get.offAndToNamed(AppRoute.ordereditcam, arguments: {
        "resID": dataReservation_Equip,
      });
    }
//Send List To Another Pages
    dataReservation_Equip.forEach((element) {
      if (element['Equipment_Category_ID'] == '1') {
        initselectedItemsCamera.add(element['Equipment_ID'] + " " + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '5') {
        initselectedItemsGimbal.add(element['Equipment_ID'] + " " + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '6') {
        initselectedItemsDron.add(element['Equipment_ID'] + " " + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '7') {
        initselectedItemsCrain.add(element['Equipment_ID'] + " " + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '11') {
        initselectedItemsLenses.add(element['Equipment_ID'] + " " + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '4') {
        initselectedItemsMic.add(element['Equipment_ID'] + " " + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '8') {
        initselectedItemsAirBese.add(element['Equipment_ID'] + ' ' + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '9') {
        initselectedItemsMixer.add(element['Equipment_ID'] + ' ' + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '2') {
        initselectedItemslightUnit.add(element['Equipment_ID'] + ' ' + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '3') {
        initselectedItemsLaptop.add(element['Equipment_ID'] + ' ' + element['Equipment_Name']);
      }
      if (element['Equipment_Category_ID'] == '10') {
        initselectedItemsAutoCues.add(element['Equipment_ID'] + ' ' + element['Equipment_Name']);
      }
    });

    //emp
    dataReservation_Employee.forEach((element) {
      if (element['Employee_Type_ID'] == '1') {
        initselectedEmpStudio.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '3' || element['Employee_Type_ID'] == '16') {
        initselectedEmpDirection.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '4' || element['Employee_Type_ID'] == '5') {
        initselectedEmpCamera.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '6' || element['Employee_Type_ID'] == '7') {
        initselectedEmpAudio.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '8' || element['Employee_Type_ID'] == '9') {
        initselectedEmpLight.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '13') {
        initselectedItemsDriver.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '14' || element['Employee_Type_ID'] == '21') {
        initselectedEmpProgram.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '15') {
        initselectedEmpReporter.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '17') {
        initselectedEmpOffice_Boy.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '19') {
        initselectedEmpCreative.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '20') {
        initselectedEmpCG.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '23') {
        initselectedEmpProduction.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '24') {
        initselectedEmpPresentor.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
      if (element['Employee_Type_ID'] == '13') {
        initselectedItemsDriver.add(element['Employee_ID'] +
            ' ' +
            element['Employee_Email'] +
            ' ' +
            element['Employee_Dep_ID']);
      }
    });
    //Car
    dataReservation_Car.forEach((element) {
      initselectedItemsTransportation.add(element['Car_ID'] + ' ' + element['Car_Type']);
    });
    print("================Camera Eqiupment List Content ========================= ");

    myServices.sharedPreferences.setStringList('initselectedItemsCamera', initselectedItemsCamera);
    myServices.sharedPreferences.setStringList('initselectedItemsLenses', initselectedItemsLenses);
    myServices.sharedPreferences.setStringList('initselectedItemsGimbal', initselectedItemsGimbal);
    myServices.sharedPreferences.setStringList('initselectedItemsDron', initselectedItemsDron);
    myServices.sharedPreferences.setStringList('initselectedItemsCrain', initselectedItemsCrain);
    myServices.sharedPreferences
        .setString('initCameraNote', dataReservation[0]['Reservation_Note_Cam']);
    print("================Camera Eqiupment List Content ========================= ");
    print(initselectedItemsCamera);
    print(initselectedItemsLenses);
    print(initselectedItemsGimbal);
    print(initselectedItemsDron);
    print(initselectedItemsCrain);
    print(dataReservation[0]['Reservation_Note_Cam']);

    //
    myServices.sharedPreferences.setStringList('initselectedItemsMic', initselectedItemsMic);
    myServices.sharedPreferences.setStringList('selectedItemsAirBese', initselectedItemsAirBese);
    myServices.sharedPreferences.setStringList('selectedItemsMixer', initselectedItemsMixer);
    myServices.sharedPreferences
        .setString('initAudioNote', dataReservation[0]['Reservation_Note_Audio']);
    //
    myServices.sharedPreferences
        .setStringList('initselectedItemslightUnit', initselectedItemslightUnit);
    myServices.sharedPreferences
        .setString('initLightNote', dataReservation[0]['Reservation_Note_Light']);
    //
    myServices.sharedPreferences.setStringList('initselectedItemsLaptop', initselectedItemsLaptop);
    myServices.sharedPreferences
        .setStringList('initselectedItemsAutoCues', initselectedItemsAutoCues);
    myServices.sharedPreferences
        .setString('initEquipmentNote', dataReservation[0]['Reservation_Note_Equip']);
    //
    myServices.sharedPreferences
        .setStringList('initselectedEmpProduction', initselectedEmpProduction);
    myServices.sharedPreferences.setStringList('initselectedEmpProgram', initselectedEmpProgram);
    myServices.sharedPreferences.setStringList('initselectedEmpStudio', initselectedEmpStudio);
    myServices.sharedPreferences
        .setStringList('initselectedEmpDirection', initselectedEmpDirection);
    myServices.sharedPreferences.setStringList('initselectedEmpCamera', initselectedEmpCamera);
    myServices.sharedPreferences.setStringList('initselectedEmpAudio', initselectedEmpAudio);
    myServices.sharedPreferences.setStringList('initselectedEmpLight', initselectedEmpLight);
    myServices.sharedPreferences
        .setStringList('initselectedEmpPresentor', initselectedEmpPresentor);
    myServices.sharedPreferences.setStringList('initselectedEmpReporter', initselectedEmpReporter);
    myServices.sharedPreferences
        .setStringList('initselectedEmpOffice_Boy', initselectedEmpOffice_Boy);
    myServices.sharedPreferences.setStringList('initselectedEmpCreative', initselectedEmpCreative);
    myServices.sharedPreferences.setStringList('initselectedEmpCG', initselectedEmpCG);
    myServices.sharedPreferences
        .setString('initEmployeeNote', dataReservation[0]['Reservation_Note_Emp']);
    //selectedItemsDriver
    myServices.sharedPreferences.setStringList('initselectedItemsDriver', initselectedItemsDriver);
    myServices.sharedPreferences
        .setString('initLocationNote', dataReservation[0]['Reservation_Note_Location']);
    myServices.sharedPreferences
        .setStringList('initselectedItemsTransportation', initselectedItemsTransportation);

    //
    initDefaultselectedItemsLocation = dataReservation_Location[0]['Location_Name'];
    myServices.sharedPreferences
        .setString("initDefaultselectedItemsLocation", initDefaultselectedItemsLocation.toString());
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
