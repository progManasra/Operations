import 'package:app01/controller/equipment/equipment_add_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/core/functions/validinput.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EquipmentAdd extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EquipmentAddControllerImp controllerPub = Get.put(EquipmentAddControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Equipment Add New"),
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
            controllerPub.sendData();
          },
          backgroundColor: AppColor.primaryColor,
          child: Icon(
            Icons.done,
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
        body: GetBuilder<EquipmentAddControllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColor.primaryColor)),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            validator: (value) {
                              return validInput(value!, 3, 100, "text");
                            },
                            maxLines: 1,
                            controller: controller.Equipment_Name_Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                              hintText: 'Add Name Of Equipment',
                              //labelText: 'my label text',
                              helperStyle: TextStyle(fontSize: 14),
                              label: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Add Name Of Equipment')),
                              suffixIcon: InkWell(
                                  onTap: () {}, child: Icon(Icons.app_registration_rounded)),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              return validInput(value!, 3, 100, "text");
                            },
                            maxLines: 1,
                            controller: controller.Equipment_Specification_Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),

                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                              hintText: 'Add Discription Of Equipment',
                              //labelText: 'my label text',
                              helperStyle: TextStyle(fontSize: 14),
                              label: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Add Discription Of Equipment')),
                              suffixIcon: InkWell(onTap: () {}, child: Icon(Icons.comment_rounded)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              return validInput(value!, 3, 100, "text");
                            },
                            maxLines: 1,
                            controller: controller.Equipment_Serial_Number_Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                              hintText: 'Serial Number',
                              helperStyle: TextStyle(fontSize: 14),
                              label: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Serial Number')),
                              suffixIcon: InkWell(onTap: () {}, child: Icon(Icons.comment_rounded)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              return validInput(value!, 3, 100, "text");
                            },
                            maxLines: 1,
                            controller: controller.Equipment_Barcode_Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                              hintText: 'BarCode',
                              //labelText: 'my label text',
                              helperStyle: TextStyle(fontSize: 14),
                              label: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('BarCode')),
                              suffixIcon: InkWell(onTap: () {}, child: Icon(Icons.qr_code)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            validator: (value) {
                              return validInput(value!, 3, 100, "text");
                            },
                            maxLines: 1,
                            controller: controller.Equipment_Model_Number_Controller,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: AppColor.primaryColor),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                              hintText: 'Model Number',
                              //labelText: 'my label text',
                              helperStyle: TextStyle(fontSize: 14),
                              label: Container(
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text('Model Number')),
                              suffixIcon:
                                  InkWell(onTap: () {}, child: Icon(Icons.text_fields_outlined)),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          DropdownButtonHideUnderline(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColor.primaryColor,
                              ),
                            ),
                            child: DropdownButton2(
                              hint: Text("Select Department"),
                              items: controller.DataEqipDept.map((item) => DropdownMenuItem<String>(
                                  value: item['Dep_Name'], child: Text(item['Dep_Name']))).toList(),
                              value: controller.selectedValueDept,
                              onChanged: (value) {
                                controller.onChangeDep(value!);
                                print(value);
                              },
                            ),
                          )),
                          SizedBox(
                            height: 20,
                          ),
                          DropdownButtonHideUnderline(
                              child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: AppColor.primaryColor,
                              ),
                            ),
                            child: DropdownButton2(
                              hint: Text("Select Equipment Catigore"),
                              items: controller.DataEqipCat.map((item) => DropdownMenuItem<String>(
                                  value: item['Equipment_Cat_Name'],
                                  child: Text(item['Equipment_Cat_Name']))).toList(),
                              value: controller.selectedValueCat,
                              onChanged: (value) {
                                controller.onChangeCat(value!);
                                print(value);
                              },
                            ),
                          )),
                          //upload image
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: AppColor.primaryColor),
                                color: AppColor.secoundColor),
                            child: InkWell(
                              child: const Text(
                                'Select Picture',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.primaryColor),
                              ),
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                      height: 200,
                                      child: Center(
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Select Photo from Gallery',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColor.primaryColor),
                                                ),
                                                Spacer(),
                                                IconButton(
                                                    onPressed: () {
                                                      controller.fileUploadGalleryFunc();
                                                    },
                                                    icon: Icon(
                                                      Icons.photo_size_select_actual_rounded,
                                                      size: 30,
                                                      color: AppColor.primaryColor,
                                                    )),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                SizedBox(
                                                  width: 30,
                                                ),
                                                Text(
                                                  'Take Photo From Camera',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold,
                                                      color: AppColor.primaryColor),
                                                ),
                                                Spacer(),
                                                IconButton(
                                                    onPressed: () {
                                                      controller.imageUploadCameraFunc();
                                                    },
                                                    icon: Icon(
                                                      Icons.camera_outlined,
                                                      size: 30,
                                                      color: AppColor.primaryColor,
                                                    )),
                                                SizedBox(
                                                  width: 30,
                                                ),
                                              ],
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.symmetric(vertical: 5, horizontal: 80),
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  border: Border.all(color: AppColor.primaryColor)),
                                              child: InkWell(
                                                highlightColor: AppColor.greyBlack,
                                                child: const Text('Close ',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.bold,
                                                        color: AppColor.primaryColor)),
                                                onTap: () => Navigator.pop(context),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          if (controller.file != null)
                            Card(
                                child: Image.file(
                              controller.file!,
                              scale: 0.5,
                            ))
                          else
                            Text("Picture Not Selected"),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
