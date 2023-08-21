// ignore_for_file: prefer_const_constructors

import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_editsummary_data.dart';
import 'package:get/get.dart';

abstract class OrderEditSummaryController extends GetxController {
  intailData();
  SendRequest();
  ListAdd();
  backToHome();
}

class OrderEditSummaryControllerImp extends OrderEditSummaryController {
  OrderEditSummaryData orderEditData = OrderEditSummaryData(Get.find());
  List data = [];
  late StatusRequest statusRequest = StatusRequest.success;
  MyServices myServices = Get.find();

  ////////////////////////
  late String resID;
  late String OrderTitle;
  late String OrderDisc;
  late String OrderStartDateTime;
  late String OrderEndDateTime;
  late String data_Order;
  late String data_Order_ID;
  late String data_Production;
  late String data_Production_ID;
  late String? AddByEmp = myServices.sharedPreferences.getString("id");
  late String? AddByEmpEmail = myServices.sharedPreferences.getString("email");

  //Camera
  late String selectedItemsCamera;
  late String selectedItemsLenses;
  late String selectedItemsGimbal;
  late String selectedItemsDron;
  late String selectedItemsCrain;
  late String CameraNote;
  //Audio
  late String selectedItemsMic;
  late String selectedItemsAirBese;
  late String selectedItemsMixer;
  late String AudioNote;
  //Lighting
  late String selectedItemslightUnit;
  late String LightNote;
  //Equipment
  late String selectedItemsLaptop;
  late String selectedItemsAutoCues;
  late String EquipmentNote;
  //Employee
  late String selectedEmpProduction;
  late String selectedEmpProgram;
  late String selectedEmpStudio;
  late String selectedEmpDirection;
  late String selectedEmpCamera;
  late String selectedEmpAudio;
  late String selectedEmpLight;
  late String selectedEmpPresentor;
  late String selectedEmpReporter;
  late String selectedEmpOffice_Boy;
  late String selectedEmpCreative;
  late String selectedEmpCG;
  late String EmployeeNote;
  //LocationAndTransportation
  late String selectedItemsLocation;
  late String selectedItemsLocationID;
  late String selectedItemsTransportation;
  late String selectedItemsDriver;
  late String LocationNote;
  ////////////////////////
  late List temp;
  late List temp02;
  late List temp03;

  //List Equipments
  late List EquipmentsList = [];
  late String EquipmentsListString;
  late String temp2;
  late String TempEquipment1;
  List TempEquipmentList0 = [];
  List TempEquipmentList = [];
  //List Employees + Drivers
  late List EmployeesList = [];
  late List EmployeesList1 = [];
  late List EmployeesListDepID2 = [];

  late String EmployeesListString;
  late String EmployeesListString2;
  late String EmployeesListStringDepID;

  late String EmployeesTemp1;
  late String EmployeesTemp2;
  //List CAR
  late List CARsList = [];
  late List CARsList1 = [];
  late String CARsListString;
  late String CARsTemp1;
  late String CARsTemp2;
  //Location

  @override
  extractIDs() {
    //data_Production
    temp = data_Production.split(" ");
    data_Production_ID = temp[0];
    data_Production = temp[1];
    //data_Order;
    //temp.clear();
    temp02 = data_Order.split(" ");
    data_Order_ID = temp02[0];
    data_Order = temp02[1];
    //Location
    //temp.clear();
    temp03 = selectedItemsLocation.split(" ");
    selectedItemsLocationID = temp03[0];
    selectedItemsLocation = temp03[1];
  }

