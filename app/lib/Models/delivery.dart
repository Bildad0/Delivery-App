// ignore_for_file: constant_identifier_names

import 'order.dart';
import 'user.dart';

class Delivery {
  final Order order;
  final User deliveryUser;
  final DeliveryStatus status;
  Delivery({
    required this.order,
    required this.deliveryUser,
    required this.status,
  });
}

enum DeliveryStatus {
  PENDING,
  IN_PROGRESS,
  COMPLETED,
  CANCELLED,
}
