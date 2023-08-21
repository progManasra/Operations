import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() async {
  await Get.defaultDialog(title: "43".tr, middleText: "44".tr, actions: [
    ElevatedButton(
        onPressed: () {
          exit(0);
        },
        child: Text("45".tr)),
    ElevatedButton(
        onPressed: () {
          Get.back();
        },
        child: Text("46".tr)),
  ]);
  return Future.value(true);
}
