import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red[800],
  fontFamily: 'SawarabiGothic',
  textTheme: const TextTheme(
    bodySmall: TextStyle(
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: amountColor,
      fontSize: 15,
      fontFamily: 'SawarabiGothic',
    ),
    bodyLarge: TextStyle(
      color: bodyTextColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'SawarabiGothic',
    ),
    titleLarge:
        TextStyle(fontStyle: FontStyle.italic, fontFamily: 'PatrickHand'),
    bodyMedium: TextStyle(
      color: bodyTextColor,
      fontSize: 13,
      fontStyle: FontStyle.italic,
      fontFamily: 'SawarabiGothic',
    ),
  ),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent, foregroundColor: Colors.red[800]),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
      .copyWith(background: Colors.blueAccent, onPrimary: Colors.red),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.dark(),
);

const backGroundColor = Colors.white;
const headerTextColor = Colors.red;
const bodyTextColor = Colors.black;
const headerBackGround = Colors.transparent;
const descriptionColor = Colors.grey;
const amountColor = Colors.greenAccent;
