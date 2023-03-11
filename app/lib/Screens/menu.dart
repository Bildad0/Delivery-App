import 'package:app/Resources/types.dart';
import 'package:app/Screens/mealdetails.dart';
import 'package:flutter/material.dart';

import '../Models/menuitem.dart';
import '../Widgets/mealitem.dart';

class MenuScreen extends StatefulWidget {
  final List<MenuItem> menu;

  static const routeName = '/menu';
  const MenuScreen({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  late String categoryTitle;
  late List<MenuItem> displayedMeals;
  var loadData = false;

  @override
  void didChangeDependencies() {
    if (!loadData) {
      final routeArgs =
          ModalRoute.of(context)?.settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']!;
      final categoryId = routeArgs['id'];
      displayedMeals = widget.menu.where((meal) {
        return meal.category.contains(categoryId);
      }).toList();
      loadData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBackGround,
        elevation: 0,
        title: Text(
          categoryTitle,
          style: const TextStyle(
            color: headerTextColor,
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: displayedMeals.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = displayedMeals[index];
          return MealItem(
            mealDescription: item.description,
            mealId: item.id,
            mealImageUrl: item.image,
            mealName: item.name,
            mealPrice: item.price,
          );
        },
      ),
    );
  }
}
