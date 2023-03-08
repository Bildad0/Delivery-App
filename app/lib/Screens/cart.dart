import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Models/cartitem.dart';

class Cart extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice => _items.fold(
      0, (total, current) => total + current.price * current.quantity);

  void add(CartItem item) {
    int index = _items.indexWhere((i) => i.name == item.name);
    if (index != -1) {
      _items[index].quantity++;
    } else {
      _items.add(item);
    }
    notifyListeners();
  }

  void remove(CartItem item) {
    _items.removeWhere((i) => i.name == item.name);
    notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const routeName = "/cart";

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.red,
        backgroundColor: Colors.transparent,
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.itemCount,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.price} x ${item.quantity}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () => cart.remove(item),
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
              'Total: \$${cart.totalPrice}',
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
