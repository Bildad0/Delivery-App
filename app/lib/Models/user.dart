import 'package:app/Models/address.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final Address address;
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });
}