  @override
  ListAdd() {
    print("===============List of Equipments============");
    print("========start new List");
    TempEquipment1 = selectedItemsCamera.substring(1, selectedItemsCamera.length - 1) +
        ", " +
        selectedItemsLenses.substring(1, selectedItemsLenses.length - 1) +
        ", " +
        selectedItemsGimbal.substring(1, selectedItemsGimbal.length - 1) +
        ", " +
        selectedItemsDron.substring(1, selectedItemsDron.length - 1) +
        ", " +
        selectedItemsCrain.substring(1, selectedItemsCrain.length - 1) +
        ", " +
        selectedItemsMic.substring(1, selectedItemsMic.length - 1) +
        ", " +
        selectedItemsAirBese.substring(1, selectedItemsAirBese.length - 1) +
        ", " +
        selectedItemsMixer.substring(1, selectedItemsMixer.length - 1) +
        ", " +
        selectedItemslightUnit.substring(1, selectedItemslightUnit.length - 1) +
        ", " +
        selectedItemsLaptop.substring(1, selectedItemsLaptop.length - 1) +
        ", " +
        selectedItemsAutoCues.substring(1, selectedItemsAutoCues.length - 1);
    print("---------------------------------------");
    TempEquipmentList0 = TempEquipment1.split(", ");
    print(TempEquipmentList0.toString());
    TempEquipmentList0.forEach((element) {
      TempEquipmentList.add(element.split(" ").first);
    });
    print(TempEquipmentList);
    TempEquipmentList.removeWhere((element) => ["", null, false, 0].contains(element));
    var count = 0;
    TempEquipmentList.forEach((element) {
      print("element#: " + element + "\n");
      count++;
    });
    print("Total Items : " + count.toString());
    EquipmentsListString = TempEquipmentList.toString();
    EquipmentsListString = EquipmentsListString.substring(1, EquipmentsListString.length - 1);
    print(EquipmentsListString);
    print("========end new List Equipments ================");
    print("===============List of Employees===================================================");
    print("========start new List");
    EmployeesTemp1 = selectedEmpProduction.substring(1, selectedEmpProduction.length - 1) +
        ", " +
        selectedEmpProgram.substring(1, selectedEmpProgram.length - 1) +
        ", " +
        selectedEmpStudio.substring(1, selectedEmpStudio.length - 1) +
        ", " +
        selectedEmpDirection.substring(1, selectedEmpDirection.length - 1) +
        ", " +
        selectedEmpCamera.substring(1, selectedEmpCamera.length - 1) +
        ", " +
        selectedEmpAudio.substring(1, selectedEmpAudio.length - 1) +
        ", " +
        selectedEmpLight.substring(1, selectedEmpLight.length - 1) +
        ", " +
        selectedEmpPresentor.substring(1, selectedEmpPresentor.length - 1) +
        ", " +
        selectedEmpReporter.substring(1, selectedEmpReporter.length - 1) +
        ", " +
        selectedEmpOffice_Boy.substring(1, selectedEmpOffice_Boy.length - 1) +
        ", " +
        selectedEmpCreative.substring(1, selectedEmpCreative.length - 1) +
        ", " +
        selectedEmpCG.substring(1, selectedEmpCG.length - 1) +
        ", " +
        selectedItemsDriver.substring(1, selectedItemsDriver.length - 1);
    print("---------------------------------------");
    EmployeesList = EmployeesTemp1.split(", ");
    print(EmployeesList.toString());
    EmployeesList.forEach((element) {
      EmployeesList1.add(element.split(" ").first);
      EmployeesListDepID2.add(element.split(" ").last);
    });
    print(EmployeesList1);
    EmployeesList1.removeWhere((element) => ["", null, false, 0].contains(element));
    EmployeesListDepID2.removeWhere((element) => ["", null, false, 0].contains(element));

    var count2 = 0;
    var count002 = 0;
    EmployeesList1.forEach((element) {
      print("element#: " + element + "\n");
      count2++;
    });
    EmployeesListDepID2.forEach((element) {
      print("element#: " + element + "\n");
      count002++;
    });
    print("Total Items : " + count2.toString());
    EmployeesTemp2 = EmployeesList1.toString();
    EmployeesTemp2 = EmployeesTemp2.substring(1, EmployeesTemp2.length - 1);
    print(EmployeesTemp2);
    print("Total Items dept id: " + count002.toString());
    EmployeesListStringDepID = EmployeesListDepID2.toString();
    EmployeesListStringDepID =
        EmployeesListStringDepID.substring(1, EmployeesListStringDepID.length - 1);
    print("Dep ID" + EmployeesListStringDepID);
    print("========end new List Employee");
    print("===============List of CARs===================================================");
    print("========start new List");
    CARsTemp1 = selectedItemsTransportation.substring(1, selectedItemsTransportation.length - 1);
    CARsList = CARsTemp1.split(", ");
    print(CARsList.toString());
    CARsList.forEach((element) {
      CARsList1.add(element.split(" ").first);
    });
    print(CARsList1);
    CARsList1.removeWhere((element) => ["", null, false, 0].contains(element));
    var count3 = 0;
    CARsList1.forEach((element) {
      print("element#: " + element + "\n");
      count3++;
    });
    print("Total Items : " + count3.toString());
    CARsTemp1 = CARsList1.toString();
    CARsTemp1 = CARsTemp1.substring(1, CARsTemp1.length - 1);
    print(CARsTemp1);
    print("========end new List CAR");
  }

  @override
  void onInit() {
    intailData();
    extractIDs();
    ListAdd();
    super.onInit();
  }

  @override
  goToAddHame() {
    //Get.offAllNamed(AppRoute.homepage);
  }

