import 'package:app01/controller/order/order_view_main_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/screen/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderViewMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    OrderViewMainContrllerImp controllerPub = Get.put(OrderViewMainContrllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text("Order List (Main View)"),
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
            controllerPub.goToAddOrder();
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
        body: GetBuilder<OrderViewMainContrllerImp>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                      itemCount: controller.data.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          background: Container(color: Color.fromARGB(255, 93, 161, 168)),
                          //key: Key('anyString'),
                          //ValueKey<String>(controller.data[index]['Reserv_ID']),
                          onDismissed: ((direction) {
                            controller.resID = controller.data[index]['Reserv_ID'].toString();
                            controller.deleteOrder();
                          }),
                          child: InkWell(
                            onTap: () {
                              controller.resID = controller.data[index]['Reserv_ID'].toString();
                              controller.goToViewDetails();
                            },
                            child: Card(
                              color: AppColor.secoundColor,
                              child: ListTile(
                                iconColor: AppColor.primaryColor,
                                leading: Text(
                                  "${Jiffy(controller.data[index]['Reserv_Start_DateTime']).fromNow()}",
                                  //"${Jiffy(controller.data[index]['Reserv_Start_DateTime']).add(hours: 4).fromNow()}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: AppColor.primaryColor),
                                ),
                                title: Text("${controller.data[index]['Reserv_Title']}"),
                                subtitle: Text("${controller.data[index]['Reserv_Descriptions']}"),
                                trailing: IconButton(
                                    autofocus: true,
                                    splashColor: Color.fromARGB(255, 5, 60, 77),
                                    onPressed: () {
                                      controller.resID =
                                          controller.data[index]['Reserv_ID'].toString();
                                      controller.goToEditOrder();
                                    },
                                    icon: Icon(
                                      Icons.edit_note_rounded,
                                      size: 38,
                                    )),
                              ),
                            ),
                          ),
                        );
                      }),
                )));
  }
}
