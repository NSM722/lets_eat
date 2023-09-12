import 'package:flutter/material.dart';
import 'package:lets_eat/models/meal.dart';
import 'package:lets_eat/screens/meal_prep_details.dart';
import 'package:lets_eat/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    required this.meals,
    required this.title,
  });

  final String title;
  final List<Meal> meals;

  void onSelectMealItem(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx) {
        return MealPrepDetailsScreen(meal: meal);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealItem(
          meal: meals[index],
          onSelectMealItem: (meal) {
            onSelectMealItem(context, meal);
          },
        );
      },
    );

    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Ooops...nothing here',
                style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    )),
            const SizedBox(
              height: 16,
            ),
            Text(
              'Select a different category.',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
