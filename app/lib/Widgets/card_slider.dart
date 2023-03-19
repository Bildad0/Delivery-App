import 'package:flutter/material.dart';

Widget cardSlider(context, ImageProvider image, String message) {
  return Card(
    elevation: 5,
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(image: image, fit: BoxFit.fill),
      ),
      // child: Text(message),
    ),
  );
}
