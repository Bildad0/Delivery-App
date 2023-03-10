import 'dart:math';

import 'package:app/Resources/dummydatat.dart';
import 'package:flutter/material.dart';

import '../Models/menuitem.dart';
import 'allmeal.dart';
import 'cart.dart';

class MealDetailsScreen extends StatefulWidget {
  const MealDetailsScreen({super.key});
  static const routeName = "/meal-details";

  @override
  State<MealDetailsScreen> createState() => _MealDetailsScreenState();
}

class _MealDetailsScreenState extends State<MealDetailsScreen> {
  Widget buildTop(context, ImageProvider backGroundImage) {
//!TODO: get the current product and add image as background
    return ClipPath(
      clipper: CurveImage(),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(MediaQuery.of(context).size.width, 100),
          ),
        ),
        child: Image(
          height: BorderSide.strokeAlignInside,
          image: backGroundImage,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }

  Widget buildmealDetailContainer(
    context,
    String mealTitle,
    String mealCategory,
    String hotelSelling,
    String rating,
    String deliveryTime,
    String mealAmountForTwo,
  ) {
    return Container(
      transform: Matrix4.translationValues(0.0, -50.0, 0.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            mealTitle,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            mealCategory,
            style: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [const Icon(Icons.location_on), Text(hotelSelling)],
          ),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(color: Colors.red),
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(
                Colors.red,
              ),
            ),
            onPressed: () {
              //!TODO:impliment cart
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                "Order now",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star_outline),
                    Text(
                      rating,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
                const Divider(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "$deliveryTime min",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "Delivery Time",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                const Divider(),
                Column(
                  children: [
                    Text(
                      "Ksh $mealAmountForTwo",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Order For Two",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildLeading(context, IconData icon, String route) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route);
      },
      icon: Icon(icon),
    );
  }

  Widget builRecommendedMeals(String mealCategoryId) {
    print("$mealCategoryId");
    final categoryId = mealCategoryId;
    const List<MenuItem> menu = DUMMY_MENU_ITEMS;

    //!TODO: get category name not number.
    final category =
        DUMMY_CATEGORIES.where((category) => category.id == categoryId);
    final mealsWithSameCategory = menu.where((meal) {
      return meal.category.contains(category.first.id);
    });
    //!TODO: get single meal details using  categoryId

    final mealitem = menu.firstWhere((meal) {
      return meal.category.contains(categoryId);
    });

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: mealsWithSameCategory.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemBuilder: (context, index) {
        final item = mealitem;
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
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal =
        DUMMY_MENU_ITEMS.firstWhere((meal) => meal.id == itemId);

    final priceForTwo = selectedMeal.price + 500;

    final mealCategoryId = selectedMeal.category[0];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.white,
        scrolledUnderElevation: 8,
        surfaceTintColor: Colors.white,
        title: Text(selectedMeal.name),
        elevation: 0,
        backgroundColor: Colors.white.withOpacity(.6),
        actions: [
          buildLeading(context, Icons.favorite_border_outlined, ""),
          buildLeading(
              context, Icons.shopping_cart_outlined, CartScreen.routeName),
          buildLeading(context, Icons.share_sharp, "")
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildTop(
              context,
              AssetImage(selectedMeal.image),
            ),
            Container(
              height: 98,
              transform: Matrix4.translationValues(0.0, -50.0, 0.0),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  foregroundImage: AssetImage(selectedMeal.image),
                  radius: 45,
                ),
              ),
            ),
            buildmealDetailContainer(
              context,
              selectedMeal.name,
              selectedMeal.category[1],
              "Bucxton",
              "5.0",
              "20-30",
              "$priceForTwo",
            ),
            const Text(
              "Recommended",
              style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w100,
                fontSize: 24,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              height: 400,
              child: builRecommendedMeals(mealCategoryId),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 150,
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context).pushNamed(MealScreen.routeName);
          },
          child: Row(children: const [
            Icon(Icons.fastfood, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text(
              "Browse Menu",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class CurveImage extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(
      0.0,
      size.height - 30,
    );
    path.quadraticBezierTo(
      size.width / 4,
      size.height,
      size.width / 2,
      size.height,
    );
    path.quadraticBezierTo(
      size.width - (size.width / 4),
      size.height,
      size.width,
      size.height - 30,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
