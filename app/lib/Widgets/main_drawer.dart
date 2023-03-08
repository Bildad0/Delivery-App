import 'package:app/Resources/dummydatat.dart';

import '../Models/menuitem.dart';
import '../Models/user.dart';
import '../Resources/types.dart';
import '../Screens/orderhistory.dart';
import '/Screens/home.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildTop(context, IconData icon, String title) {
    List<User> user = DUMMY_USER;

//!TODO: get the current user then display the name where there is String Bildad.

    return Container(
      color: headerTextColor.withOpacity(.7),
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.bottomLeft,
      child: Row(children: [
        Icon(
          icon,
          color: backGroundColor,
          size: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            color: backGroundColor,
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
        color: bodyTextColor,
        icon,
        size: 30,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
          color: descriptionColor,
          fontStyle: FontStyle.italic,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(route, arguments: {});
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
            "Bildad",
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
            "Orders",
            "My orders",
            Icons.local_shipping,
            OrderHistoryScreen.routeName,
          ),
          buildListTile(
            context,
            "Favourite",
            "Frequently ordered meals",
            Icons.favorite,
            HomeScreen.routeName,
          ),
          buildListTile(
            context,
            "Cart",
            "My cart",
            Icons.shopping_cart,
            HomeScreen.routeName,
          ),
        ],
      ),
    );
  }
}
