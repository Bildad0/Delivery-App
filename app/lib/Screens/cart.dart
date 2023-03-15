import 'package:flutter/material.dart';

import '../Resources/cache_helper.dart';
import '../Widgets/alert.dart';
import 'checkout.dart';

class CartScreen extends StatefulWidget {
  final cart;
  final Function removeItem;
  const CartScreen({
    Key? key,
    required this.cart,
    required this.removeItem,
  }) : super(key: key);
  static const routeName = "/cart";

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final cart = widget.cart;
    double totalCost = 0.0;

    for (var item in cart) {
      totalCost += item.price;
    }

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
            subtitle: Text('Ksh ${item.price}'), //!TODO: add quantity
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => alertBox(
                    context,
                    Icons.info_outline,
                    "Do you want to delete ${item.name} from the list?",
                  ),
                );
                widget.removeItem(item);
              },
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
              'Total: Ksh $totalCost',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: const Text(
                'Checkout',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                removeCartDataFromCache();
                Navigator.of(context)
                    .pushNamed(CheckoutScreen.routeName, arguments: totalCost);
              },
            ),
          ],
        ),
      ),
    );
  }
}
