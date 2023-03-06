import 'package:flutter/material.dart';

import 'Screens/cart.dart';
import 'Screens/loginorsignup.dart';
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
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(background: Colors.blueAccent, onPrimary: Colors.red),
      ),
      initialRoute: "/",
      routes: {
        '/': (context) => const SplashScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
      },
    );
  }
}
