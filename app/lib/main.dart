import 'Screens/mealdetails.dart';

import 'Models/menuitem.dart';
import 'Models/order.dart';
import 'Resources/dummydatat.dart';
import 'Screens/allmeal.dart';
import 'Screens/favourite.dart';
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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<MenuItem> _availableMeals = DUMMY_MENU_ITEMS;
  final List<MenuItem> _favoriteMeals = [];

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _availableMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MENU_ITEMS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menu = DUMMY_MENU_ITEMS;
    List<Order> order = DUMMY_ORDER;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delivery App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red)
            .copyWith(background: Colors.blueAccent, onPrimary: Colors.red),
      ),
      initialRoute: "/",
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
            builder: (context) =>
                const HomeScreen()); //!TODO: add error page here
      },
      routes: {
        '/': (context) => const SplashScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CartScreen.routeName: (context) => const CartScreen(),
        MenuScreen.routeName: (context) => MenuScreen(menu: menu),
        OrderHistoryScreen.routeName: (context) => const OrderHistoryScreen(),
        OrderDetailsScreen.routeName: (context) =>
            OrderDetailsScreen(order: order),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(
              isFavorite: _isMealFavorite,
              toggleFavorite: _toggleFavorite,
            ),
        MealScreen.routeName: (context) => const MealScreen(),
        FavoriteScreen.routeName: (context) => FavoriteScreen(
              favouriteMeals: _favoriteMeals,
            ),
      },
    );
  }
}
