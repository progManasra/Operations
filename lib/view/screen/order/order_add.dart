import 'package:app01/controller/order/order_add_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:app01/view/widget/Order/customtextform.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OrderAdd extends StatelessWidget {
  OrderAdd({super.key});
  String dropdownvalue = 'Item 1';
  @override
  Widget build(BuildContext context) {
    OrderAddControllerImp controllerPub = Get.put(OrderAddControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Adding New"),
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
          controllerPub.goToAddCam();
        },
        backgroundColor: AppColor.primaryColor,
        child: Icon(
          Icons.next_plan_outlined,
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
      body: GetBuilder<OrderAddControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Add Details Of Order',
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CustomTextForm(
                    iconData: Icons.text_snippet_outlined,
                    hinttext: 'Add Title Here',
                    isNumber: false,
                    labletext: 'Title',
                    valid: (String? val) {
                      return validInput(val!, 3, 100, "text");
                    },
                    mycontroller: controller.OrderTitle,
                  ),
                  CustomTextForm(
                    iconData: Icons.text_snippet_outlined,
                    hinttext: 'Add Dicription/Notes Here',
                    isNumber: false,
                    maxLine: 4,
                    labletext: 'Discription',
                    valid: (String? val) {
                      return validInput(val!, 3, 100, "text");
                    },
                    mycontroller: controller.OrderDisc,
                  ),
                  Container(
                    child: Text(
                      "Select Start Date/Time of order",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.date,
                      initTime: DateTime.now(),
                      minTime: DateTime.now().subtract(Duration(days: 10000)),
                      maxTime: DateTime.now().add(Duration(days: 10000)),
                      barrierColor: AppColor.secoundColor,
                      onChange: (dateTime) {
                        controller.update();
                        controller.OrderStartDate = dateTime.toString();
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.time,
                      initTime: DateTime.now(),
                      minTime: DateTime.now().subtract(Duration(days: 10)),
                      maxTime: DateTime.now().add(Duration(days: 10)),
                      barrierColor: AppColor.secoundColor,
                      onChange: (dateTime) {
                        controller.update();
                        controller.OrderStartTime = dateTime.toString();
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "Select End Date/Time of order",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.date,
                      initTime: DateTime.now(),
                      minTime: DateTime.now().subtract(Duration(days: 10000)),
                      maxTime: DateTime.now().add(Duration(days: 10000)),
                      barrierColor: AppColor.secoundColor,
                      onChange: (dateTime) {
                        controller.OrderEndtDate = dateTime.toString();
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TimePickerSpinnerPopUp(
                      mode: CupertinoDatePickerMode.time,
                      initTime: DateTime.now(),
                      minTime: DateTime.now().subtract(Duration(hours: 10)),
                      maxTime: DateTime.now().add(Duration(hours: 10)),
                      barrierColor: AppColor.secoundColor,
                      onChange: (dateTime) {
                        controller.OrderEndTime = dateTime.toString();
                      },
                    ),
                  ),
                  Container(
                    child: Text(
                      "Select Production Type",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  ////////////////////////////////
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          "Select",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controller.data_Production
                            .map((item) => DropdownMenuItem<String>(
                                  value: item["Production_Type_ID"] +
                                      " " +
                                      item["Production_Type_Name"],
                                  child: Text(
                                    item["Production_Type_Name"],
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: controller.selectedValue_production_type,
                        onChanged: (value) {
                          controller.onchangeProduction(value!);
                        },
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                      ),
                    ),
                  ),
                  ////////////////////////////////
                  Container(
                    child: Text(
                      "Select Order Type",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        hint: Text(
                          "Select",
                          style: TextStyle(
                            fontSize: 14,
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        items: controller.data_Order
                            .map((item) => DropdownMenuItem<String>(
                                  value: (item["Order_Type_ID"] + " " + item["Order_Type_Name"])
                                      .toString(),
                                  child: Text(
                                    item["Order_Type_Name"],
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ))
                            .toList(),
                        value: controller.selectedValue_order_type,
                        onChanged: (value) {
                          controller.onchangeOrderType(value!);
                        },
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 40,
                  ),
                ],
              ))),
    );
  }
}
