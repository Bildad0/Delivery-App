import 'package:flutter/material.dart';

import '../Resources/types.dart';
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
          backgroundColor: headerBackGround,
          elevation: 0,
          foregroundColor: headerTextColor,
          title: const Center(
            heightFactor: 8,
            child: Text("Login"),
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
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextButton(
                  onPressed: () {
                    //TODO: Navigate to reset password form.
                  },
                  child: const Text("Forgot Password ?",
                      style: TextStyle(color: headerTextColor))),
              ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(ContinuousRectangleBorder()),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  elevation: MaterialStatePropertyAll(0),
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
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: const ButtonStyle(
                  shape: MaterialStatePropertyAll(ContinuousRectangleBorder()),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(10)),
                  elevation: MaterialStatePropertyAll(0),
                ),
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(HomeScreen.routeName);
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
