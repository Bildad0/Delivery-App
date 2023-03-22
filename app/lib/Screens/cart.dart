import 'package:flutter/material.dart';

import '../Resources/cache_helper.dart';
import '../Widgets/cart_item_list.dart';
import '../Widgets/payment_methods.dart';
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

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
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
      body: Scrollable(
        viewportBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                cartItemList(context, cart, widget.removeItem),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: paymentMethods(context),
                ),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Card(
                    elevation: 0,
                    margin: const EdgeInsets.all(10),
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
                            Navigator.of(context).pushNamed(
                                CheckoutScreen.routeName,
                                arguments: totalCost);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
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
