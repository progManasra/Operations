import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  const CustomTextForm(
      {super.key,
      required this.hinttext,
      required this.labletext,
      this.iconData,
      this.mycontroller,
      required this.valid,
      required this.isNumber,
      this.obsecureText,
      this.onTapIcon,
      this.maxLine,
      this.myinitialValue});
  final String hinttext;
  final String labletext;
  final IconData? iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool isNumber;
  final int? maxLine;
  final bool? obsecureText;
  final String? myinitialValue;

  final void Function()? onTapIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        obscureText: obsecureText == null || obsecureText == false ? false : true,
        keyboardType:
            isNumber ? TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
        validator: valid,
        maxLines: maxLine,
        controller: mycontroller,
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          hintText: hinttext,
          helperStyle: TextStyle(fontSize: 14),
          label: Container(margin: EdgeInsets.symmetric(horizontal: 10), child: Text(labletext)),
          suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        initialValue: myinitialValue,
      ),
    );
  }
}
