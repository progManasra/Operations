// ignore_for_file: deprecated_member_use

import 'package:app01/core/constant/routes.dart';
import 'package:app01/core/localization/changelocal.dart';
import 'package:app01/view/widget/language/custombuttomlang.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Language extends GetView<LocaleController> {
  const Language({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "1".tr,
              style: Theme.of(context).textTheme.headline1,
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtonLang(
              textbutton: 'Ar',
              onPressed: () {
                controller.changeLang("ar");
                Get.toNamed(AppRoute.OnBoarding);
              },
            ),
            CustomButtonLang(
              textbutton: 'En',
              onPressed: () {
                controller.changeLang("en");
                Get.toNamed(AppRoute.OnBoarding);
              },
            ),
          ],
        ),
      ),
    );
  }
}
