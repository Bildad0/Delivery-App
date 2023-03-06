import 'package:flutter/material.dart';

import 'Screens/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
        routes: {
        '/login': (context) => LoginScreen(), // Add LoginScreen to routes
        '/cart': (context) => CartScreen(), // Add CartScreen to routes
      },
    );
  }
}
