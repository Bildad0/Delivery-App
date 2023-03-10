import 'address.dart';
import 'menuitem.dart';

class Hotel {
  final String id;
  final String name;
  final Address location;
  final List<MenuItem> dishes;
  const Hotel({
    required this.id,
    required this.name,
    required this.location,
    required this.dishes,
  });
}
