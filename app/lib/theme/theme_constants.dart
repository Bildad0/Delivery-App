import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'SawarabiGothic',
  textTheme: const TextTheme(
    bodySmall: TextStyle(fontFamily: 'SawarabiGothic'),
    bodyLarge: TextStyle(fontFamily: 'Georgia'),
    titleLarge:
        TextStyle(fontStyle: FontStyle.italic, fontFamily: 'PatrickHand'),
    bodyMedium: TextStyle(fontFamily: 'Hind'),
  ),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepOrange)
      .copyWith(background: Colors.blueAccent, onPrimary: Colors.white),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
);
