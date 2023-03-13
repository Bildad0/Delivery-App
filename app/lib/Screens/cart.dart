import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/cartitem.dart';
import '../Models/menuitem.dart';

class CartScreen extends StatefulWidget {
  final List<MenuItem> cart;
  const CartScreen({
    Key? key,
    required this.cart,
  }) : super(key: key);
  static const routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;

    if (cart.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          foregroundColor: Colors.red,
          backgroundColor: Colors.transparent,
          title: const Text('Cart'),
        ),
        body: const Center(
          child: Text("No item In Cart"),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.red,
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Ksh ${item.price} x ${index + 1}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => cart.removeWhere((items) => items.id == item.id),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: Ksh ${cart.last.price}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: const Text('Checkout'),
              onPressed: () {
                // TODO: Implement checkout logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
