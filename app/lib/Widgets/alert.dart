import 'package:flutter/material.dart';

import '../theme/theme_constants.dart';

Widget alertBox(
  context,
  IconData icon,
  String message,
  String noRoute,
  String yesRoute,
) {
  return AlertDialog(
    content: Text(message, style: const TextStyle()),
    elevation: 5,
    backgroundColor: backGroundColor,
    contentTextStyle: TextStyle(
      color: Theme.of(context).primaryColor,
      fontStyle: FontStyle.italic,
    ),
    actions: [
      TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(noRoute),
        child: const Text("Cancel"),
      ),
      TextButton(
        onPressed: () => Navigator.of(context).pushReplacementNamed(yesRoute),
        child: const Text("Ok"),
      ),
    ],
  );
}
