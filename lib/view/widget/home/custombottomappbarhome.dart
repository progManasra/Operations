import 'package:app01/controller/home/homescreen_controller.dart';
import 'package:app01/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 15,
              child: Row(
                children: [
                  ...List.generate(controller.listPage.length + 1, (index) {
                    int i = index > 2 ? index - 1 : index;
                    return index == 2
                        ? const Spacer()
                        : CustomButtonAppBar(
                            active: controller.currentpage == index ? true : false,
                            icondata: controller.AppBarBootomIcon[i],
                            onPressed: () {
                              controller.changePage(i);
                            },
                            textbutton: controller.titlebottomappbar[i],
                          );
                  })
                ],
              ),
            ));
  }
}
