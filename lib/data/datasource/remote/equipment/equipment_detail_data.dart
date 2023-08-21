import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class EquipmentViewDetailData {
  Curd curd;
  EquipmentViewDetailData(this.curd);

  getData(String EquipID) async {
    var response = await curd.postData(AppLink.EquipmentViewDetail, {"EquipID": EquipID});
    return response.fold((l) => l, (r) => r);
  }
}
