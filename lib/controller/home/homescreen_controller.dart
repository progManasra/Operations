import 'package:app01/core/constant/routes.dart';
import 'package:app01/view/screen/Home/home.dart';
import 'package:app01/view/screen/Home/inbox.dart';
import 'package:app01/view/screen/Home/profile.dart';
import 'package:app01/view/screen/Home/setting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
  goToNotification();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentpage = 0;
  List<Widget> listPage = [
    HomePage(),
    Profile(),
    Inbox(),
    Setting(),
  ];

  List titlebottomappbar = ["Home", "Profile", "Inbox", "Setting"];
  List AppBarBootomIcon = [Icons.home_outlined, Icons.person, Icons.inbox_outlined, Icons.settings];

  @override
  changePage(int i) {
    currentpage = i;
    update();
  }

  @override
  goToNotification() {
    Get.offNamed(AppRoute.note);
  }
}
