import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/user.dart';
import '../Resources/dummydatat.dart';
import '../Screens/cart.dart';
import '../Screens/favourite.dart';
import '../Screens/orderhistory.dart';
import '../Screens/userprofile.dart';
import '../theme/theme_constants.dart';
import '../theme/theme_manager.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({super.key});

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

ThemeManager _themeManager = ThemeManager();

class _MainDrawerState extends State<MainDrawer> {
  @override
  void dispose() {
    super.dispose();
    _themeManager.removeListener(themeListener);
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {
        _themeManager.darkMode;
      });
    }
  }

  Widget userProfile(context, IconData icon, User user, String route) {
    String greeting = "";
    final now = DateTime.now();
    String formated = DateFormat.Hm().format(now);
    String time = formated.substring(0, 2);
    int timer = int.parse(time);

    if (timer >= 00 && timer <= 11) {
      greeting = "Good Morning";
    } else if (timer >= 12 && timer <= 14) {
      greeting = "Good Afternoon";
    } else if (timer >= 15 && timer <= 19) {
      greeting = "Good Evening";
    } else {
      greeting = "GoodNight";
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          route,
          arguments: user,
        );
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
                "$greeting ${user.name}",
                style: const TextStyle(
                  color: backGroundColor,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'SawarabiGothic',
                ),
              ),
              Text(
                user.email,
                style: const TextStyle(
                  color: backGroundColor,
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'SawarabiGothic',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTop(
    context,
    IconData icon,
    User user,
    String route,
  ) {
    return Container(
      color: headerTextColor.withOpacity(.7),
      height: 110,
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(15, 40, 15, 0),
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          userProfile(context, icon, user, route),
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
    User user,
  ) {
    return ListTile(
      leading: Icon(
        color: headerTextColor,
        icon,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
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
        Navigator.of(context).pushNamed(route, arguments: user);
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
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade200,
              Colors.white10,
            ],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTop(
              context,
              Icons.person_outlined,
              user,
              ProfileScreen.routeName,
            ),
            //after top
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          buildListTile(
                            context,
                            "Profile",
                            "Profile settings",
                            Icons.person_outlined,
                            ProfileScreen.routeName,
                            user,
                          ),
                          buildListTile(
                            context,
                            "Orders",
                            "Order history",
                            Icons.delivery_dining,
                            OrderHistoryScreen.routeName,
                            user,
                          ),
                          buildListTile(
                            context,
                            "Favourites",
                            "Favourite meals",
                            Icons.favorite_outline_outlined,
                            FavoriteScreen.routeName,
                            user,
                          ),
                          buildListTile(
                            context,
                            "Cart",
                            "Items on cart",
                            Icons.shopping_cart_outlined,
                            CartScreen
                                .routeName, //!TODO: Solve the cartscreen error.
                            user,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Settings",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            fontFamily: 'SawarabiGothic',
                          ),
                        ),
                        Icon(
                          Icons.settings,
                          size: 20,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView(
                          children: [
                            SwitchListTile(
                              title: const Text("Change theme"),
                              value: ThemeMode == _themeManager.lightMode,
                              onChanged: (value) {
                                _themeManager.toggleTheme(value);
                              },
                            ),
                            //!TODO: add SwitchTIle for setting location on.
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
