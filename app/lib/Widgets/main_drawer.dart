import 'package:flutter/material.dart';

import '../Models/user.dart';
import '../Resources/dummydatat.dart';
import '../Screens/cart.dart';
import '../Screens/favourite.dart';
import '../Screens/orderhistory.dart';
import '../theme/theme_constants.dart';
import '/Screens/home.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget buildTop(context, IconData icon, String title, String userEmail) {
//!TODO: get the current user then display the name where there is String Bildad.

    return Container(
      color: headerTextColor.withOpacity(.7),
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              //!TODO: navigate to user profile
            },
            child: Row(
              children: [
                Icon(
                  icon,
                  color: backGroundColor,
                  size: 20,
                ), //!TODO: change to user image
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: backGroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'SawarabiGothic',
                      ),
                    ),
                    Text(
                      userEmail,
                      style: const TextStyle(
                        color: backGroundColor,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'SawarabiGothic',
                      ),
                    ),
                  ],
                ),
              ],
            ),
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
        size: 25,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: 'SawarabiGothic',
        ),
      ),
      subtitle: Text(
        description,
        style: const TextStyle(
          color: descriptionColor,
          fontStyle: FontStyle.italic,
          fontFamily: 'SawarabiGothic',
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<User> users = DUMMY_USER;
    String id = '1'; //!TODO: get userId from localstorage

    final user = users.where((user) => user.id == id).first;

    return Drawer(
      elevation: 0,
      child: Column(
        children: [
          buildTop(
            context,
            Icons.person_outlined,
            user.name,
            user.email,
          ),
          buildListTile(
            context,
            "Home",
            "Meals and categories",
            Icons.category_outlined,
            HomeScreen.routeName,
          ),
          buildListTile(
            context,
            "Orders",
            "Order history",
            Icons.local_shipping_outlined,
            OrderHistoryScreen.routeName,
          ),
          buildListTile(
            context,
            "Favourites",
            "Favourite meals",
            Icons.favorite_outline_outlined,
            FavoriteScreen.routeName,
          ),
          buildListTile(
            context,
            "Cart",
            "Items on cart",
            Icons.shopping_cart_outlined,
            CartScreen.routeName, //!TODO: Solve the cartscreen error.
          ),
        ],
      ),
    );
  }
}
