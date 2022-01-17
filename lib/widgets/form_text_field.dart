// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';

class FormTextField extends StatelessWidget {
  FormTextField({
    Key? key,
    this.controller,
    required this.label,
    this.validator,
    this.isPassword = false,
    this.isEnabled = true,
    this.isNumber = false,
    this.maxLine = 1,
  }) : super(key: key);

  TextEditingController? controller;
  String label;
  String? Function(String?)? validator;
  final FocusNode _focusNode = FocusNode();
  bool isPassword;
  bool isNumber;
  bool isEnabled;
  int maxLine;

  @override
  TextFormField build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      maxLines: maxLine,
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      obscureText: isPassword,
      enableSuggestions: !isPassword,
      autocorrect: !isPassword,
      validator: validator,
      controller: controller,
      focusNode: _focusNode,
      style: TextStyle(
        color: DARK,
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
        enabledBorder: createBorder(DARK),
        disabledBorder: createBorder(DARK),
        focusedBorder: createBorder(GREEN),
        errorBorder: createBorder(RED),
        focusedErrorBorder: createBorder(RED),
      ),
    );
  }

  InputBorder createBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: color,
        style: BorderStyle.solid,
      ),
    );
  }

  Color getColor() {
    return _focusNode.hasFocus ? GREEN : Colors.grey;
  }
}
