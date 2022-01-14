import 'package:flutter/material.dart';
import 'package:jajanku_manager/views/home_page.dart';
import 'package:jajanku_manager/views/login_page.dart';

class RouteGenerator {
  static Route<dynamic> getRoutes(settings) {
    Map arg = settings.arguments is Map ? settings.arguments : {};

    switch (settings.name) {
      case "/login":
        return MaterialPageRoute(
          builder: (_) => LoginPage(
            title: arg['title'] ?? "Login",
          ),
        );
        break;
      case "/":
      default:
        return MaterialPageRoute(
          builder: (_) => HomePage(
            title: arg['title'] ?? "Dashboard",
          ),
        );
    }
  }
}
