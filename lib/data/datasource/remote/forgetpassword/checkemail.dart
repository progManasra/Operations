import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class CheckEmailData {
  Curd curd;
  CheckEmailData(this.curd);

  postData(
    String email,
  ) async {
    var response = await curd.postData(AppLink.checkEmail2, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
