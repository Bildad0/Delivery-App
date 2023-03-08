// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import '../Models/foodcategories.dart';
import '../Models/menuitem.dart';

// ignore: constant_identifier_names
const DUMMY_MENU_ITEMS = [
  MenuItem(
    name: 'Cheeseburger',
    description: 'A classic cheeseburger with all the fixings',
    price: 9.99,
    image: 'assets/Images/cheeseburger.jpg',
  ),
  MenuItem(
    name: 'Pizza',
    description: 'A delicious pizza with your choice of toppings',
    price: 12.99,
    image: 'assets/Images/pizza.jpg',
  ),
  MenuItem(
    name: 'Fried Chicken',
    description: 'Crispy fried chicken with your choice of sides',
    price: 8.99,
    image: 'assets/Images/fried_chicken.jpeg',
  ),
  MenuItem(
    name: 'Taco Salad',
    description: 'A healthy and delicious taco salad',
    price: 7.99,
    image: 'assets/Images/taco_salad.jpeg',
  ),
  MenuItem(
    name: 'Fish and Chips',
    description: 'Fresh fish served with crispy chips',
    price: 10.99,
    image: 'assets/Images/fish_and_chips.jpeg',
  ),
];

const DUMMY_CATEGORIES = [
  category(
    id: '1',
    title: 'Snacks',
    color: Colors.blue,
    imagUrl: '',
  ),
  category(
    id: '2',
    title: 'Light Meals',
    color: Colors.blue,
    imagUrl: '',
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
