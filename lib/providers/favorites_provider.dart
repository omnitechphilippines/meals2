import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super(<Meal>[]);

  bool toggleMealFavoriteStatus(Meal meal) {
    if (state.contains(meal)) {
      state = state.where((Meal m) => m.id != meal.id).toList();
      return false;
    } else {
      state = <Meal>[...state, meal];
      return true;
    }
  }
}

final StateNotifierProvider<FavoriteMealsNotifier, List<Meal>> favoriteMealsProvider = StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((Ref ref) => FavoriteMealsNotifier());
