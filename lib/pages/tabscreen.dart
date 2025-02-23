import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/favmeals_provider.dart';
import 'package:meals/provider/filters_provider.dart';
import 'package:meals/pages/categoriescreen.dart';
import 'package:meals/pages/filters.dart';
import 'package:meals/pages/mealsub.dart';
import 'package:meals/pages/drawer.dart';

final initialfilters = ({
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false
});

class TabScreen extends ConsumerStatefulWidget {
  const TabScreen({super.key});

  @override
  ConsumerState createState() => _TabScreenState();
}

class _TabScreenState extends ConsumerState {
  int _selectedIndex = 0;
  late List<Widget> _screens = [];
  var selectedFilters = initialfilters;

  void onSelectScreen(String identifier) async {
    if (identifier == 'filters') {
      Navigator.pop(context);
      Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => FiltersScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final availableMeals = ref.watch(filtermealsprovider);

    _screens = [
      CategorieScreen(
        availableMeals: availableMeals,
      ),
      MealScreen(title: ' ', meals: ref.watch(favMealprovider))
    ];

    return Scaffold(
      appBar: AppBar(
        title:
            _selectedIndex == 0 ? Text('Pick a Category') : Text('Favorites'),
      ),
      drawer: DrawerScreen(
        onSelectScreen: onSelectScreen,
      ),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          )
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
