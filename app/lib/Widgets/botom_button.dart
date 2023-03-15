import 'package:flutter/material.dart';

import '../Screens/loginorsignup.dart';

class BottomButton extends StatefulWidget {
  const BottomButton({super.key});

  @override
  State<BottomButton> createState() => _BottomButtonState();
}

class _BottomButtonState extends State<BottomButton> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: SizedBox(
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
    );
  }
}
