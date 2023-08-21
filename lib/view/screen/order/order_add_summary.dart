// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:app01/controller/order/order_add_summary_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderAddSummary extends StatelessWidget {
  OrderAddSummary({super.key});

  @override
  Widget build(BuildContext context) {
    OrderAddSummaryControllerImp controllerPub = Get.put(OrderAddSummaryControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order Adding Summary",
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                controllerPub.goBack();
              },
              icon: Icon(Icons.backspace_rounded)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controllerPub.SendRequest();
          controllerPub.goToAddHame();
        },
        backgroundColor: AppColor.primaryColor,
        child: Icon(
          Icons.done_outline,
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
      body: GetBuilder<OrderAddSummaryControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "General Info",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    color: AppColor.therdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          "Title:",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "${controller.OrderTitle}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          "Date/Time Start: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "${controller.OrderStartDateTime}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          "Date/Time End: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "${controller.OrderEndDateTime}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          "Discription: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "${controller.OrderDisc}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          "production Type: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          "${controller.data_Production}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      children: [
                        Text(
                          "Order Type: ",
                          textAlign: TextAlign.start,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          //"test",
                          controller.data_Order,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: AppColor.primaryColor),
                        ),
                      ],
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Camera Equipment's ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    color: AppColor.therdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Camera: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsCamera}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Lenses: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsLenses}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Gimbal: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SingleChildScrollView(
                            child: Text(
                              "${controller.selectedItemsGimbal}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColor.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Dron: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SingleChildScrollView(
                            child: Text(
                              "${controller.selectedItemsDron}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColor.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Crain: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SingleChildScrollView(
                            child: Text(
                              "${controller.selectedItemsCrain}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColor.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Camera Notes: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          SingleChildScrollView(
                            child: Text(
                              "${controller.CameraNote.toString()}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: AppColor.primaryColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Audio Equipment's ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    color: AppColor.therdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Mic: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsMic}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Air Bese: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsAirBese}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Mixer: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsMixer}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Audio Note: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.AudioNote}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Light Equipment's ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    color: AppColor.therdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Light Unit: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemslightUnit}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Light Notes: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.LightNote}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "General Equipment's ",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    color: AppColor.therdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Laptop: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsLaptop}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "AutoCues: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsAutoCues}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Equipment Note: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.EquipmentNote}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Employees",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    color: AppColor.therdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Production Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpProduction}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Program Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpProgram}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Engineer Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpStudio}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Direction Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpDirection}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Camera Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpCamera}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Audio Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpAudio}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Light Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpLight}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Presentor Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpPresentor}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Reporter Department: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpReporter}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Office Boy: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpOffice_Boy}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Creative : ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpCreative}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "CG: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedEmpCG}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Employee Notes: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.EmployeeNote}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      "Location & Transportation & Driver",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                    ),
                    color: AppColor.therdColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Location: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsLocation}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Transportation/ Cars: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsTransportation}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Driver: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.selectedItemsDriver}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          Text(
                            "Location & Transportation Notes: ",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            "${controller.LocationNote}",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColor.primaryColor),
                          ),
                        ],
                      ),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ))),
    );
  }
}
