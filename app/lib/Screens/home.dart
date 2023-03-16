// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/foodcategories.dart';
import '../Resources/dummydatat.dart';
import '../Widgets/main_drawer.dart';
import '../Widgets/meal_category.dart';
import '../theme/theme_constants.dart';
import '../theme/theme_manager.dart';
import 'menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

ThemeManager _themeManager = ThemeManager();

class _HomeScreenState extends State<HomeScreen> {
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
        _themeManager.addListener(themeListener);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var greetings = "RebDelivery";
    const List<category> _categories = DUMMY_CATEGORIES;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBackGround,
        elevation: 0,
        foregroundColor: headerTextColor,
        title: Text(greetings),
        actions: [
          Switch(
              value: _themeManager.themeMode == ThemeMode.dark,
              onChanged: (newValue) {
                _themeManager.toggleTheme(newValue);
              }), //!TODO: add this toggle button on settings page for  theme changing.
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child:
                Text('Featured', style: Theme.of(context).textTheme.titleLarge),
          ),
          SizedBox(
            height: 200,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
              ),
              items: [
                Image.network(
                    'https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-1.jpg',
                    fit: BoxFit.fill),
                Image.network(
                    'https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-3-1536x1024.jpg',
                    fit: BoxFit.fill),
                Image.network(
                    'https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-2.jpg',
                    fit: BoxFit.fill),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Categories',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: StretchingOverscrollIndicator(
              axisDirection: AxisDirection.down,
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                ),
                itemBuilder: (ctx, index) {
                  return buildingCategoryListTile(ctx, _categories[index].title,
                      _categories[index].id, _categories[index].imagUrl);
                },
                itemCount: _categories.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
