import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal, required this.onSelected});
  final Meal meal;
  final void Function(Meal meal) onSelected;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),

      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () => onSelected(meal),
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                color: Colors.black54,
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.schedule_rounded),
                            SizedBox(width: 4),
                            Text('${meal.duration} min'),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.work_outline_rounded),
                            SizedBox(width: 4),
                            Text(meal.complexity.name),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.attach_money_rounded),
                            SizedBox(width: 4),
                            Text(meal.affordability.name),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
