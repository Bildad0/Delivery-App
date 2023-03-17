// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Models/foodcategories.dart';
import '../Resources/dummydatat.dart';
import '../Widgets/cart_icon.dart';
import '../Widgets/main_drawer.dart';
import '../Widgets/meal_category.dart';
import '../theme/theme_constants.dart';
import '../theme/theme_manager.dart';
import 'cart.dart';

class HomeScreen extends StatefulWidget {
  final Function cartQuantity;
  const HomeScreen({
    Key? key,
    required this.cartQuantity,
  }) : super(key: key);

  static const routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var appName = "RebDelivery";
    String cartQuantity = widget.cartQuantity.call();
    const List<category> _categories = DUMMY_CATEGORIES;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBackGround,
        elevation: 0,
        foregroundColor: headerTextColor,
        title: Text(appName, style: Theme.of(context).textTheme.titleLarge),
        actions: [
          cartIcon(
            context,
            Icons.shopping_cart_outlined,
            CartScreen.routeName,
            cartQuantity,
          ),
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
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Categories',
              style: Theme.of(context).textTheme.titleLarge,
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
