import 'package:app01/controller/equipment/equipment_view_by_dept_controller.dart';
import 'package:app01/controller/equipment/equipment_view_main_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/constant/routes.dart';
import 'package:app01/linkapi.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentViewByDept extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EquipmentViewByDeptControllerImp controllerPub = Get.put(EquipmentViewByDeptControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Equipment View By Dept."),
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
            //controllerPub.goToAddOrder();
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
        body: GetBuilder<EquipmentViewByDeptControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SafeArea(
                      child: ListView(
                    padding: EdgeInsets.all(10),
                    children: [
                      //////////////////////////////////////////////////////////////////////////////////////
                      DropdownButtonHideUnderline(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: AppColor.secoundColor,
                              )),
                          child: DropdownButton2(
                            itemPadding: EdgeInsets.only(left: 2),
                            hint: Text(
                              'Select Type Of Equipment',
                              style: TextStyle(
                                height: 2,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 6, 68, 75),
                              ),
                              textAlign: TextAlign.center,
                            ),
                            items: controller.items
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.primaryColor,
                                      ),
                                    )))
                                .toList(),
                            value: controllerPub.selectedValue,
                            onChanged: (value) {
                              controller.onChangeType(value!);
                            },
                            buttonHeight: 50,
                            buttonWidth: 140,
                            itemHeight: 40,
                            focusColor: AppColor.therdColor,
                            barrierColor: AppColor.secoundColor,
                            buttonSplashColor: AppColor.therdColor,
                            buttonPadding: EdgeInsets.all(0),
                            alignment: Alignment.center,
                            dropdownPadding: EdgeInsets.only(left: 10),
                            icon: Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 50,
                            ),
                            buttonDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(color: AppColor.primaryColor)),
                          ),
                        ),
                      ),
                      //////////////////////////////////////////////////////////////////////////////////////
                      SizedBox(
                        height: 10,
                      ),
                      GridView.builder(
                        itemCount: controller.myData.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, mainAxisSpacing: 1, childAspectRatio: 1),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.EquipID = controller.myData[index]['Equipment_ID'];
                              controller.goToDetails();
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 204, 220, 223),
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Image.network(
                                      "${AppLink.imagestatic2}/${controller.myData[index]['Equipment_Picture']}",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  //Spacer(),
                                  Text(
                                    "${controller.myData[index]['Equipment_Name']}",
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  )),
                )));
  }
}
