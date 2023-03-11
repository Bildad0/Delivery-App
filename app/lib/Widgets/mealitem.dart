import 'package:flutter/material.dart';

import '../Screens/mealdetails.dart';

class MealItem extends StatelessWidget {
  final String mealId;
  final String mealImageUrl;
  final String mealName;
  final double mealPrice;
  final String mealDescription;
  const MealItem({
    Key? key,
    required this.mealId,
    required this.mealImageUrl,
    required this.mealName,
    required this.mealPrice,
    required this.mealDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(MealDetailsScreen.routeName,
            arguments: mealId);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(mealImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            mealName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            mealDescription,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Ksh $mealPrice',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
