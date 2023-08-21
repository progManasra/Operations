import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderViewMainData {
  Curd curd;
  OrderViewMainData(this.curd);

  getData(String userid) async {
    var response = await curd.postData(AppLink.OrderViewMain, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
