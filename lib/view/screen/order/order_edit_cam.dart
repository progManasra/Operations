import 'package:app01/controller/order/order_edit_cam_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:app01/view/widget/Order/customtextform.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OrderEditCam extends StatelessWidget {
  OrderEditCam({super.key});

  @override
  Widget build(BuildContext context) {
    OrderEditCamControllerImp controllerPub = Get.put(OrderEditCamControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Edit Camera Equipment's"),
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
          controllerPub.goToEditAudio();
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
      body: GetBuilder<OrderEditCamControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Edit Details Of Camera Equipments',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //------------------------------Camera DropDown List--------------
                  Container(
                    child: Text(
                      "Camera",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
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
                        items: controller.cameraList.map((item) {
                          return DropdownMenuItem<String>(
                            value: (item['Equipment_ID'] + " " + item['Equipment_Name']),
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsCamera
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsCamera.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsCamera.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeCamera;
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
                        value: controller.selectedItemsCamera.isEmpty
                            ? null
                            : controller.selectedItemsCamera.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.cameraList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsCamera.join(','),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 3,
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
                  //------------------------------Lenses DropDown List--------------
                  Container(
                    child: Text(
                      "Lenses",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
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
                        items: controller.LensesList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            //disable default onTap to avoid closing menu when selecting an item
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsLenses
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsLenses.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsLenses.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeCamera;
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
                        value: controller.selectedItemsLenses.isEmpty
                            ? null
                            : controller.selectedItemsLenses.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.LensesList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsLenses.join(','),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 3,
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
                  //------------------------------Gimbal DropDown List--------------
                  Container(
                    child: Text(
                      "Gimbal",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
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
                        items: controller.GimbalList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsGimbal
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsGimbal.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsGimbal.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeCamera;
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
                        value: controller.selectedItemsGimbal.isEmpty
                            ? null
                            : controller.selectedItemsGimbal.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.GimbalList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsGimbal.join(','),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 3,
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
                  //------------------------------Dron   DropDown List--------------
                  Container(
                    child: Text(
                      "Dron",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
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
                        items: controller.DronList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsDron
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsDron.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsDron.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeCamera;
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
                        value: controller.selectedItemsDron.isEmpty
                            ? null
                            : controller.selectedItemsDron.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.DronList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsDron.join(','),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 3,
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
                  //------------------------------Crain  DropDown List--------------
                  Container(
                    child: Text(
                      "Crain",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
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
                        items: controller.CrainList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsCrain
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsCrain.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsCrain.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeCamera;
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
                        value: controller.selectedItemsCrain.isEmpty
                            ? null
                            : controller.selectedItemsCrain.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.CrainList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsCrain.join(','),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  maxLines: 3,
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
                    hinttext: 'Add Notes Here',
                    isNumber: false,
                    maxLine: 8,
                    labletext: 'Add special request',
                    valid: (String? val) {
                      return validInput(val!, 3, 100, "text");
                    },
                    mycontroller: controller.CameraNote,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ))),
    );
  }
}
