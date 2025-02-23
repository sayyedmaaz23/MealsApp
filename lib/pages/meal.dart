import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/model/meal.dart';
import 'package:meals/provider/favmeals_provider.dart';

class Mealpage extends ConsumerWidget {
  const Mealpage({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritemeals = ref.watch(favMealprovider);
    final isfav = favoritemeals.contains(meal);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              final togglelistener =
                  ref.read(favMealprovider.notifier).togglefav(meal);
              ScaffoldMessenger.of(context).clearSnackBars();
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: togglelistener
                      ? Text('Added Successfully!')
                      : Text('Removed from Favorites')));
            },
            icon: Icon(isfav ? Icons.favorite : Icons.favorite_border_outlined),
            color: const Color.fromARGB(255, 230, 35, 21),
          )
        ],
        title: Text(meal.title.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Hero(
            tag: meal.id,
            child: Image(
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 12,
          ),
          Text('Ingredients',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 18,
          ),
          for (final ingredient in meal.ingredients)
            Text(
              ingredient.toString(),
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
          SizedBox(
            height: 20,
          ),
          Text('Steps',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                  )),
          for (final step in meal.steps)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              child: Text(step,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      )),
            ),
        ]),
      ),
    );
  }
}
