import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:lets_eat/screens/tabs.dart';
// import 'package:lets_eat/widgets/main_drawer.dart';
import 'package:lets_eat/providers/filters_provider.dart';

class FiltersScreen extends ConsumerStatefulWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  void initState() {
    super.initState();
    // reading and initializing local state
    final activeFilters = ref.read(filtersProvider);
    // overwrite the initial state values to avoid a reset
    _isGlutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _isLactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _isVeganFreeFilterSet = activeFilters[Filter.vegan]!;
    _isVegetarianFreeFilterSet = activeFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement(MaterialPageRoute(
      //         builder: (ctx) {
      //           return const TabsScreen();
      //         },
      //       ));
      //     }
      //   },
      // ),
      body: WillPopScope(
        // the function onWillPop() is invoked by
        // Flutter when the user leaves this screen
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _isGlutenFreeFilterSet,
            Filter.lactoseFree: _isLactoseFreeFilterSet,
            Filter.vegan: _isVeganFreeFilterSet,
            Filter.vegetarian: _isVegetarianFreeFilterSet,
          });
          // Navigator.of(context).pop();
          return true;
        },
        child: Column(
          children: [
            SwitchListTile(
              // gluten-free filter
              value: _isGlutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isGlutenFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              // lactose-free filter
              value: _isLactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isLactoseFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              // vegetarian-free filter
              value: _isVegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isVegetarianFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegetarian-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
            SwitchListTile(
              // vegan-free filter
              value: _isVeganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _isVeganFreeFilterSet = isChecked;
                });
              },
              title: Text(
                'Vegan-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(
                left: 34,
                right: 22,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
