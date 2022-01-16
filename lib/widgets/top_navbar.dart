import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';

class TopNavBar extends StatelessWidget {
  const TopNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: PRIMARY,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 3,
            spreadRadius: 2,
          ),
        ],
      ),
    );
  }
}
