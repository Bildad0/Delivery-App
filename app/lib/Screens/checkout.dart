import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

import '../Models/menuitem.dart';
import 'user_location.dart';

class CheckoutScreen extends StatefulWidget {
  static const routeName = "/check-out";
  final List<MenuItem> items;
  final Function getLocation;
  final String? address;

  const CheckoutScreen({
    Key? key,
    required this.items,
    required this.getLocation,
    required this.address,
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
    TextEditingController dateController = TextEditingController();

    Future showDatePicker(BuildContext context) {
      return DatePicker.showDateTimePicker(
        context,
        showTitleActions: true,
        minTime: DateTime.now(),
        onChanged: (date) {},
        onConfirm: (date) {
          dateController.text = date.toString().substring(0, 16);
        },
        currentTime: DateTime.now(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 3,
        title: Column(children: [
          Card(
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
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      getCurrentLocation();
                    },
                    child: Row(
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
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(UserLocationMap.routeName);
                    },
                    child: Row(
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
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text("Item(s):"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "${cartItems.length}",
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
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
                      foregroundColor: Colors.orange,
                      backgroundColor: Colors.transparent,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(cartItem.name),
                    trailing: Text('Ksh ${cartItem.price}'),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Container(
              color: Colors.transparent,
              height: 250,
              padding: const EdgeInsets.all(2),
              child: Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Delivery date",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        onTap: () {
                          showDatePicker(context);
                        },
                        controller: dateController,
                        decoration: InputDecoration(
                          hintText: '${DateTime.now().day}',
                          prefixIcon: IconButton(
                            icon: const Icon(
                              Icons.date_range,
                              size: 30,
                            ),
                            onPressed: () {
                              showDatePicker(context);
                            },
                          ),
                          border: const OutlineInputBorder(),
                        ),
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        child: const Text(
                          'Place Order',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          print(dateController.text);
                          // TODO: Implement place order logic
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
