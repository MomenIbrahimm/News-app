import 'package:flutter/material.dart';

import '../theming/color_manger.dart';

Future<bool> showExitDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Exit'),
      content: const Text('Do you want to exit the app?'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(false); // إغلاق النافذة وإرجاع false
          },
          child: const Text(
            'No',
            style: TextStyle(color: ColorManger.primaryColor),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(true); // إغلاق النافذة وإرجاع true
          },
          child: const Text(
            'Yes',
            style: TextStyle(color: ColorManger.primaryColor),
          ),
        ),
      ],
    ),
  ).then(
    (value) => value ?? false,
  ); // إذا كانت القيمة null، ترجع false
}
