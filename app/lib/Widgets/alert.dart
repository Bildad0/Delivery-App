import 'package:flutter/material.dart';

import '../Resources/types.dart';

Widget alertBox(context, IconData icon, String message) {
  return AlertDialog(
    content: Text(message),
    icon: Icon(icon),
    elevation: 8,
    backgroundColor: backGroundColor,
    iconColor: Theme.of(context).primaryColor,
    contentTextStyle: TextStyle(
      color: Theme.of(context).primaryColor,
      fontStyle: FontStyle.italic,
    ),
  );
}
