import 'package:flutter/material.dart';

Widget buildLeading(context, IconData icon, String route) {
  return IconButton(
    onPressed: () {
      Navigator.of(context).pushNamed(route);
    },
    icon: Icon(icon),
  );
}
