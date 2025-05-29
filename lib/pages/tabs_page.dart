import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals2/models/meal.dart';

import '../providers/favorites_provider.dart';
import '../providers/filters_provider.dart';
import '../widgets/main_drawer.dart';
import 'categories_page.dart';
import 'filters_page.dart';
import 'meals_page.dart';

class TabsPage extends ConsumerStatefulWidget {
  const TabsPage({super.key});

  @override
  ConsumerState<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends ConsumerState<TabsPage> {
  int _selectedScreenIndex = 0;

  void _selectScreen(int idx) => setState(() => _selectedScreenIndex = idx);

  void _setScreen(String identifier) async {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.push(context, MaterialPageRoute<dynamic>(builder: (BuildContext ctx) => const FiltersPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    Widget activeScreen = CategoriesPage(availableMeals: availableMeals);
    String activeScreenTitle = 'Categories';

    if (_selectedScreenIndex == 1) {
      final List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);
      activeScreen = MealsPage(meals: favoriteMeals);
      activeScreenTitle = 'Your Favorites';
    }
    return Scaffold(
      appBar: AppBar(title: Text(activeScreenTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        currentIndex: _selectedScreenIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
