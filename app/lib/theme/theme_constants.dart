import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Georgia',
  textTheme: const TextTheme(
    titleLarge: TextStyle(fontSize: 26, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14, fontFamily: 'Hind'),
  ),
  splashColor: Colors.deepOrangeAccent.withOpacity(.8),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
      .copyWith(
          background: Colors.blueAccent, onPrimary: Colors.deepOrangeAccent),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
