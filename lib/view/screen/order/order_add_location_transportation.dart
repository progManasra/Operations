import 'package:app01/controller/order/order_add_location_transportation_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:app01/view/widget/Order/customtextform.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OrderAddLocationAndTransportation extends StatelessWidget {
  OrderAddLocationAndTransportation({super.key});

  @override
  Widget build(BuildContext context) {
    OrderAddLocationAndTransportationControllerImp controllerPub =
        Get.put(OrderAddLocationAndTransportationControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Adding Location Equipment's",
          textAlign: TextAlign.center,
        ),
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
          controllerPub.goToAddSummary();
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
      body: GetBuilder<OrderAddLocationAndTransportationControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 29),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Add Details Of Location And Transportation',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // //------------------------------Location DropDown List--------------
                  Container(
                    child: Text(
                      "Location",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    color: AppColor.secoundColor,
                  ),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 20),
                  //   child: DropdownButtonHideUnderline(
                  //     child: DropdownButton2(
                  //       isExpanded: true,
                  //       hint: Align(
                  //         alignment: AlignmentDirectional.center,
                  //         child: Text(
                  //           'Select here',
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             color: Theme.of(context).hintColor,
                  //           ),
                  //         ),
                  //       ),
                  //       items: controller.LocationList.map((item) {
                  //         return DropdownMenuItem<String>(
                  //           value: item['Location_Name'] + " " + item['Location_ID'],
                  //           enabled: false,
                  //           child: StatefulBuilder(
                  //             builder: (context, menuSetState) {
                  //               final _isSelected = controller.selectedItemsLocation
                  //                   .contains(item['Location_Name'] + " " + item['Location_ID']);
                  //               return InkWell(
                  //                 onTap: () {
                  //                   _isSelected
                  //                       ? controller.selectedItemsLocation.remove(
                  //                           item['Location_Name'] + " " + item['Location_ID'])
                  //                       : controller.selectedItemsLocation
                  //                           .add(item['Location_Name'] + " " + item['Location_ID']);
                  //                   controller.onchangeLocation;
                  //                   controller.update();
                  //                   menuSetState(() {});
                  //                 },
                  //                 child: Container(
                  //                   height: double.infinity,
                  //                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //                   child: Row(
                  //                     children: [
                  //                       _isSelected
                  //                           ? const Icon(Icons.check_box_outlined)
                  //                           : const Icon(Icons.check_box_outline_blank),
                  //                       const SizedBox(width: 16),
                  //                       Text(
                  //                         item['Location_Name'].toString(),
                  //                         style: const TextStyle(
                  //                           fontSize: 16,
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         );
                  //       }).toList(),
                  //       value: controller.selectedItemsLocation.isEmpty
                  //           ? null
                  //           : controller.selectedItemsLocation.last,
                  //       onChanged: (value) {},
                  //       buttonHeight: 40,
                  //       buttonWidth: 140,
                  //       itemHeight: 40,
                  //       itemPadding: EdgeInsets.zero,
                  //       selectedItemBuilder: (context) {
                  //         return controller.LocationList.map(
                  //           (item) {
                  //             return Container(
                  //               alignment: AlignmentDirectional.center,
                  //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  //               child: Text(
                  //                 controller.selectedItemsLocation.join(', '),
                  //                 style: const TextStyle(
                  //                   fontSize: 16,
                  //                   overflow: TextOverflow.ellipsis,
                  //                 ),
                  //                 maxLines: 1,
                  //               ),
                  //             );
                  //           },
                  //         ).toList();
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  //------------------------------New Location List ------------------------
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
                        items: controller.LocationList.map((item) => DropdownMenuItem<String>(
                              value: item['Location_ID'] + " " + item['Location_Name'],
                              child: Text(
                                item["Location_Name"],
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            )).toList(),
                        value: controller.selectedItemsLocation,
                        onChanged: (value) {
                          controller.onchangeLocation(value!);
                        },
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                      ),
                    ),
                  ),
                  //------------------------------Transportation DropDown List--------------
                  Container(
                    child: Text(
                      "Transportation",
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
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        items: controller.CarList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Car_ID'] + " " + item['Car_Type'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsTransportation
                                    .contains(item['Car_ID'] + " " + item['Car_Type']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsTransportation
                                            .remove(item['Car_ID'] + " " + item['Car_Type'])
                                        : controller.selectedItemsTransportation
                                            .add(item['Car_ID'] + " " + item['Car_Type']);
                                    controller.onchangeTransportation;
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
                                          item['Car_Type'].toString(),
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
                        value: controller.selectedItemsTransportation.isEmpty
                            ? null
                            : controller.selectedItemsTransportation.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.CarList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsTransportation.join(', '),
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
                  //------------------------------Driver DropDown List--------------
                  Container(
                    child: Text(
                      "Driver",
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
                              fontSize: 14,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                        ),
                        items: controller.DriverList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Employee_ID'] +
                                " " +
                                item['Employee_Email'] +
                                " " +
                                item['Employee_Dep_ID'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsDriver.contains(
                                    item['Employee_ID'] +
                                        " " +
                                        item['Employee_Email'] +
                                        " " +
                                        item['Employee_Dep_ID']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsDriver.remove(
                                            item['Employee_ID'] +
                                                " " +
                                                item['Employee_Email'] +
                                                " " +
                                                item['Employee_Dep_ID'])
                                        : controller.selectedItemsDriver.add(item['Employee_ID'] +
                                            " " +
                                            item['Employee_Email'] +
                                            " " +
                                            item['Employee_Dep_ID']);
                                    controller.onchangeDriver;
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
                        value: controller.selectedItemsDriver.isEmpty
                            ? null
                            : controller.selectedItemsDriver.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.DriverList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsDriver.join(', '),
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
                    hinttext: 'Add Notes Here',
                    isNumber: false,
                    maxLine: 8,
                    labletext: 'Add special request',
                    valid: (String? val) {
                      return validInput(val!, 3, 100, "text");
                    },
                    mycontroller: controller.LocationNote,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ))),
    );
  }
}
