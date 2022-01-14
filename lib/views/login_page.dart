// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/contracts/LoginViewContract.dart';
import 'package:jajanku_manager/presenters/LoginPresenter.dart';
import 'package:jajanku_manager/widgets/alert.dart';
import 'package:jajanku_manager/widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginViewContract {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late LoginPresenter _loginpresenter;

  _LoginPageState() {
    _loginpresenter = LoginPresenter(this);
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
                    Positioned(
                      child: Image.asset(
                        "assets/images/logo.png",
                        width: 100,
                      ),
                      top: -20,
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
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Mohon isi form dengan benar"),
                            ),
                          );
                        } else {
                          String email = _emailController.text;
                          String password = _passwordController.text;
                          _loginpresenter.login(email, password);
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
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return InformationAlert(
                              title: "Lupa password?",
                              textContent:
                                  "Jangan khawatir, coba ingat-ingat kembali kemudian coba login ulang",
                            ).info;
                          },
                        );
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
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InformationAlert(
          textContent: message,
          title: "Kesalahan",
        ).danger;
      },
    );
  }

  @override
  void onLoginSuccess(Map loginData) {
    // TODO: implement onLoginSuccess

    if (loginData['login_status']) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return InformationAlert(
            textContent: loginData['login_message'],
            title: "Login",
          ).success;
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return InformationAlert(
            textContent: loginData['login_message'],
            title: "Login",
          ).warning;
        },
      );
    }
  }
}
