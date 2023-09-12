import 'package:flutter/material.dart';
import 'package:lets_eat/models/meal.dart';

class MealPrepDetailsScreen extends StatelessWidget {
  const MealPrepDetailsScreen({
    super.key,
    required this.meal,
  });

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: Image.network(
        meal.imageUrl,
        width: double.infinity, // occupies all available space
        height: 270,
        fit: BoxFit.cover,
      ),
    );
  }
}
