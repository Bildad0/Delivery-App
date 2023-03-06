class MenuScreen extends StatelessWidget {
  final List<MenuItem> menuItems = [
    MenuItem(
      name: 'Cheeseburger',
      description: 'A classic cheeseburger with all the fixings',
      price: 9.99,
      image: 'assets/images/cheeseburger.jpg',
    ),
    MenuItem(
      name: 'Pizza',
      description: 'A delicious pizza with your choice of toppings',
      price: 12.99,
      image: 'assets/images/pizza.jpg',
    ),
    MenuItem(
      name: 'Fried Chicken',
      description: 'Crispy fried chicken with your choice of sides',
      price: 8.99,
      image: 'assets/images/fried_chicken.jpg',
    ),
    MenuItem(
      name: 'Taco Salad',
      description: 'A healthy and delicious taco salad',
      price: 7.99,
      image: 'assets/images/taco_salad.jpg',
    ),
    MenuItem(
      name: 'Fish and Chips',
      description: 'Fresh fish served with crispy chips',
      price: 10.99,
      image: 'assets/images/fish_and_chips.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        itemCount: menuItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return InkWell(
            onTap: () {
              // TODO: Navigate to item details screen
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  item.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  item.description,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  '\$${item.price}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class MenuItem {
  final String name;
  final String description;
  final double price;
  final String image;

  MenuItem({
    required this.name,
    required this.description,
    required this.price,
    required this.image,
  });
}
