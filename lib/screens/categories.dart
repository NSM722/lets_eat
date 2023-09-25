import 'package:flutter/material.dart';
import 'package:lets_eat/data/dummy_data.dart';
import 'package:lets_eat/models/category.dart';
import 'package:lets_eat/models/meal.dart';
import 'package:lets_eat/screens/meals.dart';
import 'package:lets_eat/widgets/category_grid_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({
    super.key,
    required this.availableMeals,
  });

  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // alternative solution
    // Navigator.of(context).push(route);
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) {
        return MealsScreen(
          meals: filteredMeals,
          title: category.title,
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(22),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // set the number of columns = 2
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        for (final category in availableCategories)
          CategoryGridItem(
            onSelectCategory: () {
              _selectCategory(context, category);
            },
            category: category,
          ),
      ],
    );
  }
}
