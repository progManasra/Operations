import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderViewDetailsData {
  Curd curd;
  OrderViewDetailsData(this.curd);

  getData(String ResID) async {
    var response = await curd.postData(AppLink.OrderViewDetail, {"ResID": ResID});
    return response.fold((l) => l, (r) => r);
  }
}
