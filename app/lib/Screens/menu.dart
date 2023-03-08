import 'package:app/Resources/types.dart';
import 'package:flutter/material.dart';

import '../Models/menuitem.dart';
import '../Resources/dummydatat.dart';

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
          return InkWell(
            onTap: () {
              // TODO: Navigate to item details screen
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
