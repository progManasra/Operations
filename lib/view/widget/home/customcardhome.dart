import 'package:app01/controller/home/home_controller.dart';
import 'package:app01/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCardHome extends GetView<HomeControllerImp> {
  final String title;
  final String body;

  const CustomCardHome({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: ListTile(
              title: Text(
                title,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                body,
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            height: 150,
            decoration: BoxDecoration(
                color: AppColor.primaryColor, borderRadius: BorderRadius.circular(10)),
          ),
          // Positioned(
          //   top: -20,
          //   right: controller.lang == "en" ? -20 : null,
          //   left: controller.lang == "ar" ? -20 : null,
          //   child: Container(
          //     height: 160,
          //     width: 160,
          //     decoration: BoxDecoration(
          //       color: AppColor.secoundColor,
          //       borderRadius: BorderRadius.circular(160),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
