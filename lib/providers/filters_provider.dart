import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals2/models/meal.dart';

import 'meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier() : super(<Filter, bool>{Filter.glutenFree: false, Filter.lactoseFree: false, Filter.vegetarian: false, Filter.vegan: false});

  void setFilter(Filter filter, bool isActive) {
    state = <Filter, bool>{...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }
}

final StateNotifierProvider<FiltersNotifier, Map<Filter, bool>> filtersProvider = StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((Ref ref) => FiltersNotifier());
final Provider<List<Meal>> filteredMealsProvider = Provider<List<Meal>>((Ref ref) {
  final List<Meal> meals = ref.watch(mealsProvider);
  final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
  return meals.where(
    (Meal meal) {
      if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (activeFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    },
  ).toList();
});
