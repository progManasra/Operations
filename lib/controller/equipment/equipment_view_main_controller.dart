import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_delete_data.dart';
import 'package:app01/data/datasource/remote/order_data/order_view_main_data.dart';
import 'package:get/get.dart';

abstract class EquipmentViewMainController extends GetxController {
  intialData();
  goToEquipmentViewByDept();
  backToHome();
  setEquipCatID(String EquipCatID);
  addEquipment();
}

class EquipmentViewMainControllerImp extends EquipmentViewMainController {
  OrderViewMainData orderViewMainData = OrderViewMainData(Get.find());
  OrderDeleteData OrderDelete = OrderDeleteData(Get.find());
  List data = [];
  String? DeptID;
  //late StatusRequest statusRequest;
  StatusRequest statusRequest = StatusRequest.none;

  MyServices myServices = Get.find();
  setEquipCatID(EquipCatID) {
    print(EquipCatID);

    myServices.sharedPreferences.setString("EquipCatID", EquipCatID);
    print(EquipCatID);
  }

  @override
  goToEquipmentViewByDept() {
    Get.toNamed(AppRoute.equipmentviewbydept, arguments: {});
  }

  @override
  intialData() {}

  @override
  void onInit() {
    intialData();
    super.onInit();
  }

  @override
  backToHome() {
    Get.offAndToNamed(AppRoute.homepage);
    throw UnimplementedError();
  }

  @override
  addEquipment() {
    if (myServices.sharedPreferences.getString("permission").toString() == '99') {
      Get.toNamed(AppRoute.equipmentadd);
    } else {
      Get.snackbar("warrning", "Please Don't Have Permisstion");
    }
  }
}
