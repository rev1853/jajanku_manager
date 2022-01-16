import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jajanku_manager/presenters/LoginPresenter.dart';

class GlobalMiddleware extends GetMiddleware {
  final LoginPresenter loginPresenter = Get.find<LoginPresenter>();
  @override
  RouteSettings? redirect(String? route) {
    // TODO: implement redirect
    return loginPresenter.isAuthenticate.value || route == "/login"
        ? null
        : const RouteSettings(name: '/login');
  }
}
