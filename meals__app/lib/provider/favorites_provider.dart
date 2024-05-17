import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/meal.dart';

class FavoriMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriMealsNotifier() : super([]);

  bool toggleFavoriteMealStatus(Meal meal) {
    final isFavorite = state.contains(meal);

    if (isFavorite) {
      state = state.where((element) => element.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoriteMealProvider =
    StateNotifierProvider<FavoriMealsNotifier, List<Meal>>(
        (ref) => FavoriMealsNotifier());
