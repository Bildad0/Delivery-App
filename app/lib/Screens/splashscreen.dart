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
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image:
                DecorationImage(image: image, scale: 3, fit: BoxFit.fitWidth),
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
        ],
        options: CarouselOptions(
          pauseAutoPlayOnManualNavigate: true,
          pauseAutoPlayInFiniteScroll: true,
          autoPlay: true,
          autoPlayCurve: Curves.linear,
          height: MediaQuery.of(context).size.height,
          enableInfiniteScroll: true,
          initialPage: 0,
          padEnds: true,
          autoPlayAnimationDuration: const Duration(milliseconds: 100),
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
          onPressed: (() => {
                Navigator.of(context)
                    .pushReplacementNamed(SignUpScreen.routeName)
              }),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              children: const [
                Icon(
                  Icons.login_outlined,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Get Stated',
                  style:
                      TextStyle(color: Colors.white, fontFamily: 'PatrickHand'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
