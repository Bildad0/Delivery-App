import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'loginorsignup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget buildCarouselPages(
    ImageProvider image,
    String title,
    String description,
  ) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        image: DecorationImage(image: image, fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            description,
            style: const TextStyle(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
          ElevatedButton(
            onPressed: (() => {
                  Navigator.of(context)
                      .pushReplacementNamed(LoginScreen.routeName)
                }),
            child: const Text(
              'Get Stated',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CarouselSlider(
            items: [
              buildCarouselPages(
                const NetworkImage(
                    'https://www.flaticon.com/free-icons/map'), //TODO: work on Image loader for both network and asset images.
                "Discover restaurants near you",
                "The best restaurants in the world are just next to you",
              ),
              buildCarouselPages(
                const NetworkImage(
                    'https://www.flaticon.com/free-icons/map'), //TODO: add more images
                "A collection of different cuisines",
                "We have variety of cuisines in our menu you can't miss what you like",
              ),
              buildCarouselPages(
                const NetworkImage(
                    'https://www.flaticon.com/free-icons/map'), //TODO: add more images
                "Delivered Quickly at your place",
                "Our professional riders will get you your meal on time.",
              ),
            ],
            options: CarouselOptions(
              autoPlay: true,
              enableInfiniteScroll: true,
              enlargeCenterPage: true,
              autoPlayAnimationDuration: const Duration(milliseconds: 500),
            ),
          )
        ],
      ),
    );
  }
}
