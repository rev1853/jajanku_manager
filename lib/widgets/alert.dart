// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jajanku_manager/constants/ColorConstant.dart';

class InformationAlert {
  String title;
  String textContent;

  InformationAlert({required this.title, required this.textContent});

  AlertDialog get success {
    return standard(Icon(
      Icons.check_circle_outline,
      color: GREEN,
      size: 35,
    ));
  }

  AlertDialog get warning {
    return standard(Icon(
      Icons.warning_amber_sharp,
      color: PRIMARY,
      size: 35,
    ));
  }

  AlertDialog get info {
    return standard(Icon(
      Icons.info_outline_rounded,
      color: BLUE,
      size: 35,
    ));
  }

  AlertDialog get danger {
    return standard(Icon(
      Icons.dangerous_outlined,
      color: RED,
      size: 35,
    ));
  }

  AlertDialog standard(Icon icon) {
    return AlertDialog(
      title: Row(
        children: [
          icon,
          SizedBox(
            width: 10,
          ),
          Text(title)
        ],
      ),
      content: Text(textContent),
    );
  }
}
