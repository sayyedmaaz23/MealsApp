import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/provider/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activefilters = ref.watch(Filterprovider);
    return Scaffold(
        appBar: AppBar(
          title: Text('Filters'),
        ),
        body: Column(
          children: [
            SwitchListTile(
                value: activefilters[Filter.glutenFree]!,
                onChanged: (isChecked) {
                  ref
                      .watch(Filterprovider.notifier)
                      .setFilter(Filter.glutenFree, isChecked);
                },
                title: Text(
                  'Gluten-Free',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include Gluten-Free Meal',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                )),
            SwitchListTile(
                value: activefilters[Filter.lactoseFree]!,
                onChanged: (isChecked) {
                  ref
                      .watch(Filterprovider.notifier)
                      .setFilter(Filter.lactoseFree, isChecked);
                },
                title: Text(
                  'Lactose-Free',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include Lactose-Free Meal',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                )),
            SwitchListTile(
                value: activefilters[Filter.vegetarian]!,
                onChanged: (isChecked) {
                  ref
                      .watch(Filterprovider.notifier)
                      .setFilter(Filter.vegetarian, isChecked);
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include Vegetarian Meal',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                )),
            SwitchListTile(
                value: activefilters[Filter.vegan]!,
                onChanged: (isChecked) {
                  ref
                      .watch(Filterprovider.notifier)
                      .setFilter(Filter.vegan, isChecked);
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  'Only include vegan Meal',
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Theme.of(context).colorScheme.onSurface),
                )),
          ],
        ));
  }
}
