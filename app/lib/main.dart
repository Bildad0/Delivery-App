import 'Models/menuitem.dart';
import 'Models/order.dart';
import 'Resources/dummydatat.dart';
import 'Screens/menu.dart';
import 'package:flutter/material.dart';
import 'Screens/cart.dart';
import 'Screens/loginorsignup.dart';
import 'Screens/orderdetails.dart';
import 'Screens/orderhistory.dart';
import 'Screens/splashscreen.dart';
import 'Screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menu = DUMMY_MENU_ITEMS;
    List<Order> order = DUMMY_ORDER;
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
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
        MenuScreen.routeName: (context) => MenuScreen(menu: menu),
        OrderHistoryScreen.routeName: (context) => const OrderHistoryScreen(),
        OrderDetailsScreen.routeName: (context) => OrderDetailsScreen(
              order: order,
            ),
      },
    );
  }
}
