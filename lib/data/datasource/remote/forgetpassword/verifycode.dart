import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class VerifyCodeFForgetPasswordData {
  Curd curd;
  VerifyCodeFForgetPasswordData(this.curd);

  postData(
    String email,
    String verfiycode,
  ) async {
    var response = await curd.postData(AppLink.verifycodeforgetpassword2, {
      "email": email,
      "verfiycode": verfiycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
