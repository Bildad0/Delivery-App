import 'package:app/Widgets/alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Resources/auth_service.dart';
import '../Resources/dummydatat.dart';
import '../theme/theme_constants.dart';
import 'home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = "/login";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: headerBackGround,
        elevation: 0,
        foregroundColor: headerTextColor,
        title: const Center(
          heightFactor: 8,
          child: Text("Login"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                ),
                onPressed: () {
                  //TODO: Navigate to reset password form.
                },
                child: const Text(
                  "Forgot Password ?",
                  style: TextStyle(
                    color: headerTextColor,
                  ),
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
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
                  elevation: const MaterialStatePropertyAll(0),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
                },
                child: const Text(
                  "Login",
                  style: TextStyle(color: backGroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static const routeName = "/signup";

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  String? get _errorText {
    final mailtext = _emailController.text;
    final passtext = _passwordController.text;

    if (mailtext.isEmpty && passtext.isEmpty) {
      return 'can\'t be empty';
    }
    if (passtext.length < 6) {
      return 'Too short';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: headerBackGround,
          title: const Center(
            child: Text(
              "Create your account",
              style: TextStyle(color: headerTextColor),
            ),
          )),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 16.0),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  errorText: _errorText,
                  labelText: "Email",
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: _errorText,
                  labelText: "Password",
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  errorText: _errorText,
                  labelText: "Confirm Password",
                  border: const UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.red),
                    ),
                  ),
                  padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
                  elevation: const MaterialStatePropertyAll(0),
                ),
                onPressed: () async {
                  await context
                      .read<AuthService>()
                      .signIn(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      )
                      .then(
                        (user) => {
                          if (user != null)
                            {
                              Navigator.of(context).pushReplacementNamed(
                                HomeScreen.routeName,
                                arguments: user,
                              ),
                            },
                          showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (BuildContext context) {
                                return alertBox(
                                  context,
                                  Icons.warning,
                                  "Error creating user",
                                  SignUpScreen.routeName,
                                  SignUpScreen.routeName,
                                );
                              })
                        },
                      );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: backGroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
