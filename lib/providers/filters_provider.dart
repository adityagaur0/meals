import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/providers/meals_provider.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegitarian,
  vegan,
}

// PROVIDER 1
class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          //here it should be maps of filter set to false initially.
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegitarian: false,
          Filter.vegan: false,
        });

  // method to set ALL THE FILTERS IN FILTER.Dart
  void setFilters(Map<Filter, bool> choosenFilters) {
    state = choosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    //in immutable way
    state = {
      // new map with
      ...state, // all old key value pairs
      filter: isActive, //but one maps with new key value pairs
    };
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

//PROVIDER 2 : - 190 . CONNECTING MULTIPLE PROVIDER
/*

 */

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activefilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activefilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activefilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activefilters[Filter.vegitarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activefilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});
