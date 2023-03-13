import 'package:flutter/material.dart';

import '../Models/menuitem.dart';
import '../Widgets/leadings.dart';
import '../Widgets/main_drawer.dart';
import '../Widgets/mealitem.dart';
import '/Resources/dummydatat.dart';
import 'allmeal.dart';
import 'cart.dart';

class MealDetailsScreen extends StatefulWidget {
  static const routeName = "/meal-details";
  final Function toggleFavorite;
  final Function isFavorite;
  final Function addToCart;
  const MealDetailsScreen({
    Key? key,
    required this.toggleFavorite,
    required this.isFavorite,
    required this.addToCart,
  }) : super(key: key);

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
            bottom: Radius.elliptical(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.width * 0.001,
            ),
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
    String mealId,
    String mealTitle,
    String mealCategory,
    String hotelSelling,
    String rating,
    Function addToCart,
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
              addToCart(mealId);
              print("meal added to cart " + mealId);
            },
            child: Container(
              padding: const EdgeInsets.all(5),
              child: const Text(
                "Add to Cart",
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
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
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
                const Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Column(
                  children: [
                    Text(
                      "Ksh $mealAmountForTwo",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Save -100",
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

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context)?.settings.arguments as String;
    final selectedMeal = DUMMY_MENU_ITEMS.firstWhere((meal) {
      return meal.id == itemId;
    });
    final priceForTwo = selectedMeal.price;

    final mealCategoryId = selectedMeal.category.last;
    final categoryName = DUMMY_CATEGORIES.lastWhere((category) {
      return category.id == mealCategoryId;
    });

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.white,
        scrolledUnderElevation: 8,
        surfaceTintColor: Colors.white,
        title: Text(selectedMeal.name),
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              widget.isFavorite(selectedMeal.id)
                  ? Icons.favorite
                  : Icons.favorite_outline,
              color: Colors.yellow,
            ),
            onPressed: () {
              widget.toggleFavorite(selectedMeal.id);
            },
          ),
          buildLeading(
              context, Icons.shopping_cart_outlined, CartScreen.routeName),
          buildLeading(
            context,
            Icons.share_sharp,
            "",
          ),
        ],
      ),
      drawer: const MainDrawer(),
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
              selectedMeal.id,
              selectedMeal.name,
              categoryName.title, //!TODO :add cattegory name.
              "Bucxton",
              "5.0",
              widget.addToCart,
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
              padding: const EdgeInsets.all(1),
              margin: const EdgeInsets.all(20),
              height: 400,
              child: RecommendedMeals(
                mealCategoryId: mealCategoryId,
              ),
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

class RecommendedMeals extends StatefulWidget {
  final String mealCategoryId;
  const RecommendedMeals({
    Key? key,
    required this.mealCategoryId,
  }) : super(key: key);

  @override
  State<RecommendedMeals> createState() => _RecommendedMealsState();
}

class _RecommendedMealsState extends State<RecommendedMeals> {
  var loadData = false;
  late List<MenuItem> menu;

  @override
  void didChangeDependencies() {
    if (!loadData) {
      final categoryId = widget.mealCategoryId;
      menu = DUMMY_MENU_ITEMS.where((meal) {
        return meal.category.contains(categoryId);
      }).toList();
      loadData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final categoryId = widget.mealCategoryId;
    //!TODO: get category name not number.
    final mealsWithSameCategory = menu.where((meal) {
      return meal.category.contains(categoryId);
    }).toList();

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
        final item = mealsWithSameCategory;
        return MealItem(
          mealDescription: item[index].description,
          mealId: item[index].id,
          mealImageUrl: item[index].image,
          mealName: item[index].name,
          mealPrice: item[index].price,
        );
      },
    );
  }
}
