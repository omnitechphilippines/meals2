import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';
import 'meal_details_page.dart';

class MealsPage extends StatelessWidget {
  final String? title;
  final List<Meal> meals;

  const MealsPage({super.key, this.title, required this.meals});

  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.push(context, MaterialPageRoute<dynamic>(builder: (BuildContext ctx) => MealDetailsPage(meal: meal)));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = ListView.builder(itemCount: meals.length, itemBuilder: (BuildContext ctx, int idx) => MealItem(meal: meals[idx], onSelectMeal: _selectMeal));
    if (meals.isEmpty) {
      content = Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Uh oh... nothing here!', style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(height: 16),
            Text('Try selecting a different category!', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).colorScheme.onSurface)),
          ],
        ),
      );
    }
    if (title == null) {
      return content;
    } else {
      return Scaffold(appBar: AppBar(title: Text(title!)), body: content);
    }
  }
}
