import 'package:app01/controller/home/profile_controller.dart';
import 'package:app01/core/class/handlingdataview.dart';
import 'package:app01/core/constant/color.dart';
import 'package:app01/view/widget/customappbar.dart';
import 'package:app01/view/widget/home/customcardhome.dart';
import 'package:app01/view/widget/home/customtitlehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileControllerImp controllerPub = Get.put(ProfileControllerImp());
    return GetBuilder<ProfileControllerImp>(builder: (controller) {
      return SafeArea(
        child: HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ListView(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor, borderRadius: BorderRadius.circular(10)),
                      currentAccountPicture: CircleAvatar(
                          backgroundColor: AppColor.secoundColor,
                          child: Icon(
                            Icons.person,
                            size: 50,
                            color: AppColor.therdColor,
                          )),
                      accountName: Text("Name: ${controller.firstname}"),
                      accountEmail: Text("Email: ${controller.myEmail}")),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.secoundColor, borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
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
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.secoundColor, borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        color: AppColor.primaryColor,
                        size: 35,
                      ),
                      title: Text(
                        "Edit Profile",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.1),
                      ),
                      onTap: () {
                        controller.editProfile();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.secoundColor, borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.info_outline_rounded,
                        color: AppColor.primaryColor,
                        size: 35,
                      ),
                      title: Text(
                        "About",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.1),
                      ),
                      onTap: () {
                        controller.about();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.secoundColor, borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: Icon(
                        Icons.contact_mail_outlined,
                        color: AppColor.primaryColor,
                        size: 35,
                      ),
                      title: Text(
                        "Contact us",
                        style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: 1.1),
                      ),
                      onTap: () {
                        controller.contactUs();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.secoundColor, borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
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
                  ),
                ],
              ),
            )),
      );
    });
  }
}
