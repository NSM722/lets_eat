import 'package:flutter/material.dart';
import 'package:lets_eat/models/meal.dart';
import 'package:lets_eat/screens/categories.dart';
import 'package:lets_eat/screens/filters.dart';
import 'package:lets_eat/screens/meals.dart';
import 'package:lets_eat/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.lightGreenAccent,
        closeIconColor: const Color.fromARGB(255, 28, 30, 16),
        showCloseIcon: true,
      ),
    );
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _toggleFavoriteMeal(Meal meal) {
    final isalreadyAfavorite = _favoriteMeals.contains(meal);

    if (isalreadyAfavorite) {
      setState(() {
        _favoriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer a favorite');
      });
    } else {
      setState(() {
        _favoriteMeals.add(meal);
        _showInfoMessage('Meal marked as favorite');
      });
    }
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop(); // always close the drawer
    if (identifier == 'filters') {
      // the result here is the Map data set(of filters) returned by navigating
      // from the filters screen
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (ctx) {
            return const FiltersScreen();
          },
        ),
      );
      // verify returned data
      print(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavorite: _toggleFavoriteMeal,
    ); // default set Tab
    var activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteMeal,
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
