import 'address.dart';
import 'user.dart';
import 'item.dart';

class Order {
  final User user;
  final List<Item> items;
  final double totalCost;
  final Address deliveryAddress;
  Order({
    required this.user,
    required this.items,
    required this.totalCost,
    required this.deliveryAddress,
  });
}
