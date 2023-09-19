import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lets_eat/models/meal.dart';

// provider to set favorite meals

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  //constructor function
  FavoriteMealsNotifier()
      : super([]); // initial data stored is empty & can't be mutated

  // method to edit the above data
  void toggleFavoriteMeal(Meal meal) {
    final isMealFavorite = state.contains(meal);

    // if the meal is a favorite remove it from the list
    if (isMealFavorite) {
      // .where() returns a new list therefore not mutating original state
      state = state.where((element) => element.id != meal.id).toList();
    } else {
      // else if the meal isn't a favorite then add it
      state = [...state, meal];
    }

    state = [];
  }
}

// StateNotifierProvider class is preferable for dynamic data
// here you have to connect the above class data to this StateNotifierProvider
final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>(
  (ref) {
    return FavoriteMealsNotifier();
  },
);
