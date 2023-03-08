import 'package:app/Models/menuitem.dart';

import 'address.dart';
import 'user.dart';

class Order {
  final User user;
  final List<MenuItem> items;
  final double totalCost;
  final Address deliveryAddress;
  final DateTime orderDate;
  final DateTime deliveryDate;
  const Order({
    required this.user,
    required this.items,
    required this.totalCost,
    required this.deliveryAddress,
    required this.orderDate,
    required this.deliveryDate,
  });
}
