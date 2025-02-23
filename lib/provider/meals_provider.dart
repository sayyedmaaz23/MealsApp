import 'package:meals/data/dummy_data.dart';
import 'package:riverpod/riverpod.dart';

final MealsProvider = Provider(
  (ref) {
    return dummyMeals;
  },
);
