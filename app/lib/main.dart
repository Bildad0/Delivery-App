// ignore_for_file: unused_field

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:open_settings/open_settings.dart';
import 'package:provider/provider.dart';

import 'Models/menuitem.dart';
import 'Models/order.dart';
import 'Resources/auth_service.dart';
import 'Resources/dummydatat.dart';
import 'Resources/scroll_behaviour.dart';
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
import 'Screens/settings.dart';
import 'Screens/splashscreen.dart';
import 'Screens/user_location.dart';
import 'Screens/userprofile.dart';
import 'firebase_options.dart';
import 'theme/theme_constants.dart';
import 'theme/theme_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
  LocationPermission? _locationPermission;
  Position? _currentPosition;
  String? _address;
  bool _locationEnabled = false;

  @override
  void initState() {
    super.initState();
    _checkLocationEnabled().then((value) {
      setState(() {
        _themeManager.addListener(themeListener);
        _locationEnabled == true;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _themeManager.removeListener(themeListener);
  }

  themeListener() {
    if (mounted) {
      setState(() {
        _themeManager.darkMode;
      });
    }
  }

  Future<String> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied ||
        permission == LocationPermission.unableToDetermine) {
      Geolocator.openAppSettings();
    }
    setState(() {
      _locationPermission = permission;
    });
    return _getCurrentLocation();
  }

  Future<void> _checkLocationEnabled() async {
    bool isLocationEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isLocationEnabled) {
      return OpenSettings.openLocationSourceSetting();
    }
    setState(() {
      _locationEnabled = isLocationEnabled;
    });
    _checkLocationPermission();
  }

  Future<String> _getCurrentLocation() async {
    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.bestForNavigation,
    );
    setState(() {
      _currentPosition = position;
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        _currentPosition!.latitude,
        _currentPosition!.longitude,
      );
      Placemark place = placemarks[0];
      return _address =
          "${place.subLocality}, ${place.locality}, ${place.country}";
    } catch (e) {
      return _address = "Error getting address";
    }
  }

  String getCart() {
    final cartSize = _cartItem.length;
    if (cartSize > 0) {
      return cartSize.toString();
    }
    return "0";
  }

  void _addToCart(String itemId) {
    final mealToAdd = _availableMeals.firstWhere((menu) => menu.id == itemId);
    setState(() {
      _cartItem.add(mealToAdd);
    });
  }

  _removeFromCart(MenuItem meal) {
    final itemIndex = _cartItem.indexOf(meal);
    setState(() {
      _cartItem.removeAt(itemIndex);
    });
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

  Widget routeWidget() {
    List<MenuItem> menu = DUMMY_MENU_ITEMS;
    List<Order> order = [];
    return MaterialApp(
      scrollBehavior: TouchScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'RebDelivery',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.lightThemeMode,
      initialRoute: "/",
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => HomeScreen(
            cartQuantity: getCart,
          ),
        ); //!TODO: add error page here
      },
      routes: {
        '/': (context) => HomeScreen(
              cartQuantity: getCart,
            ),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomeScreen.routeName: (context) => HomeScreen(
              cartQuantity: getCart,
            ),
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
              cartQuantity: getCart,
            ),
        CheckoutScreen.routeName: (context) => CheckoutScreen(
              items: _cartItem,
              getLocation: _getCurrentLocation,
              address: _address,
            ),
        UserLocationMap.routeName: (context) => UserLocationMap(
              currentPosition: _currentPosition,
            ),
        ProfileScreen.routeName: (context) => ProfileScreen(
              address: _address,
              isLocationEnabled: _locationEnabled,
            ),
        SettingsPage.routeName: (context) => const SettingsPage(),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: firebaseUser != null ? const SplashScreen() : routeWidget(),
    );

    // return
  }
}
