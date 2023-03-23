// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Models/address.dart';
import '../Models/foodcategories.dart';
import '../Models/menuitem.dart';
import '../Models/order.dart';

const DUMMY_MENU_ITEMS = [
  MenuItem(
    id: "1",
    name: 'Cheeseburger',
    description: 'A classic cheeseburger with all the fixings',
    price: 470,
    image: 'assets/Images/cheeseburger.jpg',
    category: [
      "0",
      "1",
      "3",
    ],
  ),
  MenuItem(
    id: "2",
    name: 'Pizza',
    description: 'A delicious pizza with your choice of toppings',
    price: 450,
    image: 'assets/Images/pizza.jpg',
    category: [
      "0",
      "1",
      "3",
    ],
  ),
  MenuItem(
    id: "3",
    name: 'Fried Chicken',
    description: 'Crispy fried chicken with your choice of sides',
    price: 300,
    image: 'assets/Images/fried_chicken.jpeg',
    category: [
      "0",
      "3",
      "5",
    ],
  ),
  MenuItem(
    id: "4",
    name: 'Taco Salad',
    description: 'A healthy and delicious taco salad',
    price: 750,
    image: 'assets/Images/taco_salad.jpeg',
    category: [
      "2",
      "0",
      "4",
    ],
  ),
  MenuItem(
    id: "5",
    name: 'Fish and Chips',
    description: 'Fresh fish served with crispy chips',
    price: 1100,
    image: 'assets/Images/fish_and_chips.jpeg',
    category: [
      "0",
      "5",
      "6",
      "1",
    ],
  ),
];

const DUMMY_CATEGORIES = [
  category(
    id: '0',
    title: 'All',
    color: Colors.blue,
    imagUrl: 'assets/Images/fish_and_chips.jpeg',
  ),
  category(
    id: '1',
    title: 'Snacks',
    color: Colors.blue,
    imagUrl: 'assets/Images/taco_salad.jpeg',
  ),
  category(
    id: '2',
    title: 'Light Meals',
    color: Colors.blue,
    imagUrl: 'assets/Images/pizza.jpg',
  ),
  category(
    id: '3',
    title: 'Heavy meals',
    color: Colors.blue,
    imagUrl: '',
  ),
  category(
    id: '4',
    title: 'Dessert',
    color: Colors.blue,
    imagUrl: '',
  ),
  category(
    id: '5',
    title: 'Drinks',
    color: Colors.blue,
    imagUrl: '',
  ),
  category(
    id: '6',
    title: 'Sea Foods',
    color: Colors.blue,
    imagUrl: '',
  ),
];

const DUMMY_USER = [];

//!Get address from picked up location cordinates.

const DUMMY_ADDRESSES = [
  Address(
    street: "Nairobi",
    city: "Nairobi",
    state: "Kenya",
    zipCode: "123",
  ),
];

final DUMMY_ORDER = [];

Future<Object?> createUser(String emailAddress, String password) async {
  try {
    final credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailAddress,
      password: password,
    );
    print("$credential");
    return credential;
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      print('The password provided is too weak.');
    } else if (e.code == 'email-already-in-use') {
      print('The account already exists for that email.');
    }
  } catch (e) {
    print(e);
  }
  return null;
}

Future<Object?> signInUser(String emailAddress, String password) async {
  try {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddress, password: password);
    print(credential);
    return credential.user;
  } on FirebaseAuthException catch (e) {
    return e.message;
  }
}

void sigOut() async {
  await FirebaseAuth.instance.signOut();
}
