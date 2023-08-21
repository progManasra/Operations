import 'package:app01/controller/order/order_add_audio_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:app01/view/widget/Order/customtextform.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class OrderAddAudio extends StatelessWidget {
  OrderAddAudio({super.key});

  @override
  Widget build(BuildContext context) {
    OrderAddAudioControllerImp controllerPub = Get.put(OrderAddAudioControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text("Order Adding Audio Equipment's"),
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
          controllerPub.goToAddLight();
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
      body: GetBuilder<OrderAddAudioControllerImp>(
          builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(color: AppColor.secoundColor),
                    child: CustomTitleHome(
                      title: 'Add Details Of Audio Equipments',
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  //------------------------------Mic DropDown List--------------
                  Container(
                    child: Text(
                      "Mic",
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
                        items: controller.MicList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsMic
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsMic.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsMic.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeMic;
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
                        value: controller.selectedItemsMic.isEmpty
                            ? null
                            : controller.selectedItemsMic.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.MicList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsMic.join(', '),
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
                  //------------------------------AirBese DropDown List--------------
                  Container(
                    child: Text(
                      "AirBese",
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
                        items: controller.AirBeseList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsAirBese
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsAirBese.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsAirBese.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeAirBese;
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
                        value: controller.selectedItemsAirBese.isEmpty
                            ? null
                            : controller.selectedItemsAirBese.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.AirBeseList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsAirBese.join(', '),
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
                  //------------------------------Mixer   DropDown List--------------
                  Container(
                    child: Text(
                      "Mixer",
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
                        items: controller.AudioMixerList.map((item) {
                          return DropdownMenuItem<String>(
                            value: item['Equipment_ID'] + " " + item['Equipment_Name'],
                            enabled: false,
                            child: StatefulBuilder(
                              builder: (context, menuSetState) {
                                final _isSelected = controller.selectedItemsMixer
                                    .contains(item['Equipment_ID'] + " " + item['Equipment_Name']);
                                return InkWell(
                                  onTap: () {
                                    _isSelected
                                        ? controller.selectedItemsMixer.remove(
                                            item['Equipment_ID'] + " " + item['Equipment_Name'])
                                        : controller.selectedItemsMixer.add(
                                            item['Equipment_ID'] + " " + item['Equipment_Name']);
                                    controller.onchangeAirBese;
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
                        value: controller.selectedItemsMixer.isEmpty
                            ? null
                            : controller.selectedItemsMixer.last,
                        onChanged: (value) {},
                        buttonHeight: 40,
                        buttonWidth: 140,
                        itemHeight: 40,
                        itemPadding: EdgeInsets.zero,
                        selectedItemBuilder: (context) {
                          return controller.AudioMixerList.map(
                            (item) {
                              return Container(
                                alignment: AlignmentDirectional.center,
                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                child: Text(
                                  controller.selectedItemsMixer.join(', '),
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
                  CustomTextForm(
                    iconData: Icons.text_snippet_outlined,
                    hinttext: 'Add Notes Here',
                    isNumber: false,
                    maxLine: 8,
                    labletext: 'Add special request',
                    valid: (String? val) {
                      return validInput(val!, 3, 100, "text");
                    },
                    mycontroller: controller.AudioNote,
                  ),

                  SizedBox(
                    height: 40,
                  )
                ],
              ))),
    );
  }
}
