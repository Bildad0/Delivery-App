import 'order.dart';
import 'user.dart';

class Payment {
  final User user;
  final Order order;
  final double amount;
  final bool isPaid;
  Payment({
    required this.user,
    required this.order,
    required this.amount,
    required this.isPaid,
  });
}
