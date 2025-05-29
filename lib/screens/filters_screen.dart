// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/filter_provider.dart';
// import 'package:meal_app/screens/tabs_screen.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  @override
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterProvider);

    return Scaffold(
      appBar: AppBar(title: Text('Filters')),

      body: Column(
        children: [
          filteSwitch(
            context,
            'Free-Gluten Only',
            Icons.no_food,
            'Show Free-Gluten Meals Only',
            filter[Filter.filterSwitchGluten]!,
            (value) {
              ref
                  .read(filterProvider.notifier)
                  .filterSwitch(Filter.filterSwitchGluten, value);
            },
          ),
          filteSwitch(
            context,
            'Vegeterian Only',
            Icons.face_retouching_natural,
            'Show Vegeterian Meals Only',
            filter[Filter.filterSwitchVegeterian]!,
            (value) {
              ref
                  .read(filterProvider.notifier)
                  .filterSwitch(Filter.filterSwitchVegeterian, value);
            },
          ),
          filteSwitch(
            context,
            'Vegan Only',
            Icons.no_food_sharp,
            'Show Vegan Meals Only',
            filter[Filter.filterSwitchVegan]!,
            (value) {
              ref
                  .read(filterProvider.notifier)
                  .filterSwitch(Filter.filterSwitchVegan, value);
            },
          ),
          filteSwitch(
            context,
            'Free-Lactose Only',
            Icons.fastfood_sharp,
            'Show Free-Lactose Meals Only',
            filter[Filter.filterSwitchLactose]!,
            (value) {
              ref
                  .read(filterProvider.notifier)
                  .filterSwitch(Filter.filterSwitchLactose, value);
            },
          ),
        ],
      ),
    );
  }

  SwitchListTile filteSwitch(
    BuildContext context,
    String title,
    IconData icon,
    String subtitle,
    bool valueSwitch,
    Function(bool valuefilter) onChanged,
  ) {
    return SwitchListTile(
      contentPadding: EdgeInsets.only(left: 20, right: 28),
      activeColor: Theme.of(context).colorScheme.onSecondary,
      value: valueSwitch,
      onChanged: onChanged,
      title: Row(
        children: [
          Icon(icon),
          SizedBox(width: 20),
          Text(title, style: Theme.of(context).textTheme.titleLarge!),
        ],
      ),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium),
    );
  }
}
