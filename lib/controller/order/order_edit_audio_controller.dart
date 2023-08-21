import 'package:app01/core/class/statusrequest.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/functions/handlingdatacontroller.dart';
import 'package:app01/core/services/services.dart';
import 'package:app01/data/datasource/remote/order_data/order_addaudio_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OrderEditAudioController extends GetxController {
  intailData();
  onchangeMic(String value);
  onchangeAirBese(String value);
  onchangeMixer(String value);
  backToHome();
}

class OrderEditAudioControllerImp extends OrderEditAudioController {
  OrderAddAudioData orderAddData = OrderAddAudioData(Get.find());
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController AudioNote;
  List MicList = [];
  List AirBeseList = [];
  List AudioMixerList = [];

  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  @override
  intailData() async {
    MicList.clear();
    AirBeseList.clear();
    AudioMixerList.clear();

    statusRequest = StatusRequest.loading;
    var response = await orderAddData.getData(myServices.sharedPreferences.getString("id")!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        MicList.addAll(response['mic']);
        AirBeseList.addAll(response['AirBese']);
        AudioMixerList.addAll(response['AudioMixer']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    myServices.sharedPreferences.getStringList('initselectedItemsAirBese') == null
        ? selectedItemsAirBese = []
        : selectedItemsAirBese =
            myServices.sharedPreferences.getStringList('initselectedItemsAirBesea') as List<String>;
//------
    myServices.sharedPreferences.getStringList('initselectedItemsAirBese') == null
        ? selectedItemsAirBese = []
        : selectedItemsAirBese =
            myServices.sharedPreferences.getStringList('initselectedItemsAirBese') as List<String>;
//------
    myServices.sharedPreferences.getStringList('initselectedItemsMixer') == null
        ? selectedItemsMixer = []
        : selectedItemsMixer =
            myServices.sharedPreferences.getStringList('initselectedItemsMixer') as List<String>;
//------
    AudioNote =
        TextEditingController(text: myServices.sharedPreferences.getString('initAudioNote'));
    intailData();
    super.onInit();
  }

  List<String> selectedItemsMic = [];
  List<String> selectedItemsAirBese = [];
  List<String> selectedItemsMixer = [];
  @override
  goToAddLight() {
    myServices.sharedPreferences.setString("selectedItemsMic", selectedItemsMic.toString());
    myServices.sharedPreferences.setString("selectedItemsAirBese", selectedItemsAirBese.toString());
    myServices.sharedPreferences.setString("selectedItemsMixer", selectedItemsMixer.toString());
    myServices.sharedPreferences.setString("AudioNote", AudioNote.text);
    Get.offAndToNamed(AppRoute.ordereditlight);
  }

  @override
  onchangeMic(value) {
    selectedItemsMic = value as List<String>;
    update();
  }

  @override
  onchangeAirBese(value) {
    selectedItemsAirBese = value as List<String>;
    update();
  }

  @override
  onchangeMixer(value) {
    selectedItemsMixer = value as List<String>;
    update();
  }

  @override
  backToHome() {
    Get.offAllNamed(AppRoute.homepage);
  }
}
