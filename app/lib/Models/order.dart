import 'package:app/Models/menuitem.dart';

import 'address.dart';
import 'user.dart';

class Order {
  final User user;
  final List<MenuItem> items;
  final double totalCost;
  final Address deliveryAddress;
  Order({
    required this.user,
    required this.items,
    required this.totalCost,
    required this.deliveryAddress,
  });

  get orderNumber => null;

  get totalPrice => null;
}
