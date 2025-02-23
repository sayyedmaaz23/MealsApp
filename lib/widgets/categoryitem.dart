import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem(
      {super.key, required this.category, required this.contents});
  final Category category;
  final void Function() contents;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: contents,
      borderRadius: BorderRadius.circular(18),
      focusColor: Theme.of(context).primaryColor,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.55),
              category.color.withOpacity(0.9)
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            category.title,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Theme.of(context).colorScheme.surface),
          ),
        ),
      ),
    );
  }
}
