import 'package:flutter/material.dart';

import '../Resources/types.dart';

class MealListScreen extends StatefulWidget {
  const MealListScreen({super.key});
  static const routeName = "/meals";
  @override
  State<MealListScreen> createState() => _MealListScreenState();
}

class _MealListScreenState extends State<MealListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBackGround,
        foregroundColor: headerTextColor,
        elevation: 0,
        title: const Text("Meals"),
      ),
      body: const SizedBox(),
    );
  }
}
