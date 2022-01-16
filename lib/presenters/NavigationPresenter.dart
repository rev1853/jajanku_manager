import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jajanku_manager/views/home_page.dart';
import 'package:jajanku_manager/views/product_page.dart';

class NavigationPresenter extends GetxController {
  var currentIndex = 0.obs;
  var _data = {}.obs;

  set changeIndex(index) {
    currentIndex.value = index;
  }

  set withData(Map data) {
    _data.value = data;
  }

  Map get data {
    return _data.value;
  }
}
