import 'package:shared_preferences/shared_preferences.dart';

import '../Models/menuitem.dart';

Future<void> saveCartData(List<MenuItem> cart) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('CartItem', cart.cast<String>());
}

Future<String?> getCartData() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString('CartItem');
}
