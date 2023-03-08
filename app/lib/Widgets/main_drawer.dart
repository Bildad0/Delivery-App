import '../Resources/types.dart';
import '/Screens/home.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildTop(context, IconData icon, String title) {
    return Container(
      color: headerBackGround,
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomLeft,
      child: Row(children: [
        Icon(
          icon,
          color: headerTextColor,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: headerTextColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
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
      leading: Icon(
        icon,
        color: headerTextColor,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: headerTextColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        description,
        style: TextStyle(
          color: headerTextColor.withOpacity(0.6),
          fontStyle: FontStyle.italic,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(route as Route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                buildListTile(
            context,
            "Home",
            "Back to meals",
            Icons.home,
            HomeScreen.routeName,
          ),
                buildListTile(
            context,
            "Home",
            "Back to meals",
            Icons.home,
            HomeScreen.routeName,
          ),
                buildListTile(
            context,
            "Home",
            "Back to meals",
            Icons.home,
            HomeScreen.routeName,
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
