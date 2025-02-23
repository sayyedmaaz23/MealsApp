import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/meals_provider.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersNotifier extends StateNotifier<Map<Filter, bool>> {
  FiltersNotifier()
      : super({
          Filter.glutenFree: false,
          Filter.lactoseFree: false,
          Filter.vegetarian: false,
          Filter.vegan: false,
        });

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }

  void setFilters(Map<Filter, bool> chosenfilters) {
    state = chosenfilters;
  }
}

final Filterprovider =
    StateNotifierProvider<FiltersNotifier, Map<Filter, bool>>((ref) {
  return FiltersNotifier();
});

final filtermealsprovider = Provider((ref) {
  final meals = ref.watch(MealsProvider);
  final selectedfilters = ref.watch(Filterprovider);
  return meals.where(
    (meal) {
      if (selectedfilters[Filter.glutenFree]! && !(meal.isGlutenFree)) {
        return false;
      }
      if (selectedfilters[Filter.lactoseFree]! && !(meal.isLactoseFree)) {
        return false;
      }
      if (selectedfilters[Filter.vegan]! && !(meal.isVegan)) {
        return false;
      }
      if (selectedfilters[Filter.vegetarian]! && !(meal.isVegetarian)) {
        return false;
      }
      return true;
    },
  ).toList();
});
