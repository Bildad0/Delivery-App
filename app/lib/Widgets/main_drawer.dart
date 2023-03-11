import 'package:flutter/material.dart';

import '../Models/user.dart';
import '../Resources/dummydatat.dart';
import '../Resources/types.dart';
import '../Screens/cart.dart';
import '../Screens/favourite.dart';
import '../Screens/orderhistory.dart';
import '/Screens/home.dart';

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: backGroundColor,
                size: 20,
              ),
              const SizedBox(
                width: 20,
              ),
              Text(
                title,
                style: const TextStyle(
                  color: backGroundColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.notifications,
            color: backGroundColor,
            size: 20,
          )
        ],
      ),
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
        color: headerTextColor,
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
        Navigator.of(context).pushNamed(route);
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
            Icons.category_outlined,
            HomeScreen.routeName,
          ),
          buildListTile(
            context,
            "Orders",
            "My orders",
            Icons.local_shipping_outlined,
            OrderHistoryScreen.routeName,
          ),
          buildListTile(
            context,
            "Favourite",
            "Frequently ordered meals",
            Icons.favorite_outline_outlined,
            FavoriteScreen.routeName,
          ),
          buildListTile(
            context,
            "Cart",
            "My cart",
            Icons.shopping_cart_outlined,
            CartScreen.routeName, //!TODO: Solve the cartscreen error.
          ),
        ],
      ),
    );
  }
}
