import 'package:flutter/material.dart';

import '../Models/order.dart';
import '../Resources/types.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const routeName = "order-details";
  List<Order> order;
  OrderDetailsScreen({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: headerTextColor,
        backgroundColor: headerBackGround,
        title: Text(""),
      ),
    );
  }
}
