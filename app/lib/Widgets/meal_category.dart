import 'package:flutter/material.dart';

import '../Screens/menu.dart';

Widget buildingCategoryListTile(
  context,
  String title,
  String id,
  String imageUrl,
) {
  return InkWell(
    onTap: () {
      Navigator.of(context).pushNamed(
        MenuScreen.routeName,
        arguments: {
          'id': id,
          'title': title,
        },
      );
    },
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.white),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
        ),
      ],
    ),
  );
}
