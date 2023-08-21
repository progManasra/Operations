import 'dart:io';

import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class EquipmentAddEditDelData {
  Curd curd;
  EquipmentAddEditDelData(this.curd);

  getInitData() async {
    var response = await curd.postData(AppLink.EquipmentAddInit, {});
    return response.fold((l) => l, (r) => r);
  }

  addData(Map data, File file) async {
    var response = await curd.addRequestWithImageOne(AppLink.EquipmentAdd, data, file);
    return response.fold((l) => l, (r) => r);
  }

  //-----   OR  ----->

  // addData(
  //     String Equipment_Name,
  //     String Equipment_Category_ID,
  //     String Equipment_Picture,
  //     String Equipment_Serial_Number,
  //     String Equipment_Department_ID,
  //     String Equipment_Barcode,
  //     String Equipment_Specification,
  //     String Equipment_Model_Number,
  //     String Equipment_Added_By_Emp_ID) async {
  //   var response = await curd.postData(AppLink.EquipmentAdd, {
  //     "Equipment_Name": Equipment_Name,
  //     "Equipment_Category_ID": Equipment_Category_ID,
  //     "Equipment_Picture": Equipment_Picture,
  //     "Equipment_Serial_Number": Equipment_Serial_Number,
  //     "Equipment_Department_ID": Equipment_Department_ID,
  //     "Equipment_Barcode": Equipment_Barcode,
  //     "Equipment_Specification": Equipment_Specification,
  //     "Equipment_Model_Number": Equipment_Model_Number,
  //     "Equipment_Added_By_Emp_ID": Equipment_Added_By_Emp_ID,
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  editData(Map data, [File? file]) async {
    var response;
    if (file == null) {
      response = await curd.postData(AppLink.EquipmentEdit, data);
    } else {
      response = await curd.addRequestWithImageOne(AppLink.EquipmentEdit, data, file);
      return response.fold((l) => l, (r) => r);
    }
  }
// editData(Map data, File file) async {
//     var response = await curd.addRequestWithImageOne(AppLink.EquipmentEdit, data, file);
//     return response.fold((l) => l, (r) => r);
//   }

  DeleteData(Map data) async {
    var response = await curd.postData(AppLink.Equipmentdelete, data);
    return response.fold((l) => l, (r) => r);
  }
}
