import 'package:flutter/material.dart';
import 'package:lets_eat/screens/categories.dart';
import 'package:lets_eat/screens/filters.dart';
import 'package:lets_eat/screens/meals.dart';
import 'package:lets_eat/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lets_eat/providers/favoriteMeals_provider.dart';
import 'package:lets_eat/providers/filters_provider.dart';

const kInitialFilters = {
  // global variable with default filters values
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // always close the drawer
    if (identifier == 'filters') {
      // the result here is the Map data set(of filters) returned by navigating
      // from the filters screen
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return const FiltersScreen();
          },
        ),
      );
      // verify returned data
      // print(result);
      // update the filter values
      // setState(() {
      //   _selectedFilters = result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    ); // default set Tab
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      // favoriteMeals provider watcher
      final favoriteMeals = ref.watch(favoriteMealsProvider);

      activePage = MealsScreen(
        meals: favoriteMeals,
      );
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:
            _selectedPageIndex, // set the active Tab therefore highlighting the icon
        // this index value is provided by flutter when a user taps on the Tab
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
