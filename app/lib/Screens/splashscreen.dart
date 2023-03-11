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
    AssetImage image,
    String title,
    String description,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 120,
          width: 120,
          padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(image: image, scale: 3),
          ),
        ),
        Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontStyle: FontStyle.italic,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
              ),
              onPressed: (() => {
                    Navigator.of(context)
                        .pushReplacementNamed(SignUpScreen.routeName)
                  }),
              child: const Text(
                'Get Stated',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ],
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
              const AssetImage('assets/Images/map.png'),
              "Discover restaurants near you",
              "The best restaurants in the world are just next to you",
            ),
            buildCarouselPages(
              const AssetImage('assets/Images/pizza.png'),
              "A collection of different cuisines",
              "We have variety of cuisines in our menu you can't miss what you like",
            ),
            buildCarouselPages(
              const AssetImage('assets/Images/deliverybike.png'),
              "Delivered Quickly at your place",
              "Our professional riders will get you your meal on time.",
            ),
          ],
          options: CarouselOptions(
            pauseAutoPlayOnManualNavigate: true,
            pauseAutoPlayInFiniteScroll: true,
            autoPlay: true,
            height: 700, //TODO: get the device hieght - 20 px
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            initialPage: 0,
            padEnds: true,
            autoPlayAnimationDuration: const Duration(milliseconds: 500),
          ),
        )
      ],
    ));
  }
}
