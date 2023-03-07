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
    image: 'assets/images/cheeseburger.jpg',
  ),
  MenuItem(
    name: 'Pizza',
    description: 'A delicious pizza with your choice of toppings',
    price: 12.99,
    image: 'assets/images/pizza.jpg',
  ),
  MenuItem(
    name: 'Fried Chicken',
    description: 'Crispy fried chicken with your choice of sides',
    price: 8.99,
    image: 'assets/images/fried_chicken.jpg',
  ),
  MenuItem(
    name: 'Taco Salad',
    description: 'A healthy and delicious taco salad',
    price: 7.99,
    image: 'assets/images/taco_salad.jpg',
  ),
  MenuItem(
    name: 'Fish and Chips',
    description: 'Fresh fish served with crispy chips',
    price: 10.99,
    image: 'assets/images/fish_and_chips.jpg',
  ),
];

const DUMMY_CATEGORIES = [
  category(
    id: '1',
    title: 'Category one',
    color: Colors.blue,
  ),
  category(
    id: '2',
    title: 'Category two',
    color: Colors.blue,
  ),
  category(
    id: '3',
    title: 'Category three',
    color: Colors.blue,
  ),
  category(
    id: '4',
    title: 'Category four',
    color: Colors.blue,
  ),
  category(
    id: '5',
    title: 'Category five',
    color: Colors.blue,
  ),
  category(
    id: '6',
    title: 'Category six',
    color: Colors.blue,
  ),
];
