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
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 60,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(image: image, scale: 3, fit: BoxFit.fill),
          ),
          child: Container(
            transform: Matrix4.translationValues(
                0.0, (MediaQuery.of(context).size.height - 250), 0.0),
            child: Column(
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
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CarouselSlider(
      items: [
        buildCarouselPages(
          const AssetImage('assets/Images/background1.jpg'),
          "",
          "",
        ),
        buildCarouselPages(
          const AssetImage('assets/Images/background3.jpg'),
          "",
          "",
        ),
        buildCarouselPages(
          const AssetImage('assets/Images/background2.jpg'),
          "",
          "",
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Center(
            child: ElevatedButton(
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
                style:
                    TextStyle(color: Colors.white, fontFamily: 'PatrickHand'),
              ),
            ),
          ),
        ),
      ],
      options: CarouselOptions(
        pauseAutoPlayOnManualNavigate: true,
        pauseAutoPlayInFiniteScroll: true,
        autoPlay: true,
        autoPlayCurve: Curves.linear,
        height: MediaQuery.of(context).size.height - 20,
        enableInfiniteScroll: true,
        initialPage: 0,
        padEnds: true,
        autoPlayAnimationDuration: const Duration(milliseconds: 100),
      ),
    ));
  }
}
