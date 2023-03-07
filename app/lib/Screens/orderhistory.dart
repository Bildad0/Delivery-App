import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app/Models/order.dart';

class OrderHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<List<Order>>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Order History'),
      ),
      body: orders != null
          ? ListView.builder(
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return ListTile(
                  title: Text('Order ${order.orderNumber}'),
                  subtitle: Text('Total: \$${order.totalPrice}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrderDetailsScreen(order),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