  SendRequest() async {
    statusRequest = StatusRequest.loading;
    var response = await orderEditData.postData(
      resID,
      OrderStartDateTime,
      OrderEndDateTime,
      OrderTitle,
      OrderDisc,
      selectedItemsLocationID,
      data_Order_ID,
      AddByEmp!,
      AddByEmpEmail!,
      data_Production_ID,
      CameraNote,
      AudioNote,
      LightNote,
      EquipmentNote,
      EmployeeNote,
      LocationNote,
      EquipmentsListString,
      EmployeesTemp2,
      CARsTemp1,
      EmployeesListStringDepID,
    );

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.homepage);
      } else {
        statusRequest = StatusRequest.failure;
        Get.back();
      }
    }
    update();
  }

  @override
  intailData() async {
    OrderTitle = myServices.sharedPreferences.getString("OrderTitle")!;
    OrderDisc = myServices.sharedPreferences.getString("OrderDisc")!;
    OrderStartDateTime = myServices.sharedPreferences.getString("OrderStartDateTime")!;
    OrderEndDateTime = myServices.sharedPreferences.getString("OrderEndDateTime")!;
    data_Order = myServices.sharedPreferences.getString("selectedValue_order_type").toString();
    data_Production =
        myServices.sharedPreferences.getString("selectedValue_production_type").toString();
    //Camera
    selectedItemsCamera = myServices.sharedPreferences.getString("selectedItemsCamera").toString();
    selectedItemsLenses = myServices.sharedPreferences.getString("selectedItemsLenses").toString();
    selectedItemsGimbal = myServices.sharedPreferences.getString("selectedItemsGimbal").toString();
    selectedItemsDron = myServices.sharedPreferences.getString("selectedItemsDron").toString();
    selectedItemsCrain = myServices.sharedPreferences.getString("selectedItemsCrain").toString();
    CameraNote = myServices.sharedPreferences.getString("CameraNote")!;
    //Audio
    selectedItemsMic = myServices.sharedPreferences.getString("selectedItemsMic").toString();
    selectedItemsAirBese =
        myServices.sharedPreferences.getString("selectedItemsAirBese").toString();
    selectedItemsMixer = myServices.sharedPreferences.getString("selectedItemsMixer").toString();
    AudioNote = myServices.sharedPreferences.getString("AudioNote")!;
    //Lighting
    selectedItemslightUnit =
        myServices.sharedPreferences.getString("selectedItemslightUnit").toString();
    LightNote = myServices.sharedPreferences.getString("LightNote")!;
    //Equipment
    selectedItemsLaptop = myServices.sharedPreferences.getString("selectedItemsLaptop").toString();
    selectedItemsAutoCues =
        myServices.sharedPreferences.getString("selectedItemsAutoCues").toString();
    EquipmentNote = myServices.sharedPreferences.getString("EquipmentNote")!;
    //Employee
    selectedEmpProduction =
        myServices.sharedPreferences.getString("selectedEmpProduction").toString();
    selectedEmpProgram = myServices.sharedPreferences.getString("selectedEmpProgram").toString();
    selectedEmpStudio = myServices.sharedPreferences.getString("selectedEmpStudio").toString();
    selectedEmpDirection =
        myServices.sharedPreferences.getString("selectedEmpDirection").toString();
    selectedEmpCamera = myServices.sharedPreferences.getString("selectedEmpCamera").toString();
    selectedEmpAudio = myServices.sharedPreferences.getString("selectedEmpAudio").toString();
    selectedEmpLight = myServices.sharedPreferences.getString("selectedEmpLight").toString();
    selectedEmpPresentor =
        myServices.sharedPreferences.getString("selectedEmpPresentor").toString();
    selectedEmpReporter = myServices.sharedPreferences.getString("selectedEmpReporter").toString();
    selectedEmpOffice_Boy =
        myServices.sharedPreferences.getString("selectedEmpOffice_Boy").toString();
    selectedEmpCreative = myServices.sharedPreferences.getString("selectedEmpCreative").toString();
    selectedEmpCG = myServices.sharedPreferences.getString("selectedEmpCG").toString();
    EmployeeNote = myServices.sharedPreferences.getString("EmployeeNote")!;
    //LocationAndTransportation
    selectedItemsLocation =
        myServices.sharedPreferences.getString("selectedItemsLocation").toString();
    selectedItemsTransportation =
        myServices.sharedPreferences.getString("selectedItemsTransportation").toString();
    selectedItemsDriver = myServices.sharedPreferences.getString("selectedItemsDriver").toString();
    LocationNote = myServices.sharedPreferences.getString("LocationNote")!;
    resID = myServices.sharedPreferences.getString("resID")!;
  }

  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
