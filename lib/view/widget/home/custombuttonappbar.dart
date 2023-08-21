import 'package:app01/controller/home/homescreen_controller.dart';
import 'package:app01/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class CustomButtonAppBar extends GetView<HomeScreenControllerImp> {
  final void Function()? onPressed;
  final IconData icondata;
  final String textbutton;
  final bool? active;
  const CustomButtonAppBar({
    super.key,
    required this.active,
    required this.onPressed,
    required this.icondata,
    required this.textbutton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icondata, color: active == true ? AppColor.primaryColor : AppColor.greyBlack),
          Text(
            textbutton,
            style: TextStyle(color: active == true ? AppColor.primaryColor : AppColor.greyBlack),
          ),
        ],
      ),
    );
  }
}
