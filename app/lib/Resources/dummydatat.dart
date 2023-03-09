// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:app/Models/address.dart';
import 'package:flutter/material.dart';

import '../Models/foodcategories.dart';
import '../Models/menuitem.dart';
import '../Models/order.dart';
import '../Models/user.dart';

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
      "3",
      "5",
      "0",
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
      "5",
      "6",
      "1",
      "0",
    ],
  ),
];

const DUMMY_CATEGORIES = [
  category(
    id: '0',
    title: 'All',
    color: Colors.blue,
    imagUrl: '',
  ),
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

const DUMMY_USER = [
  User(
    id: "1",
    name: "Bildad",
    email: "bildadowuor@gmail.com",
    phone: "0700524820",
    address: ["123", "231"],
  ),
];

//!connect user Address with the zip code because it's the unique component.

const DUMMY_ADDRESSES = [
  Address(
    street: "Nairobi",
    city: "Nairobi",
    state: "Kenya",
    zipCode: "123",
  ),
];

final DUMMY_ORDER = [
  Order(
    user: DUMMY_USER[0],
    deliveryAddress: DUMMY_ADDRESSES[0],
    items: [
      const MenuItem(
        id: "3",
        name: 'Fried Chicken',
        description: 'Crispy fried chicken with your choice of sides',
        price: 300,
        image: 'assets/Images/fried_chicken.jpeg',
        category: [
          "3",
          "5",
          "0",
        ],
      ),
      const MenuItem(
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
      const MenuItem(
        id: "5",
        name: 'Fish and Chips',
        description: 'Fresh fish served with crispy chips',
        price: 1100,
        image: 'assets/Images/fish_and_chips.jpeg',
        category: [
          "5",
          "6",
          "1",
          "0",
        ],
      ),
    ],
    totalCost: 4000,
    orderDate: DateTime.now(),
    deliveryDate: DateTime.now(),
  ),
  Order(
    user: DUMMY_USER[0],
    deliveryAddress: DUMMY_ADDRESSES[0],
    items: [],
    totalCost: 4000,
    orderDate: DateTime.now(),
    deliveryDate: DateTime.now(),
  ),
];
