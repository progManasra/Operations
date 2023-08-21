import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderDeleteData {
  Curd curd;
  OrderDeleteData(this.curd);

  postData(String ResID) async {
    var response = await curd.postData(AppLink.OrderDelete, {
      "ResID": ResID,
    });
    return response.fold((l) => l, (r) => r);
  }
}
