import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jajanku_manager/middleware/GlobalMiddleware.dart';
import 'package:jajanku_manager/views/home_page.dart';
import 'package:jajanku_manager/views/login_page.dart';

class Routes {
  static List<GetPage<dynamic>> get all {
    return [
      GetPage(
        name: '/login',
        page: () => LoginPage(),
      ),
      GetPage(
        name: '/',
        page: () => HomePage(),
        middlewares: [
          GlobalMiddleware(),
        ],
      ),
    ];
  }
}
