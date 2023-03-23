// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Models/foodcategories.dart';
import '../Resources/dummydatat.dart';
import '../Widgets/card_slider.dart';
import '../Widgets/cart_icon.dart';
import '../Widgets/main_drawer.dart';
import '../Widgets/meal_category.dart';
import '../theme/theme_constants.dart';
import 'cart.dart';
import 'chat_page.dart';
import 'rewards.dart';
import 'track_order.dart';
import 'userprofile.dart';

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
  int selectedPageIndex = 0;

  void selectedPage(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as Object;
    final List<Map<String, Object>> _pages = [
      {"page": const HomePage(), "title": "RebDelivery"},
      {"page": const TrackOrder(), "title": "Track Order"},
      {"page": const ChatPage(), "title": "Agent"}
    ];

    String cartQuantity = widget.cartQuantity.call();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBackGround,
        elevation: 0,
        foregroundColor: headerTextColor,
        title: Text(_pages[selectedPageIndex]['title'] as String),
        actions: [
          cartIcon(
            context,
            Icons.shopping_cart_outlined,
            CartScreen.routeName,
            cartQuantity,
          ),
        ],
      ),
      drawer: MainDrawer(
        user: user,
      ),
      body: _pages[selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: selectedPageIndex,
        onTap: selectedPage,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.red,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: "Track Order",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            label: "Talk to Us",
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const List<category> _categories = DUMMY_CATEGORIES;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Featured', style: Theme.of(context).textTheme.bodyLarge),
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
              cardSlider(
                context,
                const NetworkImage(
                    'https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-1.jpg'),
                'Drinks',
              ),
              cardSlider(
                  context,
                  const NetworkImage(
                      'https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-3-1536x1024.jpg'),
                  'Wines'),
              cardSlider(
                context,
                const NetworkImage(
                    'https://anestisxasapotaverna.gr/wp-content/uploads/2021/12/ARTICLE-2.jpg'),
                "Cocktails",
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Categories',
            style: Theme.of(context).textTheme.bodyLarge,
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
    );
  }
}
