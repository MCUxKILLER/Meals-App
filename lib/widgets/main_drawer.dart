import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key,required this.onSelectScreen});

  final void Function(String identifier) onSelectScreen;
  @override
  Widget build(context) {
    return Drawer(
      child: Column(children: [
        DrawerHeader(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.background,
                Theme.of(context).colorScheme.background.withOpacity(0.8),
              ],
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.fastfood,
                size: 36,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                'Cooking Up!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.restaurant,size: 26,),
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                ),
          ),
          onTap: (){
            onSelectScreen('meals');
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings,size: 26,),
          title: Text(
            'Filters',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 24,
                ),
          ),
          onTap: (){
            onSelectScreen('filters');
          },
        )
      ]),
    );
  }
}
