import 'package:flutter/material.dart';
// import 'package:meals/data/dummy_data.dart';
import 'package:meals/screens/categories.dart';
import 'package:meals/screens/filters.dart';
import 'package:meals/screens/meals.dart';
// import 'package:meals/models/meal.dart';
import 'package:meals/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/provider/meals_provider.dart';
import 'package:meals/provider/favourite_provider.dart';
import 'package:meals/provider/filters_provider.dart';

const kInitialFilters = {
  Filters.glutenFree: false,
  Filters.lactoseFree: false,
  Filters.vegan: false,
  Filters.vegetarian: false
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int selectedScreenIndex = 0;

  void selectedScreen(int index) {
    setState(() {
      selectedScreenIndex = index;
    });
  }

  // final List<Meal> _favouriteMeals = [];

  // void _showMessage(String message) {
    
  // }

  // void _toggleFavouriteMealStatus(Meal meal) {
  //   final selectedMeal = _favouriteMeals.contains(meal);
  //   if (selectedMeal) {
  //     setState(() {
  //       _favouriteMeals.remove(meal);
  //     });
  //     _showMessage("Meal removed from favourites");
  //   } else {
  //     setState(() {
  //       _favouriteMeals.add(meal);
  //     });
  //     _showMessage("Meal added to favourites");
  //   }
  // }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filters, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(context) {
    final filteredMeals = ref.watch(filteredMealsProvider);
    String activeScreenName = 'Categories';
    Widget activeScreen = CategoriesScreen(
      availableMeals: filteredMeals,
    );
    if (selectedScreenIndex == 1) {
      final favouriteMeals = ref.watch(favouriteMealsProvider);
      activeScreenName = 'Your Favourites';
      activeScreen = MealsScreen(
        meals:favouriteMeals,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activeScreenName),
      ),
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedScreenIndex,
        onTap: selectedScreen,
        selectedItemColor: Colors.lime,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourites'),
        ],
      ),
    );
  }
}
