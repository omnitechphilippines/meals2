import 'package:flutter/material.dart';

import '../data/dummy_data.dart';
import '../models/category.dart';
import '../models/meal.dart';
import '../widgets/category_grid_item.dart';
import 'meals_page.dart';

class CategoriesPage extends StatefulWidget {
  final List<Meal> availableMeals;

  const CategoriesPage({super.key, required this.availableMeals});

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 300), lowerBound: 0, upperBound: 1);
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final List<Meal> filteredMeals = widget.availableMeals.where((Meal meal) => meal.categories.contains(category.id)).toList();
    Navigator.push(context, MaterialPageRoute<dynamic>(builder: (BuildContext context) => MealsPage(title: category.title, meals: filteredMeals)));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      child: LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){
        final double width = constraints.maxWidth;
        final int crossAxisCount = (width / 250).floor().clamp(2, 6);
        return GridView(
          padding: const EdgeInsets.all(16),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: crossAxisCount, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
          children: <Widget>[for (final Category category in availableCategories) CategoryGridItem(category: category, onSelectCategory: () => _selectCategory(context, category))],
        );
      }),
      builder: (BuildContext ctx, Widget? child) => SlideTransition(position: Tween<Offset>(begin: const Offset(0, 0.5), end: const Offset(0, 0)).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)), child: child),
    );
  }
}
