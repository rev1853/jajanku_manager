// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/contracts/LoginViewContract.dart';
import 'package:jajanku_manager/presenters/LoginPresenter.dart';
import 'package:jajanku_manager/widgets/alert.dart';
import 'package:jajanku_manager/widgets/login_text_field.dart';

class LoginPage extends StatelessWidget implements LoginViewContract {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LoginPresenter loginpresenter = Get.find<LoginPresenter>();

  LoginPage() {
    loginpresenter.loginviewcontract = this;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DARK,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LoginTextField(
                      isPassword: false,
                      controller: _emailController,
                      label: "Username",
                      validator: (value) {
                        if (value == null || value == "") {
                          return "Username tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    LoginTextField(
                      isPassword: true,
                      controller: _passwordController,
                      label: "Password",
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Password tidak boleh kosong";
                        } else if (value.length < 6) {
                          return "Minimal 6 karakter";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) {
                          Get.snackbar("Form tidak sesuai",
                              "Mohon isi form dengan benar");
                        } else {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          loginpresenter.login(email, password);
                        }
                      },
                      child: Text(
                        "Log In",
                        style: TextStyle(
                          color: DARK,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: PRIMARY,
                        minimumSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: PRIMARY,
                        ),
                        primary: PRIMARY,
                        minimumSize: Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () {
                        // show the dialog
                        Get.dialog(InformationAlert(
                          title: "Lupa password?",
                          textContent:
                              "Jangan khawatir, coba ingat-ingat kembali kemudian coba login ulang",
                        ).info);
                      },
                      child: Text("Lupa Password?"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void onLoginFailed(String message) {
    // TODO: implement onLoginFailed
    Get.dialog(InformationAlert(
      textContent: message,
      title: "Kesalahan",
    ).danger);
  }

  @override
  void onLoginSuccess(Map loginData) {
    // TODO: implement onLoginSuccess
    if (loginData['login_status']) {
      Get.dialog(
        InformationAlert(
          textContent: loginData['login_message'],
          title: "Login",
        ).success,
      ).then(
        (value) {
          loginpresenter.isAuthenticate.value = true;
          loginpresenter.email.value = loginData['login_data']['user_email'];
          loginpresenter.username.value = loginData['login_data']['user_name'];
          Get.offNamed('/');
        },
      );
    } else {
      Get.dialog(InformationAlert(
        textContent: loginData['login_message'],
        title: "Login",
      ).warning);
    }
  }
}
