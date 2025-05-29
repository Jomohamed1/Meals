import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/models/meal.dart';

class FavouriteProvider extends StateNotifier<List<Meal>> {
  FavouriteProvider() : super([]);

  void mealFavourtie(Meal meal) {
    final isExisting = state.contains(meal);
    if (isExisting) {
      state = state.where((element) => meal.id != element.id).toList();
    } else {
      state = [...state, meal];
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouriteProvider, List<Meal>>((ref) {
      return FavouriteProvider();
    });
