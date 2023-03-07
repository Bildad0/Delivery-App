import 'package:app/Screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
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
            const SizedBox(height: 16),
            Text(
              'Total: \$${cart.totalPrice}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Place Order'),
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
