import 'package:app01/controller/drawer_controller.dart';
import 'package:app01/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    DrawerControllerImp controller = Get.put(DrawerControllerImp());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: AppColor.primaryColor,
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: AppColor.secoundColor,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: AppColor.therdColor,
                  )),
              accountName: Text("Name: ${controller.firstname}"),
              accountEmail: Text("Email: ${controller.myEmail}")),
          ListTile(
            leading: Icon(
              Icons.password,
              color: AppColor.primaryColor,
              size: 35,
            ),
            title: Text(
              "Reset Password",
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.1),
            ),
            onTap: () {
              controller.resetPassword();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add_to_home_screen,
              color: AppColor.primaryColor,
              size: 35,
            ),
            title: Text(
              "Back to Home",
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.1),
            ),
            onTap: () {
              controller.backToHome();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: AppColor.primaryColor,
              size: 35,
            ),
            title: Text(
              "Log Off",
              style: TextStyle(
                  color: AppColor.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.1),
            ),
            onTap: () {
              controller.logOff();
            },
          ),
        ],
      ),
    );
  }
}
