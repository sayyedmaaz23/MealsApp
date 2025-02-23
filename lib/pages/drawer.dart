import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.onSelectScreen});
  final Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context)
                      .colorScheme
                      .primary
                      .withAlpha((0.8 * 255).toInt()),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 50,
                ),
                const SizedBox(width: 10),
                Text(
                  "Cooking Up!!",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('meal');
            },
            leading: Icon(Icons.restaurant),
            title: Text(
              'Meals',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          ListTile(
            onTap: () {
              onSelectScreen('filters');
            },
            leading: Icon(Icons.settings),
            title: Text(
              'Filter',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
