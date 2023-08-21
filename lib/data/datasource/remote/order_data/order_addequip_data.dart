import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderAddEqiupData {
  Curd curd;
  OrderAddEqiupData(this.curd);

  getData(String userid) async {
    var response =
        await curd.postData(AppLink.OrderAddEquip, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
