import 'package:get/get.dart';

bool hasMatch(String? value, String pattern) {
  return (value == null) ? false : RegExp(pattern).hasMatch(value);
}

validInput(String val, int min, int max, String type) {
  bool isSbaEmail(String s) => hasMatch(s, '\b*@sba.net.ae\$');

  if (type == "firstname") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid UserName";
    }
  }
  if (type == "lastname") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid UserName";
    }
  }
  if (type == "profile") {
    if (!GetUtils.isNumericOnly(val)) {
      return "Not Valid profile Number";
    }
  }
  if (type == "email") {
    if (!isSbaEmail(val)) {
      return "Not Valid Email";
    }
  }

  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return "Not Valid Phone Number";
    }
  }
  if (type == "mytext") {
    if (val.isEmpty) {
      return "value can't be empty";
    }
  }

  if (val.isEmpty) {
    return "value can't be empty";
  }
  if (val.length < min) {
    return "value can't be less than $min";
  }
  if (val.length > max) {
    return "value can't be more than $max";
  }
  if (type == "text") {
    if (!GetUtils.isUsername(val)) {
      return "Not Valid text";
    }
  }
}
