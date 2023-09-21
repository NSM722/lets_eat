import 'package:flutter_riverpod/flutter_riverpod.dart';

// the filter keys
enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegan: false,
          Filter.vegetarian: false
        });

  // method to mutate state immutably
  void setFilter(Filter filter, bool isActive) {
    state = {
      ...state,
      filter: isActive, // set the filter key to a new value
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>(
  (ref) => FiltersNotifier(),
);
