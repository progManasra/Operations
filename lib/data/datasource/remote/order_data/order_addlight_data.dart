import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderAddLightData {
  Curd curd;
  OrderAddLightData(this.curd);

  getData(String userid) async {
    var response =
        await curd.postData(AppLink.OrderAddLight, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
