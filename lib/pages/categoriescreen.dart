import 'package:meals/data/dummy_data.dart';
import 'package:flutter/material.dart';
import 'package:meals/pages/mealsub.dart';
import 'package:meals/widgets/categoryitem.dart';
import 'package:meals/model/meal.dart';

class CategorieScreen extends StatefulWidget {
  const CategorieScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategorieScreen> createState() => _CategorieScreenState();
}

class _CategorieScreenState extends State<CategorieScreen>
    with SingleTickerProviderStateMixin {
  void _selectcat(BuildContext context, category) {
    final filtered_list = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) =>
            MealScreen(title: category.title, meals: filtered_list)));
  }

  late AnimationController _animationcon;

  @override
  void initState() {
    super.initState();
    _animationcon = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: 1,
        duration: Duration(milliseconds: 400));

    _animationcon.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animationcon,
        builder: (context, child) => SlideTransition(
              position: Tween(
                begin: Offset(0, 0.8),
                end: Offset(0, 0),
              ).animate(CurvedAnimation(
                  parent: _animationcon, curve: Curves.easeInOut)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      childAspectRatio: 3 / 2),
                  children: [
                    for (final category in availableCategories)
                      CategoryItem(
                          category: category,
                          contents: () => {_selectcat(context, category)})
                  ],
                ),
              ),
            ));
  }
}
