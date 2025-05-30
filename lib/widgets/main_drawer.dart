import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  final void Function(String identifier) onSelectScreen;

  const MainDrawer({super.key, required this.onSelectScreen});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[Theme.of(context).colorScheme.primaryContainer, Theme.of(context).colorScheme.primaryContainer.withValues(alpha: 0.8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(children: <Widget>[
              Icon(Icons.fastfood, size: 48, color: Theme.of(context).colorScheme.primary),
              const SizedBox(width: 18),
              Text('Cooking Up!', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Theme.of(context).colorScheme.primary)),
            ]),
          ),
          ListTile(
            leading: Icon(Icons.restaurant, size: 26, color: Theme.of(context).colorScheme.onSurface),
            title: Text('Meals', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 24)),
            onTap: () => onSelectScreen('meals'),
          ),
          ListTile(
            leading: Icon(Icons.settings, size: 26, color: Theme.of(context).colorScheme.onSurface),
            title: Text('Filters', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Theme.of(context).colorScheme.onSurface, fontSize: 24)),
            onTap: () => onSelectScreen('filters'),
          ),
        ],
      ),
    );
  }
}
