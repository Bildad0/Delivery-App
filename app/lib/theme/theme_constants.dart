import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.red,
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
    titleLarge: TextStyle(
      color: headerTextColor,
      fontStyle: FontStyle.normal,
      fontSize: 24,
      fontFamily: 'SawarabiGothic',
    ),
    bodyMedium: TextStyle(
      color: bodyTextColor,
      fontSize: 13,
      fontStyle: FontStyle.italic,
      fontFamily: 'SawarabiGothic',
    ),
    labelLarge: TextStyle(),
  ),
  appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent, foregroundColor: Colors.red),
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
      .copyWith(background: Colors.blueAccent, onPrimary: Colors.red),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.black,
  colorScheme: const ColorScheme.dark(),
);

const backGroundColor = Colors.white;
const headerTextColor = Colors.red;
const bodyTextColor = Colors.black;
const headerBackGround = Colors.transparent;
const descriptionColor = Colors.grey;
const amountColor = Colors.black38;
