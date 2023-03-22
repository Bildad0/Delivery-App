import 'package:flutter/material.dart';

import '../Screens/allmeal.dart';
import '../Screens/home.dart';
import 'alert.dart';

Widget cartIcon(
  context,
  IconData icon,
  String route,
  String cartQuantity,
) {
  return Row(
    children: [
      IconButton(
        onPressed: () {
          if (cartQuantity == '0') {
            showDialog(
              context: context,
              builder: (BuildContext context) => alertBox(
                context,
                Icons.info_outlined,
                "Nothing on cart start shopping",
                HomeScreen.routeName,
                MealScreen.routeName,
              ),
            );
          } else {
            Navigator.of(context).pushNamed(route);
          }
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
