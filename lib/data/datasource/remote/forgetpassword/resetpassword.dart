import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class ResetPasswordData {
  Curd curd;
  ResetPasswordData(this.curd);

  postData(
    String email,
    String password,
  ) async {
    var response = await curd.postData(AppLink.resetPassword2, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
