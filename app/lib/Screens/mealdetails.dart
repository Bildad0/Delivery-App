import 'package:flutter/material.dart';

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
        height: 180,
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
          fit: BoxFit.fill,
        ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
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
              //!TODO: get the current product Image
              const AssetImage("assets/Images/pizza.jpg"),
            ),
            Container(
              transform: Matrix4.translationValues(0.0, -60.0, 0.0),
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.red,
                child: CircleAvatar(
                  foregroundImage: AssetImage("assets/Images/pizza.jpg"),
                  radius: 48,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
        width: 150,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(MealScreen.routeName);
          },
          child: Row(children: const [
            Icon(Icons.category, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text(
              "Browse all Menu",
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
