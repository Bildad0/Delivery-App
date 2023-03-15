import 'menuitem.dart';

class CartItem {
  final String name;
  final double price;
  final List<MenuItem> items;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    required this.items,
    this.quantity = 1,
  });

  get product => List<MenuItem>;
}
