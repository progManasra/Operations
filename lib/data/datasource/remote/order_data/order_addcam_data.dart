import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderAddCamData {
  Curd curd;
  OrderAddCamData(this.curd);

  getData(String userid) async {
    var response = await curd.postData(AppLink.OrderAddCam, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
