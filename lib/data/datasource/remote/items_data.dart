import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class ItemsData {
  Curd curd;
  ItemsData(this.curd);

  getData(String id, String userid) async {
    var response = await curd
        .postData(AppLink.items, {"id": id.toString(), "userid": userid});
    return response.fold((l) => l, (r) => r);
  }
}
