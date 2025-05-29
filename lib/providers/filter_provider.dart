import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/meal_providers.dart';

enum Filter {
  filterSwitchGluten,
  filterSwitchVegeterian,
  filterSwitchVegan,
  filterSwitchLactose,
}

class FilterProvider extends StateNotifier<Map<Filter, bool>> {
  FilterProvider()
    : super({
        Filter.filterSwitchGluten: false,
        Filter.filterSwitchLactose: false,
        Filter.filterSwitchVegan: false,
        Filter.filterSwitchVegeterian: false,
      });

  void filterSwitch(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setfilters(Map<Filter, bool> filters) {
    state = filters;
  }
}

final filterProvider = StateNotifierProvider<FilterProvider, Map<Filter, bool>>(
  (ref) {
    return FilterProvider();
  },
);

final avaliableMealProvider = Provider((ref) {
  final meal = ref.watch(providermeal);
  final filter = ref.watch(filterProvider);

  return meal.where((meal) {
    if (filter[Filter.filterSwitchGluten]! && !meal.isGlutenFree) {
      return false;
    }
    if (filter[Filter.filterSwitchLactose]! && !meal.isLactoseFree) {
      return false;
    }
    if (filter[Filter.filterSwitchVegan]! && !meal.isVegan) {
      return false;
    }
    if (filter[Filter.filterSwitchVegeterian]! && !meal.isVegetarian) {
      return false;
    }
    return true;
  }).toList();
});
