import 'package:flutter/material.dart';

import '../Resources/types.dart';
import '../theme/theme_constants.dart';
import '/Screens/cart.dart';

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
    actions: [
      TextButton(
        onPressed: () =>
            Navigator.of(context).pushReplacementNamed(CartScreen.routeName),
        child: const Text("YES"),
      ),
    ],
  );
}
