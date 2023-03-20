import 'package:flutter/material.dart';

import '../Models/menuitem.dart';
import '../Screens/cart.dart';
import 'alert.dart';

Widget cartItemList(context, List<MenuItem> cart, Function removeItem) {
  return Expanded(
    flex: 2,
    child: Card(
      margin: const EdgeInsets.all(10),
      child: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          final item = cart[index];
          return ListTile(
            title: Text(item.name),
            leading: Text("${index + 1}"),
            subtitle: Text('Ksh ${item.price}'), //!TODO: add quantity
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => alertBox(
                    context,
                    Icons.info_outline,
                    "${item.name} has been deleted from the list",
                    CartScreen.routeName,
                    CartScreen.routeName,
                  ),
                );
                await removeItem(item);
              },
            ),
          );
        },
      ),
    ),
  );
}
