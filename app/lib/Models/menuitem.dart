class MenuItem {
  final String id;
  final String name;
  final String description;
  final List<String> category;
  final double price;
  final String image;
  final int quantity;
  const MenuItem({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}
