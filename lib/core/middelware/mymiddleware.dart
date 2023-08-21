import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myService = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myService.sharedPreferences.getString("step") == "2") {
      return RouteSettings(name: AppRoute.homepage);
    }

    if (myService.sharedPreferences.getString("step") == "1") {
      return RouteSettings(name: AppRoute.login);
    }

    return null;
  }
}
