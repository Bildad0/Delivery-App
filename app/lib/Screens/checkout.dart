import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../Models/menuitem.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = "/check-out";
  final List<MenuItem> items;
  final Function getLocation;
  final String? address;
  final Position? currentPosition;
  const CheckoutScreen({
    Key? key,
    required this.items,
    required this.getLocation,
    required this.address,
    this.currentPosition,
  }) : super(key: key);
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    final getCurrentLocation = widget.getLocation;
    final address = widget.address;
    final cartItems = widget.items;
    final totalAmount = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            GestureDetector(
              onTap: () {
                getCurrentLocation();
              },
              child: Card(
                shape: const StadiumBorder(
                  side: BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ),
                ),
                color: Colors.grey[200],
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text("Delivery:"),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            address ?? 'Retrieving location...',
                            style: const TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Change Location",
                            style: TextStyle(color: Colors.grey),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 14,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Order Summary',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Items:"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${cartItems.length}",
                        style: const TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
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
            Container(
              color: Colors.grey[100],
              height: 150,
              padding: const EdgeInsets.all(10),
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total:',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Ksh $totalAmount",
                            style: const TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Delivery date"),
                          TextButton(
                            onPressed: () {},
                            child: const Text("Select date"),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
