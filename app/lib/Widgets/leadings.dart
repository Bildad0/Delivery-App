import 'package:flutter/material.dart';

Widget buildLeading(
  context,
  IconData icon,
  String route,
  String cartQuantity,
) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          Navigator.of(context).pushReplacementNamed(route);
        },
        icon: Icon(icon),
      ),
      Container(
        transform: Matrix4.translationValues(-25.0, -10.0, 0.0),
        child: CircleAvatar(
          radius: 8,
          backgroundColor: Colors.white,
          foregroundColor: Colors.red,
          child: Text(
            cartQuantity,
            style: const TextStyle(fontSize: 10),
          ),
        ),
      ),
    ],
  );
}
