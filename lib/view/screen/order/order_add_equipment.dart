import 'package:app01/controller/order/order_add_equipment_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:app01/view/widget/Order/customtextform.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OrderAddEquipment extends StatelessWidget {
  OrderAddEquipment({super.key});

  @override
  Widget build(BuildContext context) {
    OrderAddEquipmentControllerImp controllerPub = Get.put(OrderAddEquipmentControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Adding General Equipment's"),
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
          controllerPub.goToAddemployee();
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
      body: GetBuilder<OrderAddEquipmentControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Add Details Of General Equipments',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //------------------------------Laptop DropDown List--------------
                  Container(
                    child: Text(
                      "Laptop",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  //////DropdownButton2 as Multiselect Dropdown with Checkboxes: #
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    //https://pub.dev/packages/dropdown_button2
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
                        items: controller.laptopList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsLaptop
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsLaptop.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsLaptop.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeLaptop; //This rebuilds the dropdownMenu Widget to update the check mark
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
                        //Use last selected item as the current value so if we've limited menu height,
                        ////it scroll to last item.
                        value: controller.selectedItemsLaptop.isEmpty
                            ? null
                            : controller.selectedItemsLaptop.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.laptopList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsLaptop.join(', '),
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
                  //------------------------------AutoCues DropDown List--------------
                  Container(
                    child: Text(
                      "AutoCues",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  //////DropdownButton2 as Multiselect Dropdown with Checkboxes: #
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    //https://pub.dev/packages/dropdown_button2
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Align(
                          alignment: AlignmentDirectional.center,
                          child: Text(
                            'Select here',
                            style: TextStyle(
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        items: controller.AutoCuesList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsAutoCues
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsAutoCues.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsAutoCues.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeAutoCues; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Equipment_Name'],
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
                        //Use last selected item as the current value so if we've limited menu height,
                        ////it scroll to last item.
                        value: controller.selectedItemsAutoCues.isEmpty
                            ? null
                            : controller.selectedItemsAutoCues.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.AutoCuesList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsAutoCues.join(', '),
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
                      title: 'Add Notes',
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
                    mycontroller: controller.EquipmentNote,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ))),
    );
  }
}
