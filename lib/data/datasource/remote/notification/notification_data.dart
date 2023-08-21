import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class NoteData {
  Curd curd;
  NoteData(this.curd);

  getData() async {
    var response = await curd.postData(AppLink.NotificationView, {});
    return response.fold((l) => l, (r) => r);
  }
}
