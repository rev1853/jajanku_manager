// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:jajanku_manager/contracts/LoginViewContract.dart';
import 'package:jajanku_manager/services/LoginServices.dart';

class LoginPresenter extends GetxController {
  late LoginViewContract _loginviewcontract;
  LoginService _loginservices = LoginService();

  var isAuthenticate = false.obs;
  var username = "".obs;
  var email = "".obs;

  void login(String email, String password) async {
    _loginservices
        .login(email, password)
        .then((value) => _loginviewcontract.onLoginSuccess(value))
        .catchError(
      (message) {
        _loginviewcontract.onLoginFailed(
            message is String ? message : "Gagal melakukan autentikasi");
      },
    );
  }

  set loginviewcontract(LoginViewContract loginviewcontract) {
    _loginviewcontract = loginviewcontract;
  }
}
