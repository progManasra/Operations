import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class EquipmentViewByDeptData {
  Curd curd;
  EquipmentViewByDeptData(this.curd);

  getData(String EquipCatID) async {
    var response = await curd.postData(AppLink.EquipmentViewByDept, {"EquipCatID": EquipCatID});
    return response.fold((l) => l, (r) => r);
  }
}
