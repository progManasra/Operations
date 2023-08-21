import 'package:flutter/material.dart';

class CustomTextFormAuth extends StatelessWidget {
  const CustomTextFormAuth(
      {super.key,
      required this.hinttext,
      required this.labletext,
      this.iconData,
      this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obsecureText,
      this.onTapIcon});
  final String hinttext;
  final String labletext;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final bool? obsecureText;
  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        obscureText:
            obsecureText == null || obsecureText == false ? false : true,
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          hintText: hinttext,
          helperStyle: TextStyle(fontSize: 14),
          label: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(labletext)),
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
