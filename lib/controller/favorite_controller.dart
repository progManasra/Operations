import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/favorite_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {
  setFavorite(id, val);
  addFavorite(String itemsid);
  removeFavorite(String itemsid);
}

class FavoriteControllerImp extends FavoriteController {
  Map isFavorite = {};
  List data = [];
  FavoriteData favoriteData = FavoriteData(Get.find());

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("========================================");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(title: "alarm", messageText: Text("Add to Favorite"));

        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    //update();
  }

  removeFavorite(itemsid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, itemsid);
    print("========================================");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
            title: "alarm", messageText: Text("Removed from Favorite"));
        // data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
//    update();
  }
}
