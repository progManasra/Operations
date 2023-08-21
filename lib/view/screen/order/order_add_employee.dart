import 'package:app01/controller/order/order_add_employee_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:app01/view/widget/Order/customtextform.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OrderAddEmployee extends StatelessWidget {
  OrderAddEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    OrderAddEmployeeControllerImp controllerPub = Get.put(OrderAddEmployeeControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Adding General Employee's"),
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
          controllerPub.goToAddLocationAndTransportation();
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
      body: GetBuilder<OrderAddEmployeeControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Add Details Of General Employees',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //------------------------------Production DropDown List--------------
                  Container(
                    child: Text(
                      "Production",
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
                        items: controller.ProductionList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpProduction.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpProduction.remove(
                                            item['Employee_ID'] +
                                                " " +
                                                item['Employee_Email'] +
                                                " " +
                                                item['Employee_Dep_ID'])
                                        : controller.selectedEmpProduction.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeProduction; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpProduction.isEmpty
                            ? null
                            : controller.selectedEmpProduction.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.ProductionList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpProduction.join(', '),
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
                  //------------------------------Program DropDown List--------------
                  Container(
                    child: Text(
                      "Program",
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
                        items: controller.ProgramList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpProgram.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpProgram.remove(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID'])
                                        : controller.selectedEmpProgram.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeProgram; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpProgram.isEmpty
                            ? null
                            : controller.selectedEmpProgram.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.ProgramList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpProgram.join(', '),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
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
                  //------------------------------Studio  DropDown List--------------
                  Container(
                    child: Text(
                      "Studio Engineer",
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
                        items: controller.StudioList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpStudio.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpStudio.remove(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID'])
                                        : controller.selectedEmpStudio.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller.selectedEmpStudio;
                                    controller.update();
                                    //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
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
                        value: controller.selectedEmpStudio.isEmpty
                            ? null
                            : controller.selectedEmpStudio.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.StudioList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpStudio.join(', '),
                                  style: const TextStyle(
                                    fontSize: 18,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
                  ),
                  //------------------------------Direction DropDown List--------------
                  Container(
                    child: Text(
                      "Direction",
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
                        items: controller.DirectionList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpDirection.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpDirection.remove(
                                            item['Employee_ID'] +
                                                " " +
                                                item['Employee_Email'] +
                                                " " +
                                                item['Employee_Dep_ID'])
                                        : controller.selectedEmpDirection.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeDirection; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpDirection.isEmpty
                            ? null
                            : controller.selectedEmpDirection.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.DirectionList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpDirection.join(', '),
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
                  ), //------------------------------Camera DropDown List--------------
                  Container(
                    child: Text(
                      "Camera",
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
                        items: controller.CameraList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpCamera.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpCamera.remove(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID'])
                                        : controller.selectedEmpCamera.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeDirection; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpCamera.isEmpty
                            ? null
                            : controller.selectedEmpCamera.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.CameraList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpCamera.join(', '),
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
                  ), //------------------------------Audio DropDown List--------------
                  Container(
                    child: Text(
                      "Audio",
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
                        items: controller.AudioList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpAudio.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpAudio.remove(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID'])
                                        : controller.selectedEmpAudio.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeAudio; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpAudio.isEmpty
                            ? null
                            : controller.selectedEmpAudio.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.AudioList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpAudio.join(', '),
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
                  ), //------------------------------Light DropDown List--------------
                  Container(
                    child: Text(
                      "Light",
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
                        items: controller.LightList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpLight.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpLight.remove(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID'])
                                        : controller.selectedEmpLight.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeLight; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpLight.isEmpty
                            ? null
                            : controller.selectedEmpLight.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.LightList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpLight.join(', '),
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
                  ), //------------------------------Presentor DropDown List--------------
                  Container(
                    child: Text(
                      "Presentor",
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
                        items: controller.PresentorList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpPresentor.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpPresentor.remove(
                                            item['Employee_ID'] +
                                                " " +
                                                item['Employee_Email'] +
                                                " " +
                                                item['Employee_Dep_ID'])
                                        : controller.selectedEmpPresentor.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangePresentor; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpPresentor.isEmpty
                            ? null
                            : controller.selectedEmpPresentor.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.PresentorList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpPresentor.join(', '),
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
                  ), //------------------------------Reporter DropDown List--------------
                  Container(
                    child: Text(
                      "Reporter",
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
                        items: controller.ReporterList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpReporter.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpReporter.remove(
                                            item['Employee_ID'] +
                                                " " +
                                                item['Employee_Email'] +
                                                " " +
                                                item['Employee_Dep_ID'])
                                        : controller.selectedEmpReporter.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeReporter; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpReporter.isEmpty
                            ? null
                            : controller.selectedEmpReporter.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.ReporterList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpReporter.join(', '),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
                  ),
                  //------------------------------Office_Boy DropDown List--------------
                  Container(
                    child: Text(
                      "Office Boy",
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
                        items: controller.Office_BoyList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpOffice_Boy.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpOffice_Boy.remove(
                                            item['Employee_ID'] +
                                                " " +
                                                item['Employee_Email'] +
                                                " " +
                                                item['Employee_Dep_ID'])
                                        : controller.selectedEmpOffice_Boy.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeReporter; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpOffice_Boy.isEmpty
                            ? null
                            : controller.selectedEmpOffice_Boy.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.Office_BoyList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpOffice_Boy.join(', '),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
                  ),
                  //------------------------------Creative DropDown List--------------
                  Container(
                    child: Text(
                      "Creative",
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
                        items: controller.CreativeList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpCreative.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpCreative.remove(
                                            item['Employee_ID'] +
                                                " " +
                                                item['Employee_Email'] +
                                                " " +
                                                item['Employee_Dep_ID'])
                                        : controller.selectedEmpCreative.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeReporter; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value: controller.selectedEmpCreative.isEmpty
                            ? null
                            : controller.selectedEmpCreative.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.CreativeList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpCreative.join(', '),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
                                ),
                              );
                            },
                          ).toList();
                        },
                      ),
                    ),
                  ),
                  //------------------------------CG DropDown List--------------
                  Container(
                    child: Text(
                      "CG",
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
                        items: controller.CGList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedEmpCG.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedEmpCG.remove(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID'])
                                        : controller.selectedEmpCG.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    //This rebuilds the StatefulWidget to update the button's text
                                    controller
                                        .onchangeReporter; //This rebuilds the dropdownMenu Widget to update the check mark
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
                                          item['Employee_Email'].toString(),
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
                        value:
                            controller.selectedEmpCG.isEmpty ? null : controller.selectedEmpCG.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.CGList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedEmpCG.join(', '),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 2,
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
                    mycontroller: controller.EmployeeNote,
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ))),
    );
  }
}
