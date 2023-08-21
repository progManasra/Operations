import 'package:app01/controller/equipment/equipment_view_main_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentViewMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EquipmentViewMainControllerImp controllerPub = Get.put(EquipmentViewMainControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Equipment View Main"),
          backgroundColor: AppColor.primaryColor,
          actions: [
            IconButton(
                onPressed: () {
                  controllerPub.backToHome();
                },
                icon: Icon(Icons.arrow_back_ios_new))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controllerPub.addEquipment();
          },
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            Icons.add,
            size: 50,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
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
        drawer: MyDrawer(),
        body: GetBuilder<EquipmentViewMainControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: GridView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1, crossAxisCount: 2, mainAxisSpacing: 20),
                        children: [
                          Card(
                            color: AppColor.secoundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: AppColor.primaryColor)),
                            child: InkWell(
                                onTap: () {
                                  controller.setEquipCatID('1, 5, 6, 7, 11');
                                  controllerPub.goToEquipmentViewByDept();
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      color: AppColor.primaryColor,
                                      size: 120,
                                    ),
                                    Text(
                                      "Camera's",
                                      //textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor),
                                    )
                                  ],
                                )),
                          ),
                          Card(
                            color: AppColor.secoundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: AppColor.primaryColor)),
                            child: InkWell(
                                onTap: () {
                                  controller.setEquipCatID('4, 8, 9');
                                  controllerPub.goToEquipmentViewByDept();
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.mic_rounded,
                                      color: AppColor.primaryColor,
                                      size: 120,
                                    ),
                                    Text(
                                      "Audio",
                                      //textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor),
                                    )
                                  ],
                                )),
                          ),
                          Card(
                            color: AppColor.secoundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: AppColor.primaryColor)),
                            child: InkWell(
                                onTap: () {
                                  controller.setEquipCatID('2');
                                  controllerPub.goToEquipmentViewByDept();
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.light_mode_outlined,
                                      color: AppColor.primaryColor,
                                      size: 120,
                                    ),
                                    Text(
                                      "Lighting",
                                      //textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor),
                                    )
                                  ],
                                )),
                          ),
                          Card(
                            color: AppColor.secoundColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: AppColor.primaryColor)),
                            child: InkWell(
                                onTap: () {
                                  controller.setEquipCatID('3, 10');
                                  controllerPub.goToEquipmentViewByDept();
                                },
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.devices_sharp,
                                      color: AppColor.primaryColor,
                                      size: 120,
                                    ),
                                    Text(
                                      "General",
                                      //textScaleFactor: 1.0,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: AppColor.primaryColor),
                                    )
                                  ],
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
