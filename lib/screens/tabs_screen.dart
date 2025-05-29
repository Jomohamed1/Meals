import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_app/providers/favourite_providers.dart';
import 'package:meal_app/providers/filter_provider.dart';
import 'package:meal_app/providers/navbar_provider.dart';

import 'package:meal_app/screens/categories_screen.dart';
import 'package:meal_app/screens/filters_screen.dart';
import 'package:meal_app/screens/meal_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends ConsumerWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avaliableMeals = ref.watch(avaliableMealProvider);

    Widget activePage = CategoriesScreen(avaliableMeal: avaliableMeals);
    var activePageTitle = 'Categories';
    int selectedIndex = ref.watch(navbarProvider);
    if (selectedIndex == 1) {
      var favouriteMeal = ref.watch(favouriteMealProvider);
      activePage = MealScreen(meal: favouriteMeal);
      activePageTitle = 'Favorites';
    }

    return Scaffold(
      drawer: MainDrawer(
        onClicked: (String describe) {
          if (describe == 'filters') {
            Navigator.of(context).pop();
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => FiltersScreen()));
          }
        },
      ),
      appBar: AppBar(title: Text(activePageTitle)),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: ref.read(navbarProvider.notifier).changeIndex,
        currentIndex: selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category_rounded),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            label: 'Favourites',
          ),
        ],
      ),
    );
  }
}
