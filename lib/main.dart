// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jajanku_manager/presenters/LoginPresenter.dart';
import 'package:jajanku_manager/presenters/NavigationPresenter.dart';
import 'package:jajanku_manager/presenters/ProductPresenter.dart';
import 'package:jajanku_manager/views/login_page.dart';

import 'routes/Routes.dart';

void main() {
  LoginPresenter loginPresenter = Get.put(LoginPresenter());
  ProductPresenter productPresenter = Get.put(ProductPresenter());
  NavigationPresenter navigationPresenter = Get.put(NavigationPresenter());
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Jajanku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: Routes.all,
      initialRoute: '/',
    );
  }
}
