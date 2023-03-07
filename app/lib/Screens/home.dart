// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../Models/foodcategories.dart';
import '../Resources/dummydatat.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const routeName = '/home';

  Widget buildingCtegoryListTile(String title) {
    return ListTile(
      title: Text(title),
      leading: const Icon(Icons.category),
      onTap: () {
        // TODO: Navigate to category screen
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<category> _categories = DUMMY_CATEGORIES;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text('Home'),
      ),
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
                Image.network('https://example.com/image1.jpg',
                    fit: BoxFit.cover),
                Image.network('https://example.com/image2.jpg',
                    fit: BoxFit.cover),
                Image.network('https://example.com/image3.jpg',
                    fit: BoxFit.cover),
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
                return buildingCtegoryListTile(_categories[index].title);
              },
              itemCount: _categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
