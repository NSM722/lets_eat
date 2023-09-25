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

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  // this variable will not have a value before the class is created
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // initializing this value
    _animationController = AnimationController(
      // this vsync prop is required
      vsync: this,
      duration: const Duration(
        milliseconds: 2500,
      ),
      // animation default values added explicitly for translate
      lowerBound: 0,
      upperBound: 1,
    );
  }

  // clean-up method to remove animation from device memory
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
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
