import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';
import '../providers/favorites_provider.dart';

class MealDetailsPage extends ConsumerWidget {
  final Meal meal;

  const MealDetailsPage({super.key, required this.meal});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);
    return Scaffold(
      appBar: AppBar(title: Text(meal.title), actions: <Widget>[
        IconButton(
          onPressed: () {
            final bool wasAdded = ref.watch(favoriteMealsProvider.notifier).toggleMealFavoriteStatus(meal);
            ScaffoldMessenger.of(context).clearSnackBars();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(wasAdded ? 'Meal added as a favorite.' : 'Meal removed from favorites.')));
          },
          icon: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Icon(favoriteMeals.contains(meal) ? Icons.star : Icons.star_outline, key: ValueKey<bool>(favoriteMeals.contains(meal))),
            transitionBuilder: (Widget child, Animation<double> animation) => RotationTransition(turns: Tween<double>(begin: 0.8, end: 1.0).animate(animation), child: child),
          ),
        )
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(tag: meal.id, child: Image.network(meal.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover)),
            const SizedBox(height: 14),
            Text('Ingredients', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            for (final String ingredient in meal.ingredients) Text(ingredient, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface)),
            const SizedBox(height: 24),
            Text('Steps', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
            const SizedBox(height: 14),
            for (final String step in meal.steps)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(step, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).colorScheme.onSurface)),
              ),
          ],
        ),
      ),
    );
  }
}
