import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screens/mael_details.dart';
import 'package:meal_app/widgets/meal_item.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key, this.title, required this.meal});

  final String? title;
  final List<Meal> meal;

  @override
  Widget build(BuildContext context) {
    return title == null
        ? content(context)
        : Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(title!),
            titleTextStyle: TextStyle(fontSize: 21),
          ),
          body: content(context),
        );
  }

  ListView content(BuildContext context) {
    return ListView(
      children:
          meal.map((ele) {
            return MealItem(
              meal: ele,
              onSelected: (ele) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => MaelDetails(meal: ele)),
                );
              },
            );
          }).toList(),
    );
  }
}
