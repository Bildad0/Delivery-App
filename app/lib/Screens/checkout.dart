import 'package:app/Screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) {
                  final cartItem = cart.items[index];
                  return ListTile(
                    title: Text(cartItem.product.name),
                    trailing: Text('\$${cartItem.product.price}'),
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total: \$${cart.totalPrice}',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              child: Text('Place Order'),
              onPressed: () {
                // TODO: Implement place order logic
              },
            ),
          ],
        ),
      ),
    );
  }
}

