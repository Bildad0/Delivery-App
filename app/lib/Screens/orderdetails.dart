// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../Models/order.dart';
import '../Resources/types.dart';
import '../theme/theme_constants.dart';

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
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
      ),
    );
  }
}
