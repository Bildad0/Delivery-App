// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../Models/foodcategories.dart';
import '../Resources/dummydatat.dart';
import '../Resources/types.dart';
import '../Widgets/main_drawer.dart';
import 'menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  Widget buildingCtegoryListTile(context, String title, String id) {
    return ListTile(
      title: Text(title),
      leading: const Icon(Icons.category),
      onTap: () {
        Navigator.of(context).pushNamed(
          MenuScreen.routeName,
          arguments: {
            'id': id,
            'title': title,
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<category> _categories = DUMMY_CATEGORIES;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: headerBackGround,
        elevation: 0,
        foregroundColor: headerTextColor,
        title: const Text(
            'Good Morning!'), //!TODO: get the current time and greet the user depending on the time.
        actions: [
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
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Featured',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
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
            child: ListView.builder(
              itemBuilder: (ctx, index) {
                return buildingCtegoryListTile(
                    ctx, _categories[index].title, _categories[index].id);
              },
              itemCount: _categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
