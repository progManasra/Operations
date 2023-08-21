import 'package:app01/controller/home/note_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/widget/customappbar.dart';
import 'package:app01/view/widget/home/customcardhome.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class Note extends StatelessWidget {
  const Note({super.key});

  @override
  Widget build(BuildContext context) {
    NoteControllerImp controllerPub = Get.put(NoteControllerImp());
    return GetBuilder<NoteControllerImp>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Notifications"),
          backgroundColor: AppColor.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  controllerPub.backToHome();
                },
                icon: Icon(Icons.arrow_back_ios_new))
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 7,
          color: AppColor.therdColor,
          child: Row(
            children: [
              IconButton(icon: Icon(Icons.menu), onPressed: () {}),
              Spacer(),
            ],
          ),
        ),
        body: GetBuilder<NoteControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: ListView.builder(
                    itemCount: controller.Data.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: AppColor.secoundColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColor.primaryColor)),
                        child: InkWell(
                            onTap: () {
                              controller.ResvID = controller.Data[index]['Notification_Reserv_ID'];
                              controller.goToDetails();
                            },
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "${controller.Data[index]['Notification_Title']}",
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Spacer(),
                                    Icon(Icons.note)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("${controller.Data[index]['Notification_Disc']}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "Edit By: ${controller.Data[index]['Notification_Emp_Email']}"),
                                    Spacer(),
                                    Icon(Icons.person_pin_rounded)
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${Jiffy(controller.Data[index]['Notification_DateTime']).add(hours: 4).fromNow()}",
                                      style: TextStyle(color: AppColor.primaryColor),
                                    ),
                                    Spacer(),
                                    Icon(Icons.date_range_outlined)
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            )),
                      );
                    }),
              )),
        ),
      );
    });
  }
}
