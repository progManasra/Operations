import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderAddSummaryData {
  Curd curd;
  OrderAddSummaryData(this.curd);

  postData(
    String OrderStartDateTime,
    String OrderEndDateTime,
    String OrderTitle,
    String OrderDisc,
    String selectedItemsLocationID,
    String data_Order_ID,
    String AddByEmp,
    String AddByEmpEmail,
    String data_Production_ID,
    String CameraNote,
    String AudioNote,
    String LightNote,
    String EquipmentNote,
    String EmployeeNote,
    String LocationNote,
    String EquipmentsListString,
    String EmployeesTemp2,
    String CARsTemp1,
    String EmployeesListStringDepID,
  ) async {
    var response = await curd.postData(AppLink.OrderAddSummary, {
      "OrderStartDateTime": OrderStartDateTime,
      "OrderEndDateTime": OrderEndDateTime,
      "OrderTitle": OrderTitle,
      "OrderDisc": OrderDisc,
      "Location_ID": selectedItemsLocationID,
      "data_Order": data_Order_ID,
      "AddByEmp": AddByEmp,
      "email": AddByEmpEmail,
      "data_Production": data_Production_ID,
      "CameraNote": CameraNote,
      "AudioNote": AudioNote,
      "LightNote": LightNote,
      "EquipmentNote": EquipmentNote,
      "EmployeeNote": EmployeeNote,
      "LocationNote": LocationNote,
      "EquipmentsList": EquipmentsListString,
      "EmployeesList": EmployeesTemp2,
      "CarList": CARsTemp1,
      "EmployeesListStringDepID": EmployeesListStringDepID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
