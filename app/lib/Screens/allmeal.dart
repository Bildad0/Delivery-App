import 'package:flutter/material.dart';

import '../Models/menuitem.dart';
import '../Resources/dummydatat.dart';
import '../Resources/types.dart';
import 'mealdetails.dart';

class MealScreen extends StatefulWidget {
  static const routeName = "/meals";
  const MealScreen({super.key});

  @override
  State<StatefulWidget> createState() => _MealScreenState();
}

class _MealScreenState extends State<MealScreen> {
  late List<MenuItem> displayedMeals = DUMMY_MENU_ITEMS;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: headerTextColor,
        backgroundColor: headerBackGround,
        elevation: 0,
        title: const Text("Meals"),
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
          return InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(MealDetailsScreen.routeName, arguments: item.id);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                        image: AssetImage(item.image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  item.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  item.description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Ksh ${item.price}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
