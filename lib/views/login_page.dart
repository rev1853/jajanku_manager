// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
