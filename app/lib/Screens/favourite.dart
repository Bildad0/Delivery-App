import 'package:flutter/material.dart';

import '../Models/menuitem.dart';

import '../Widgets/alert.dart';
import '../Widgets/cart_icon.dart';
import '../Widgets/mealitem.dart';
import '../theme/theme_constants.dart';
import 'allmeal.dart';
import 'cart.dart';
import 'home.dart';

class FavoriteScreen extends StatefulWidget {
  final List<MenuItem> favouriteMeals;
  final Function cartQuantity;
  const FavoriteScreen({
    Key? key,
    required this.favouriteMeals,
    required this.cartQuantity,
  }) : super(key: key);
  static const routeName = "/favorites";

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final cartQuantity = widget.cartQuantity.call();
    if (widget.favouriteMeals.isEmpty) {
      return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red.shade400,
                Colors.white38,
              ],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(0.1, 1.0),
            ),
          ),
          child: alertBox(
            context,
            Icons.info_outlined,
            "You have no favourites yet! Start adding some",
            HomeScreen.routeName,
            MealScreen.routeName,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios_outlined,
            size: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: headerBackGround,
        foregroundColor: headerTextColor,
        actions: [
          cartIcon(
            context,
            Icons.shopping_cart_outlined,
            CartScreen.routeName,
            cartQuantity,
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share_sharp),
          )
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: widget.favouriteMeals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = widget.favouriteMeals;
          return MealItem(
            mealDescription: item[index].description,
            mealId: item[index].id,
            mealImageUrl: item[index].image,
            mealName: item[index].name,
            mealPrice: item[index].price,
          );
        },
      ),
    );
  }
}
