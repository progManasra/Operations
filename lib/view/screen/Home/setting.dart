import 'package:app01/controller/home/setting_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/widget/customappbar.dart';
import 'package:app01/view/widget/home/customcardhome.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    SettingControllerImp controllerPub = Get.put(SettingControllerImp());

    Get.put(SettingControllerImp());
    return GetBuilder<SettingControllerImp>(builder: (controller) {
      return SafeArea(
        child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.secoundColor, borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.language,
                        color: AppColor.primaryColor,
                        size: 35,
                      ),
                      title: Text(
                        "Change Language",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.1),
                      ),
                      onTap: () {},
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      );
    });
  }
}
