import 'package:flutter/material.dart';

Widget buildLeading(
  context,
  IconData icon,
  String route,
) {
  return Column(
    children: [
      IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(route);
        },
        icon: Icon(icon),
      ),
      Container(
        height: 2,
        transform: Matrix4.translationValues(-50.0, -50.0, 0.0),
        child: const Text("1"),
      ),
    ],
  );
}
