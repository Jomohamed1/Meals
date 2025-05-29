import 'package:flutter/material.dart';

import 'package:meal_app/models/category.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/meal_screen.dart';

class GridCategoryItem extends StatelessWidget {
  const GridCategoryItem({
    super.key,
    required this.category,

    required this.avaliableMeal,
  });
  final List<Meal> avaliableMeal;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      splashColor: Theme.of(context).colorScheme.onPrimary,

      onTap: () {
        final filter = avaliableMeal.where(
          (ele) => ele.categories.contains(category.id),
        );
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (ctx) =>
                    MealScreen(title: category.title, meal: filter.toList()),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(2),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            colors: [
              category.color,
              category.color.withAlpha(125),
              category.color.withAlpha(65),
            ],
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      ),
    );
  }
}
