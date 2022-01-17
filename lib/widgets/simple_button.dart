import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';

class SimpleButton extends StatelessWidget {
  SimpleButton(
      {required this.label,
      required this.onPressed,
      required this.color,
      Key? key})
      : super(key: key);
  String label;
  Color color;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: color,
        minimumSize: Size.fromHeight(45),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: GoogleFonts.roboto(),
      ),
    );
  }
}
