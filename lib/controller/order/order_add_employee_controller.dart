import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_add_data.dart';
import 'package:app01/data/datasource/remote/order_data/order_addemp_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class OrderAddEmployeeController extends GetxController {
  intailData();
  onchangeProduction(String value);
  onchangeProgram(String value);
  onchangeStudio(String value);
  onchangeDirection(String value);
  onchangeCamera(String value);
  onchangeAudio(String value);
  onchangeLight(String value);
  onchangePresentor(String value);
  onchangeReporter(String value);
  onchangeOffice_Boy(String value);
  onchangeCreative(String value);
  onchangeCG(String value);
  backToHome();
}

class OrderAddEmployeeControllerImp extends OrderAddEmployeeController {
  OrderAddEmpData orderAddData = OrderAddEmpData(Get.find());
  GlobalKey<FormState> formstata = GlobalKey<FormState>();
  late TextEditingController EmployeeNote;
  List ProductionList = [];
  List ProgramList = [];
  List StudioList = [];
  List DirectionList = [];
  List CameraList = [];
  List AudioList = [];
  List LightList = [];
  List PresentorList = [];
  List ReporterList = [];
  List Office_BoyList = [];
  List CreativeList = [];
  List CGList = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  intailData() async {
    ProductionList.clear();
    ProgramList.clear();
    StudioList.clear();
    DirectionList.clear();
    CameraList.clear();
    AudioList.clear();
    LightList.clear();
    PresentorList.clear();
    ReporterList.clear();
    Office_BoyList.clear();
    CreativeList.clear();
    CGList.clear();

    statusRequest = StatusRequest.loading;
    var response = await orderAddData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        ProductionList.addAll(response['production']);
        ProgramList.addAll(response['program']);
        StudioList.addAll(response['studio']);
        DirectionList.addAll(response['director']);
        CameraList.addAll(response['cameraman']);
        AudioList.addAll(response['audio']);
        LightList.addAll(response['lighting']);
        PresentorList.addAll(response['presenter']);
        ReporterList.addAll(response['reporter']);
        Office_BoyList.addAll(response['office_boy']);
        CreativeList.addAll(response['creative']);
        CGList.addAll(response['cg']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    selectedEmpProduction = [];
    selectedEmpProgram = [];
    selectedEmpStudio = [];
    selectedEmpDirection = [];
    selectedEmpCamera = [];
    selectedEmpAudio = [];
    selectedEmpLight = [];
    selectedEmpPresentor = [];
    selectedEmpReporter = [];
    selectedEmpOffice_Boy = [];
    selectedEmpCreative = [];
    selectedEmpCG = [];
    EmployeeNote = TextEditingController();
    intailData();
    super.onInit();
  }

  @override
  goToAddLocationAndTransportation() {
    myServices.sharedPreferences
        .setString("selectedEmpProduction", selectedEmpProduction.toString());
    myServices.sharedPreferences.setString("selectedEmpProgram", selectedEmpProgram.toString());
    myServices.sharedPreferences.setString("selectedEmpStudio", selectedEmpStudio.toString());
    myServices.sharedPreferences.setString("selectedEmpDirection", selectedEmpDirection.toString());
    myServices.sharedPreferences.setString("selectedEmpCamera", selectedEmpCamera.toString());
    myServices.sharedPreferences.setString("selectedEmpAudio", selectedEmpAudio.toString());
    myServices.sharedPreferences.setString("selectedEmpLight", selectedEmpLight.toString());
    myServices.sharedPreferences.setString("selectedEmpPresentor", selectedEmpPresentor.toString());
    myServices.sharedPreferences.setString("selectedEmpReporter", selectedEmpReporter.toString());
    myServices.sharedPreferences
        .setString("selectedEmpOffice_Boy", selectedEmpOffice_Boy.toString());
    myServices.sharedPreferences.setString("selectedEmpCreative", selectedEmpCreative.toString());
    myServices.sharedPreferences.setString("selectedEmpCG", selectedEmpCG.toString());
    myServices.sharedPreferences.setString("EmployeeNote", EmployeeNote.text);

    // print("======Production List-----");
    // print(myServices.sharedPreferences.getStringList("Production"));
    // print("======Production --- toString");
    // print(selectedEmpProduction.toString());
    // print("======Production --- without");
    // print(selectedEmpProduction);
    // print(EmployeeNote.text);
    // print(selectedEmpProgram);
    // print(selectedEmpStudio);
    // print(selectedEmpDirection);
    // print(selectedEmpCamera);
    // print(selectedEmpAudio);
    // print(selectedEmpLight);
    // print(selectedEmpPresentor);
    // print(selectedEmpReporter);
    // print(selectedEmpOffice_Boy);
    // print(selectedEmpCreative);
    // print(selectedEmpCG);

    Get.toNamed(AppRoute.orderaddlocationandtransportation);
  }

  onchangeProduction(value) {
    selectedEmpProduction = value as List<String>;
    //myServices.sharedPreferences.setStringList("Production", selectedEmpProduction);

    update();
  }

  List<String> selectedEmpProduction = [];
  List<String> selectedEmpProgram = [];
  List<String> selectedEmpStudio = [];
  List<String> selectedEmpDirection = [];
  List<String> selectedEmpCamera = [];
  List<String> selectedEmpAudio = [];
  List<String> selectedEmpLight = [];
  List<String> selectedEmpPresentor = [];
  List<String> selectedEmpReporter = [];
  List<String> selectedEmpOffice_Boy = [];
  List<String> selectedEmpCreative = [];
  List<String> selectedEmpCG = [];

  onchangeProgram(value) {
    selectedEmpProgram = value as List<String>;
    update();
  }

  onchangeStudio(value) {
    selectedEmpStudio = value as List<String>;
    update();
  }

  onchangeDirection(value) {
    selectedEmpDirection = value as List<String>;
    update();
  }

  onchangeCamera(value) {
    selectedEmpCamera = value as List<String>;
    update();
  }

  onchangeAudio(value) {
    selectedEmpAudio = value as List<String>;
    update();
  }

  onchangeLight(value) {
    selectedEmpLight = value as List<String>;
    update();
  }

  onchangePresentor(value) {
    selectedEmpPresentor = value as List<String>;
    update();
  }

  onchangeReporter(value) {
    selectedEmpReporter = value as List<String>;
    update();
  }

  onchangeOffice_Boy(value) {
    selectedEmpOffice_Boy = value as List<String>;
    update();
  }

  onchangeCreative(value) {
    selectedEmpCreative = value as List<String>;
    update();
  }

  onchangeCG(value) {
    selectedEmpCG = value as List<String>;
    update();
  }

  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
