import 'package:app/Models/order.dart';
import 'package:app/Widgets/alert.dart';
import 'package:flutter/material.dart';

import '../Resources/dummydatat.dart';
import '../Resources/types.dart';
import '../theme/theme_constants.dart';
import 'home.dart';
import 'menu.dart';
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
    final List<Order> orders = [];

    if (orders.isEmpty) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.shade400,
                Colors.white38,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.1, 1.0),
            ),
          ),
          child: alertBox(
            context,
            Icons.warning_outlined,
            "You have no penndings, make some orders",
            "",
            MenuScreen.routeName,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(HomeScreen.routeName);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
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
