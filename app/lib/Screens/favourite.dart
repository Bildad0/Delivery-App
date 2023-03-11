import 'package:flutter/material.dart';

import '../Models/menuitem.dart';
import '../Widgets/leadings.dart';
import '../Widgets/mealitem.dart';
import '/Resources/types.dart';
import '/Widgets/main_drawer.dart';
import 'cart.dart';

class FavoriteScreen extends StatelessWidget {
  final List<MenuItem> favouriteMeals;

  const FavoriteScreen({
    Key? key,
    required this.favouriteMeals,
  }) : super(key: key);
  static const routeName = "/favorites";

  @override
  Widget build(BuildContext context) {
    if (favouriteMeals.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: headerBackGround,
          foregroundColor: headerTextColor,
          actions: [
            buildLeading(
              context,
              Icons.shopping_cart_outlined,
              CartScreen.routeName,
            ),
            buildLeading(
              context,
              Icons.share_sharp,
              "",
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: const Center(
          child: Text(
            "You have no favorites yet!, start adding some",
            style: TextStyle(
              color: Colors.red,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      );
    }

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: headerBackGround,
          foregroundColor: headerTextColor,
          actions: [
            buildLeading(
              context,
              Icons.shopping_cart_outlined,
              CartScreen.routeName,
            ),
            buildLeading(
              context,
              Icons.share_sharp,
              "",
            )
          ],
        ),
        drawer: const MainDrawer(),
        body: GridView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: favouriteMeals.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final item = favouriteMeals;
            return MealItem(
              mealDescription: item[index].description,
              mealId: item[index].id,
              mealImageUrl: item[index].image,
              mealName: item[index].name,
              mealPrice: item[index].price,
            );
          },
        ));
  }
}
