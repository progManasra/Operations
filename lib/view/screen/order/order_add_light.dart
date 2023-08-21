import 'package:app01/controller/order/order_add_light_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:app01/view/widget/Order/customtextform.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OrderAddLight extends StatelessWidget {
  OrderAddLight({super.key});

  @override
  Widget build(BuildContext context) {
    OrderAddLightControllerImp controllerPub = Get.put(OrderAddLightControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Adding Light Equipment's"),
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
          controllerPub.goToAddEquipment();
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
      body: GetBuilder<OrderAddLightControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Add Details Of Light Equipments',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //------------------------------Light DropDown List--------------
                  Container(
                    child: Text(
                      "LightUnit",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  //////DropdownButton2 as Multiselect Dropdown with Checkboxes: #
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Select here',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        items: controller.lighting_unitList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemslightUnit
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemslightUnit.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemslightUnit.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangelightUnit;
                                    controller.update();
                                    menuSetState(() {});
                                  },
                                  child: Container(
                                    height: double.infinity,
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                    child: Row(
                                      children: [
                                        _isSelected
                                            ? const Icon(Icons.check_box_outlined)
                                            : const Icon(Icons.check_box_outline_blank),
                                        const SizedBox(width: 16),
                                        Text(
                                          item['Equipment_Name'].toString(),
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }).toList(),
                        value: controller.selectedItemslightUnit.isEmpty
                            ? null
                            : controller.selectedItemslightUnit.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.lighting_unitList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemslightUnit.join(', '),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 1,
                                ),
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 30),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Add special request',
                    ),
                  ),
                  CustomTextForm(
                    iconData: Icons.text_snippet_outlined,
                    hinttext: 'Add special Here',
                    isNumber: false,
                    maxLine: 8,
                    labletext: 'Add special request',
                    valid: (String? val) {
                      return validInput(val!, 3, 100, "text");
                    },
                    mycontroller: controller.LightNote,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ))),
    );
  }
}
