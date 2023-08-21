// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:app01/controller/order/order_view_details_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderViewdetails extends GetView<OrderViewdetailsControllerImp> {
  OrderViewdetails({super.key});

  Widget build(BuildContext context) {
    OrderViewdetailsControllerImp controllerPub = Get.put(OrderViewdetailsControllerImp());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order View details",
          textAlign: TextAlign.center,
        ),
        backgroundColor: AppColor.primaryColor,
        actions: [
          IconButton(
              onPressed: () {
                controllerPub.goToViewMain();
              },
              icon: Icon(Icons.arrow_back_ios_new))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controllerPub.goToEditOrder();
          //controllerPub.goToAddHame();
        },
        backgroundColor: AppColor.primaryColor,
        child: Icon(
          Icons.edit_note_rounded,
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
      body: GetBuilder<OrderViewdetailsControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: controller.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : ListView(
                      shrinkWrap: true,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "General Info",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
                              FutureBuilder(
                                  builder: ((context, snapshot) => Text(
                                        "${controller.dataReservation.elementAt(0)['Reserv_Title']}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                            color: AppColor.primaryColor),
                                      ))),
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
                                "${controller.dataReservation.elementAt(0)['Reserv_Start_DateTime']}",
                                //"${Jiffy(controller.dataReservation.elementAt(0)['Reserv_Start_DateTime']).add(hours: 4).fromNow()}",

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
                                "${controller.dataReservation.elementAt(0)['Reserv_End_DateTime']}",
                                // "${Jiffy(controller.dataReservation.elementAt(0)['Reserv_End_DateTime']).add(hours: 4).fromNow()}",

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
                                "${controller.dataReservation.elementAt(0)['Reserv_Descriptions']}",
                                //"free",
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
                        Builder(builder: (context) {
                          return Container(
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
                                  //"free",
                                  controller.dataReservation_Production_Type
                                      .elementAt(0)['Production_Type_Name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColor.primaryColor),
                                ),
                              ],
                            ),
                            color: AppColor.secoundColor,
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Builder(builder: (context) {
                          return Container(
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
                                  controller.dataReservation_Order_Type[0]['Order_Type_Name'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: AppColor.primaryColor),
                                ),
                              ],
                            ),
                            color: AppColor.secoundColor,
                          );
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Camera Equipment's ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
                                  "${controller.EqipStringCam}",
                                  //"free",
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
                                  "${controller.EqipStringLens}",
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
                                    "${controller.EqipStringGimbal}",
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
                                    "${controller.EqipStringDron}",
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
                                    "${controller.EqipStringCrain}",
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
                                //Spacer(),
                                Text(
                                  controller.dataReservation.elementAt(0)['Reservation_Note_Cam'],
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
                            "Audio Equipment's ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
                                  "${controller.EqipStringMic}",
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
                                  "${controller.EqipStringAirBese}",
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
                                  "${controller.EqipStringAudioMixer}",
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
                                  controller.dataReservation.elementAt(0)['Reservation_Note_Audio'],
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
                                  "${controller.EqipStringlighting}",
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
                                  controller.dataReservation.elementAt(0)['Reservation_Note_Light'],
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
                                  "${controller.EqipStringlaptop}",
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
                                  "${controller.EqipStringAutoCues}",
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
                                  controller.dataReservation.elementAt(0)['Reservation_Note_Equip'],
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
                                  "${controller.EmpStringProduction}",
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
                                  //
                                  //                            "${controller.selectedEmpProgram}",
                                  //"free",
                                  "${controller.EmpStringProgram}",
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
                                  //                            "${controller.selectedEmpStudio}",
                                  "${controller.EmpStringEng}",
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
                                  "${controller.EmpStringDirector}",
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
                                  "${controller.EmpStringCamera}",
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
                                  "${controller.EmpStringAudio}",
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
                                  "${controller.EmpStringLight}",
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
                                  "${controller.EmpStringPresentor}",
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
                                  "${controller.EmpStringReporter}",
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
                                  "${controller.EmpStringOfficeBoy}",
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
                                  "${controller.EmpStringCreative}",
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
                                  "${controller.EmpStringCG}",
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
                                  controller.dataReservation.elementAt(0)['Reservation_Note_Emp'],
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
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
                                  "${controller.LocationString}",
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
                                  "${controller.TranspString}",
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
                                  "${controller.EmpStringDriver}",
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
                                  controller.dataReservation
                                      .elementAt(0)['Reservation_Note_Location'],
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
                          height: 30,
                        ),
                        // SizedBox(
                        //   height: 40,
                        // ),
                      ],
                    ))),
    );
  }
}
