import 'package:app01/controller/equipment/equipment_view_by_dept_controller.dart';
import 'package:app01/controller/equipment/equipment_view_detail_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/linkapi.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentViewDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EquipmentViewDetailControllerImp controllerPub = Get.put(EquipmentViewDetailControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Equipment View Detail"),
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
            controllerPub.goToEquipmentEdit();
          },
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            Icons.edit,
            size: 45,
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
        body: GetBuilder<EquipmentViewDetailControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Builder(builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: AppColor.primaryColor)),
                      child: ListView(
                        children: [
                          Container(
                              child: Image.network(
                                  "${AppLink.imagestatic2}/${controller.myData[0]['Equipment_Picture']}")),
                          Text(
                            controller.myData[0]['Equipment_Name'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: AppColor.primaryColor),
                          ),
                          Row(
                            children: [
                              Text(
                                'Equipment Serial Number: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              Spacer(),
                              Text(
                                controller.myData[0]['Equipment_Serial_Number'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Equipment Barcode: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              Spacer(),
                              Text(
                                controller.myData[0]['Equipment_Barcode'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Equipment Specification: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                controller.myData[0]['Equipment_Specification'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                                maxLines: 3,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Equipment Model Number: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              Spacer(),
                              Text(
                                controller.myData[0]['Equipment_Model_Number'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Equipment Start Service: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              Spacer(),
                              Text(
                                controller.myData[0]['Equipment_Start_Service'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Equipment Added By: ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              Spacer(),
                              Text(
                                controller.myData[0]['Equipment_Added_By_Emp_ID'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                )));
  }
}
