import 'package:flutter/material.dart';


class CartItem {
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.name,
    required this.price,
    this.quantity = 1,
  });
}


class Cart extends ChangeNotifier {
  List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalPrice =>
      _items.fold(0, (total, current) => total + current.price * current.quantity);

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
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.itemCount,
        itemBuilder: (context, index) {
          final item = cart.items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('\$${item.price} x ${item.quantity}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => cart.remove(item),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
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
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: Text('Checkout'),
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
