import 'package:app/Models/order.dart';
import 'package:flutter/material.dart';

import '../Resources/dummydatat.dart';
import '../Resources/types.dart';
import 'orderdetails.dart';

class OrderHistoryScreen extends StatefulWidget {
  static const routeName = "/order-list";

  const OrderHistoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final List<Order> orders = DUMMY_ORDER;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: headerTextColor,
        backgroundColor: headerBackGround,
        title: const Text('Order History'),
      ),
      body: orders != null
          ? ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                final orderNumber = index + 1;
                //!TODO: get total order price by adding MenuItem price in the order
                return ListTile(
                  title: Text('Order $orderNumber'),
                  subtitle: Text('Total: Ksh ${order.totalCost}'),
                  trailing: const Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsScreen(
                          order: orders,
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
