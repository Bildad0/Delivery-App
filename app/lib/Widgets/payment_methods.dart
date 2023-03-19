import 'package:flutter/material.dart';

Widget paymentMethods(context) {
  return Card(
    margin: const EdgeInsets.all(10),
    child: Column(
      children: [
        const Text(
          "Payment Method",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        ListTile(
          title: const Text("Mpesa"),
          trailing: TextButton(
            child: const Text(
              "select",
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () {
              //!TODO: prompt text input for Mpesa number and set payment method to Mpesa and order status to paid
            },
          ),
        ),
        ListTile(
          title: const Text("Cash"),
          trailing: TextButton(
            child: const Text(
              "select",
              style: TextStyle(color: Colors.green),
            ),
            onPressed: () {
              //!TODO: set payment to cash on delivery and order status to not paid
            },
          ),
        ),
      ],
    ),
  );
}
