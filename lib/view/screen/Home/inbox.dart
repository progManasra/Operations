import 'package:app01/controller/home/home_controller.dart';
import 'package:app01/controller/home/inbox_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/widget/customappbar.dart';
import 'package:app01/view/widget/home/customcardhome.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Inbox extends StatelessWidget {
  const Inbox({super.key});
  @override
  Widget build(BuildContext context) {
    InboxControllerImp controllerPub = Get.put(InboxControllerImp());
    return GetBuilder<InboxControllerImp>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                CustomCardHome(
                  title: ' Sharjah Broadcasting Authority',
                  body: 'Alsharqiya From Kalba',
                ),
                CustomTitleHome(
                  title: 'Inbox',
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ));
    });
  }
}
