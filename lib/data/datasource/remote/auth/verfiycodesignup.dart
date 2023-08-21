import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class VerfiyCodeSignUpData {
  Curd curd;
  VerfiyCodeSignUpData(this.curd);

  postData(String email, String verfiycode) async {
    var response = await curd.postData(AppLink.verfiycodesignUp2, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
