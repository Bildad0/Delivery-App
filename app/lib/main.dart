import 'package:flutter/material.dart';

import 'Resources/cache_helper.dart';
import 'Models/menuitem.dart';
import 'Models/order.dart';
import 'Resources/dummydatat.dart';
import 'Screens/allmeal.dart';
import 'Screens/cart.dart';
import 'Screens/checkout.dart';
import 'Screens/favourite.dart';
import 'Screens/home.dart';
import 'Screens/loginorsignup.dart';
import 'Screens/mealdetails.dart';
import 'Screens/menu.dart';
import 'Screens/orderdetails.dart';
import 'Screens/orderhistory.dart';
import 'Screens/splashscreen.dart';
import 'theme/theme_constants.dart';
import 'theme/theme_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

ThemeManager _themeManager = ThemeManager();

class _MyAppState extends State<MyApp> {
  final List<MenuItem> _availableMeals = DUMMY_MENU_ITEMS;
  final List<MenuItem> _favoriteMeals = [];
  final List<MenuItem> _cartItem = [];

  String getCart() {
    final cartSize = _cartItem.length;
    if (cartSize > 0) {
      return cartSize.toString();
    }
    return "0";
  }

  void _addToCart(String itemId) {
    final mealToAdd = _availableMeals.firstWhere((menu) => menu.id == itemId);
    _cartItem.add(mealToAdd);
    saveCartData(_cartItem);
  }

  void _removeFromCart(MenuItem meal) {
    final itemIndex = _cartItem.indexOf(meal);
    _cartItem.removeAt(itemIndex);
  }

  void _toggleFavorite(mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          _availableMeals.firstWhere((meal) => meal.id == mealId),
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
      title: 'RebDelivery',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      initialRoute: "/",
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ); //!TODO: add error page here
      },
      routes: {
        '/': (context) => const SplashScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        CartScreen.routeName: (context) => CartScreen(
              cart: _cartItem,
              removeItem: _removeFromCart,
            ),
        MenuScreen.routeName: (context) => MenuScreen(menu: menu),
        OrderHistoryScreen.routeName: (context) => const OrderHistoryScreen(),
        OrderDetailsScreen.routeName: (context) =>
            OrderDetailsScreen(order: order),
        MealDetailsScreen.routeName: (context) => MealDetailsScreen(
              isFavorite: _isMealFavorite,
              toggleFavorite: _toggleFavorite,
              addToCart: _addToCart,
              cartQuantity: getCart,
            ),
        MealScreen.routeName: (context) => const MealScreen(),
        FavoriteScreen.routeName: (context) => FavoriteScreen(
              favouriteMeals: _favoriteMeals,
            ),
        CheckoutScreen.routeName: (context) => CheckoutScreen(
              items: _cartItem,
            ),
      },
    );
  }
}
