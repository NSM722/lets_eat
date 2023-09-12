import 'package:flutter/material.dart';
import 'package:lets_eat/data/dummy_data.dart';
import 'package:lets_eat/screens/meals.dart';
import 'package:lets_eat/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectCategory(BuildContext context) {
    // alternative solution
    // Navigator.of(context).push(route);
    Navigator.push(context, MaterialPageRoute(
      builder: (ctx) {
        return const MealsScreen(
          meals: [],
          title: 'Some title',
        );
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select a category'),
      ),
      body: GridView(
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
                _selectCategory(context);
              },
              category: category,
            ),
        ],
      ),
    );
  }
}
