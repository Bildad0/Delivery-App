class User {
  final String id;
  final String name;
  final String email;
  final String phone;
  final List<String> address;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      address: ['address'],
      name: json['name'],
      email: json['name'],
      phone: json['phone'],
    );
  }
}
