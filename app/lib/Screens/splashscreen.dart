import 'package:flutter/material.dart';
import '../Resources/dummydatat.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Images/background3.jpg'),
              fit: BoxFit.fill),
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
                getUser(),
                Navigator.of(context)
                    .pushReplacementNamed(SignUpScreen.routeName)
              }),
          child: Container(
            margin: const EdgeInsets.all(5),
            child: Row(
              children: const [
                Icon(
                  Icons.food_bank_outlined,
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
