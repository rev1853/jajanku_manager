// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/presenters/NavigationPresenter.dart';
import 'package:jajanku_manager/views/edit_product_page.dart';
import 'package:jajanku_manager/views/product_page.dart';
import 'package:jajanku_manager/widgets/bottom_navbar.dart';
import 'package:jajanku_manager/widgets/top_navbar.dart';

class HomePage extends StatelessWidget {
  final NavigationPresenter navigationPresenter =
      Get.find<NavigationPresenter>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          title: Text(
            "Jajanku",
            style: GoogleFonts.russoOne(
              color: DARK,
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          toolbarHeight: 50,
          flexibleSpace: TopNavBar(),
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Obx(
          () => IndexedStack(
            index: navigationPresenter.currentIndex.value,
            children: [
              Screen1(),
              ProductPage(),
              Screen3(),
              Screen4(),
              EditProductPage(id: navigationPresenter.data['id'] ?? "0"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("tes 1"),
    );
  }
}

class Screen3 extends StatelessWidget {
  const Screen3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("tes 3"),
    );
  }
}

class Screen4 extends StatelessWidget {
  const Screen4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("tes 3"),
    );
  }
}
