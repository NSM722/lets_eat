import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lets_eat/data/dummy_data.dart';

// set up the provider
// the ref object is automatically passed to the function
final mealsProvider = Provider(
  (ref) {
    // return the value to provide which is dummyMeals just as an example
    return dummyMeals;
  },
);
