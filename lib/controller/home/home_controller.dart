import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:app01/data/datasource/remote/home_data.dart';

abstract class HomeController extends GetxController {
  initialData();
  getdata();
  goToOrders();
  goToEquipments();
}

class HomeControllerImp extends HomeController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  String? id;
  String? firstname;

  //List data = [];
  List categories = [];
  List items = [];
  String? lang;

  late StatusRequest statusRequest;

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    id = myServices.sharedPreferences.getString("id");
    firstname = myServices.sharedPreferences.getString("firstname");
  }

  @override
  void onInit() {
    getdata();
    initialData();
    super.onInit();
  }

  @override
  getdata() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("========================================");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']);
        items.addAll(response['items']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  goToOrders() {
    //Get.toNamed(AppRoute.orderviewmain);
    Get.offNamed(AppRoute.orderviewmain);
  }

  @override
  goToEquipments() {
    Get.offNamed(AppRoute.equipmentviewmain);
    throw UnimplementedError();
  }
}
