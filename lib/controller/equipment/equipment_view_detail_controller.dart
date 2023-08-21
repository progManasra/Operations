import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/equipment/equipment_detail_data.dart';
import 'package:get/get.dart';

abstract class EquipmentViewDetailController extends GetxController {
  intialData();
  goToEquipmentViewDetails();
  backToHome();
  goToEquipmentEdit();
}

class EquipmentViewDetailControllerImp extends EquipmentViewDetailController {
  EquipmentViewDetailData equipmentViewDetailData = EquipmentViewDetailData(Get.find());
  List myData = [];
  //late StatusRequest statusRequest;
  StatusRequest statusRequest = StatusRequest.loading;
  MyServices myServices = Get.find();
  String? EquipID;

  @override
  goToEquipmentViewDetails() {
    //Get.toNamed(AppRoute.orderadd);
  }

  @override
  intialData() async {
    // statusRequest = StatusRequest.loading;
    EquipID = Get.arguments['EquipID'];
    //myData.clear();
    var response = await equipmentViewDetailData.getData(EquipID!);
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
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  backToHome() {
    myData.clear();
    Get.offAndToNamed(AppRoute.equipmentviewbydept);
  }

  @override
  goToEquipmentEdit() {
    Get.offAndToNamed(AppRoute.equipmentedit, arguments: {
      "EquipID": EquipID,
    });
    print("EquipID before sending/ $EquipID");
    throw UnimplementedError();
  }
}
