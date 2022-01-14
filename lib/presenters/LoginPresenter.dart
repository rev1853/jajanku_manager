// ignore_for_file: prefer_final_fields

import 'package:jajanku_manager/contracts/LoginViewContract.dart';
import 'package:jajanku_manager/services/LoginServices.dart';

class LoginPresenter {
  LoginViewContract _loginviewcontract;
  LoginServices _loginservices = LoginServices();

  LoginPresenter(this._loginviewcontract);

  void login(String email, String password) async {
    _loginservices
        .login(email, password)
        .then((value) => _loginviewcontract.onLoginSuccess(value))
        .catchError((message) {
      _loginviewcontract.onLoginFailed(
          message is String ? message : "Gagal melakukan autentikasi");
    });
  }
}
