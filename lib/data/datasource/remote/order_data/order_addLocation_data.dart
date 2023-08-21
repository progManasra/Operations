import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderAddLocationData {
  Curd curd;
  OrderAddLocationData(this.curd);

  getData(String userid) async {
    var response =
        await curd.postData(AppLink.OrderAddLocation, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
