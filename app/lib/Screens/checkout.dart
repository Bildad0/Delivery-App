import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../Models/menuitem.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = "/check-out";
  final List<MenuItem> items;
  const CheckoutScreen({
    Key? key,
    required this.items,
  }) : super(key: key);
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final cartItems = widget.items;
    final totalAmount = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                //!TODO impliment geolocation
              },
              child: Card(
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                color: Colors.grey[200],
                elevation: 0,
                child: SizedBox(
                  height: 40,
                  child: Column(
                    children: const [Text("Delivered to")],
                  ),
                ),
              ),
            ),
            const Text(
              'Order Summary',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return ListTile(
                    leading: CircleAvatar(
                        backgroundImage: AssetImage(cartItem.image)),
                    title: Text(cartItem.name),
                    trailing: Text('Ksh ${cartItem.price}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text("Ksh $totalAmount")
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text(
                'Place Order',
                style: TextStyle(color: Colors.white),
              ),
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
