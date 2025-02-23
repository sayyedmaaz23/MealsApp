import 'package:meals/model/meal.dart';
import 'package:riverpod/riverpod.dart';

class FavMealsNotifier extends StateNotifier<List<Meal>> {
// This class should include the element which is needed to update along with its updating method

  FavMealsNotifier() : super([]);

  bool togglefav(Meal meal) {
    final ismealfav = state.contains(meal);
    if (ismealfav) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favMealprovider =
    StateNotifierProvider<FavMealsNotifier, List<Meal>>((ref) {
  return FavMealsNotifier();
});
