import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/equipment/equipment_data.dart';
import 'package:get/get.dart';

abstract class EquipmentViewByDeptController extends GetxController {
  intialData();
  goToEquipmentViewDetails();
  backToHome();
  onChangeType(String value);
  goToDetails();
}

class EquipmentViewByDeptControllerImp extends EquipmentViewByDeptController {
  EquipmentViewByDeptData equipmentViewByDeptData = EquipmentViewByDeptData(Get.find());
  List myData = [];
  late StatusRequest statusRequest;
  //StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();
  String? EquipCatID;

  final List<String> items = [
    'All Equipments',
    'Camera Equipments',
    'Audio Equipments',
    'Lighting Equipments',
    'Camera',
    'lighting',
    'laptop',
    'mic',
    'Gimbal',
    'Dron',
    'Crain',
    'AirBese',
    'AudioMixer',
    'AutoCues',
    'Lenses',
  ];
  String? selectedValue;
  onChangeType(value) async {
    selectedValue = value as String;
    if (selectedValue == 'All Equipments') {
      myServices.sharedPreferences.setString("EquipCatID", '1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Camera Equipments') {
      myServices.sharedPreferences.setString("EquipCatID", '1, 5, 6, 7, 11');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Audio Equipments') {
      myServices.sharedPreferences.setString("EquipCatID", '4, 8, 9');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Lighting Equipments') {
      myServices.sharedPreferences.setString("EquipCatID", '2');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Camera') {
      myServices.sharedPreferences.setString("EquipCatID", '1');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'lighting') {
      myServices.sharedPreferences.setString("EquipCatID", '2');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'laptop') {
      myServices.sharedPreferences.setString("EquipCatID", '3');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'mic') {
      myServices.sharedPreferences.setString("EquipCatID", '4');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Gimbal') {
      myServices.sharedPreferences.setString("EquipCatID", '5');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Dron') {
      myServices.sharedPreferences.setString("EquipCatID", '6');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Crain') {
      myServices.sharedPreferences.setString("EquipCatID", '7');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'AirBese') {
      myServices.sharedPreferences.setString("EquipCatID", '8');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'AudioMixer') {
      myServices.sharedPreferences.setString("EquipCatID", '9');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'AutoCues') {
      myServices.sharedPreferences.setString("EquipCatID", '10');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    if (selectedValue == 'Lenses') {
      myServices.sharedPreferences.setString("EquipCatID", '11');
      statusRequest = StatusRequest.loading;
      await intialData();
    }
    update();
  }

  String? EquipID;
  @override
  goToDetails() {
    Get.toNamed(AppRoute.equipmentviewdetail, arguments: {
      "EquipID": EquipID,
    });
  }

  @override
  goToEquipmentViewDetails() {
    //Get.toNamed(AppRoute.equipmentviewdetail);
  }

  @override
  intialData() async {
    update();
    myData.clear();
    update();
    EquipCatID = myServices.sharedPreferences.getString("EquipCatID");
    statusRequest = StatusRequest.loading;
    var response = await equipmentViewByDeptData.getData(EquipCatID!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myData.addAll(response['myData']);
      print(myData);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() async {
    await intialData();
    super.onInit();
  }

  @override
  backToHome() {
    Get.offAndToNamed(AppRoute.equipmentviewmain);
  }
}
