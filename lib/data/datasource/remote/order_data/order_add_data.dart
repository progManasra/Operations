import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderAddData {
  Curd curd;
  OrderAddData(this.curd);

  getData(String userid) async {
    var response = await curd.postData(AppLink.OrderAdd, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
