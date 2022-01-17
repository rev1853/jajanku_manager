// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:bs_flutter_selectbox/bs_flutter_selectbox.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jajanku_manager/constants/ColorConstant.dart';
import 'package:jajanku_manager/constants/HTTPConstant.dart';

class SelectBox extends StatelessWidget {
  SelectBox(
      {this.serverSide,
      required this.label,
      required this.controller,
      Key? key})
      : super(key: key);
  String label;
  BsSelectBoxController controller;
  Future<BsSelectBoxResponse> Function(Map<String, String>)? serverSide;

  @override
  Widget build(BuildContext context) {
    return BsSelectBox(
      serverSide: serverSide,
      style: BsSelectBoxStyle(
        selectedTextColor: DARK,
        border: Border(
          bottom: BorderSide(color: DARK),
          left: BorderSide(color: DARK),
          right: BorderSide(color: DARK),
          top: BorderSide(color: DARK),
        ),
        focusedBorder: Border(
          bottom: BorderSide(color: GREEN),
          left: BorderSide(color: GREEN),
          right: BorderSide(color: GREEN),
          top: BorderSide(color: GREEN),
        ),
      ),
      hintText: label,
      controller: controller,
    );
  }
}
