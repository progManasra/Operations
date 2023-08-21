import 'package:app01/controller/home/home_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/widget/customappbar.dart';
import 'package:app01/view/widget/home/customcardhome.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return GetBuilder<HomeControllerImp>(builder: (controller) {
      return HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                CustomCardHome(
                  title: ' Sharjah Broadcasting Authority',
                  body: 'Alsharqiya From Kalba',
                ),
                SizedBox(
                  height: 20,
                ),

                Container(
                  height: 80,
                  width: 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secoundColor,
                      ),
                      onPressed: () {
                        controller.goToOrders();
                      },
                      child: Text("Orders",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.secoundColor,
                      ),
                      onPressed: () {
                        controller.goToEquipments();
                      },
                      child: Text("Equipment's",
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                ),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColor.primaryColor,
                //     ),
                //     onPressed: () {},
                //     child: Text("Employee's",
                //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColor.primaryColor,
                //     ),
                //     onPressed: () {},
                //     child: Text("Transportation",
                //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColor.primaryColor,
                //     ),
                //     onPressed: () {},
                //     child: Text("Check In/Out (Attindance)",
                //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColor.primaryColor,
                //     ),
                //     onPressed: () {},
                //     child: Text("Schedule",
                //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: AppColor.primaryColor,
                //     ),
                //     onPressed: () {},
                //     child: Text("Location",
                //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ));
    });
  }
}
