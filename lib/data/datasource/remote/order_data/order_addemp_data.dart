import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class OrderAddEmpData {
  Curd curd;
  OrderAddEmpData(this.curd);

  getData(String userid) async {
    var response = await curd.postData(AppLink.OrderAddEmp, {"userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
