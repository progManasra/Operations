import 'package:app01/core/class/crud.dart';
import 'package:app01/linkapi.dart';

class SignupData {
  Curd curd;
  SignupData(this.curd);

  postData(String firstname, String lastname, String password, String email, String phone, String profile) async {
    var response = await curd.postData(AppLink.SignUp2, {
      "firstname": firstname,
      "lastname": lastname,
      "password": password,
      "email": email,
      "phone": phone,
      "profile": profile,
    });
    return response.fold((l) => l, (r) => r);
  }
}
