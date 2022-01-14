// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';

class LoginTextField extends StatelessWidget {
  LoginTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.validator,
    required this.isPassword,
  }) : super(key: key);
  TextEditingController controller;
  String label;
  String? Function(String?)? validator;
  final FocusNode _focusNode = FocusNode();
  bool isPassword;

  @override
  TextFormField build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      validator: validator,
      controller: controller,
      focusNode: _focusNode,
      style: TextStyle(
        color: Colors.grey.shade200,
      ),
      decoration: InputDecoration(
        isDense: true,
        labelText: label,
        labelStyle: TextStyle(
          color: getColor(),
        ),
        floatingLabelStyle: TextStyle(
          color: getColor(),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 12,
        ),
        enabledBorder: createBorder(Colors.grey),
        focusedBorder: createBorder(PRIMARY),
        errorBorder: createBorder(RED),
        focusedErrorBorder: createBorder(RED),
      ),
    );
  }

  InputBorder createBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: BorderSide(
        color: color,
        style: BorderStyle.solid,
      ),
    );
  }

  Color getColor() {
    return _focusNode.hasFocus ? PRIMARY : Colors.grey;
  }
}
