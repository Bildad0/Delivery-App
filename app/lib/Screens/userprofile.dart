import 'package:app/main.dart';
import 'package:flutter/material.dart';

import '../Models/user.dart';
import '/Screens/loginorsignup.dart';
import 'home.dart';
import 'user_location.dart';

class ProfileScreen extends StatefulWidget {
  static const routeName = "Profile";
  bool isLocationEnabled;
  String? address;
  ProfileScreen({
    Key? key,
    required this.isLocationEnabled,
    required this.address,
  }) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    User user = ModalRoute.of(context)!.settings.arguments as User;
    String? location = widget.address;
    bool isLocationEnabled = widget.isLocationEnabled;
    bool isNotificationsEnabled = true;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 5,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(HomeScreen.routeName);
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListTile(
                    leading: const Icon(Icons.person), //!TODO: add user image
                    title: Text(user.name),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.email_outlined),
                    title: const Text("Email"),
                    subtitle: Text(user.email),
                    onTap: () {
                      //!TODO: Add edit email widget
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.lock),
                    title: const Text("Password"),
                    onTap: () {
                      //!TODO: Add edit password widget
                    },
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                    leading: Icon(Icons.delivery_dining),
                    title: Text('Delivery'),
                  ),
                  const Divider(),
                  SwitchListTile(
                    value: isLocationEnabled,
                    title: const Text('Enable location'),
                    onChanged: (value) {
                      setState(() {
                        isLocationEnabled = value;
                      });
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.location_on),
                    title: const Text('Delivery address'),
                    subtitle: Text(
                      location ?? 'Retrieving location...!',
                      style: const TextStyle(color: Colors.red),
                    ),
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed(UserLocationMap.routeName);
                    },
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                    leading: Icon(Icons.notifications),
                    title: Text('Notifications'),
                  ),
                  const Divider(),
                  SwitchListTile(
                    value: isNotificationsEnabled,
                    title: const Text('Enable notifications'),
                    onChanged: (value) {
                      setState(() {
                        isNotificationsEnabled = value;
                      });
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.notifications_active),
                    title: const Text('Notification preferences'),
                    onTap: () {
                      // TODO: Navigate to notification preferences screen
                    },
                  ),
                ],
              ),
            ),
            Card(
              margin: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help & Support'),
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.contact_support),
                    title: const Text('Contact us'),
                    onTap: () {
                      // TODO: Navigate to contact us screen
                    },
                  ),
                  const Divider(),
                  ListTile(
                    leading: const Icon(Icons.help_outline),
                    title: const Text('FAQs'),
                    onTap: () {
                      // TODO: Navigate to FAQs screen
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
