import 'Screens/meallist.dart';
import 'package:flutter/material.dart';
import 'Screens/cart.dart';
import 'Screens/loginorsignup.dart';
import 'Screens/splashscreen.dart';
import 'Screens/home.dart';

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
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        MealListScreen.routeName: (context) => const MealListScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
      },
    );
  }
}
