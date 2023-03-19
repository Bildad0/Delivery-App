import 'package:flutter/material.dart';

import '../Resources/cache_helper.dart';
import '../Widgets/alert.dart';
import 'allmeal.dart';
import 'checkout.dart';
import 'home.dart';

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
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.shade400,
                Colors.white38,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.1, 1.0),
            ),
          ),
          child: alertBox(
            context,
            Icons.info_outlined,
            "Nothing on cart start shopping",
            HomeScreen.routeName,
            MealScreen.routeName,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Cart'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
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
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) => alertBox(
                              context,
                              Icons.info_outline,
                              "Item ${item.name} has been deleted from the list",
                              CartScreen.routeName,
                              CartScreen.routeName,
                            ),
                          );
                          widget.removeItem(item);
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
            Container(
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
                      Navigator.of(context).pushNamed(CheckoutScreen.routeName,
                          arguments: totalCost);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.all(16),
      //   decoration: const BoxDecoration(
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black12,
      //         blurRadius: 4,
      //         offset: Offset(0, -2),
      //       ),
      //     ],
      //   ),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text(
      //         'Total: Ksh $totalCost',
      //         style: const TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //       ElevatedButton(
      //         child: const Text(
      //           'Checkout',
      //           style: TextStyle(color: Colors.white),
      //         ),
      //         onPressed: () {
      //           removeCartDataFromCache();
      //           Navigator.of(context)
      //               .pushNamed(CheckoutScreen.routeName, arguments: totalCost);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
