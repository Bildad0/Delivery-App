import '/Screens/home.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildTop(context, IconData icon, String title) {
    return Container(
      color: Colors.red,
      height: 120,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomLeft,
      child: Row(children: [
        Icon(icon),
        const SizedBox(
          width: 10,
        ),
        Text(title),
      ]),
    );
  }

  Widget buildListTile(
    context,
    String title,
    String description,
    IconData icon,
    String route,
  ) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(description),
      onTap: () {
        Navigator.of(context).push(route as Route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      elevation: 0,
      child: Column(
        children: [
          buildTop(
            context,
            Icons.person_outlined,
            "Profile",
          ),
          buildListTile(
            context,
            "Home",
            "Back to meals",
            Icons.home,
            HomeScreen.routeName,
          ),
        ],
      ),
    );
  }
}
