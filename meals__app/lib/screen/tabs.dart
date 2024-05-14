import 'package:flutter/material.dart';
import 'package:meals__app/data/dummy_data.dart';
import 'package:meals__app/model/meal.dart';
import 'package:meals__app/screen/caterories.dart';
import 'package:meals__app/screen/meals.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedpageIndex = 0;
  final List<Meal> _favoriteMeals = [];

  void selectPage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 1),
    ));
  }

  void _toggleFavoriteMeal(Meal meal) {
    final isExisting = _favoriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favoriteMeals.remove(meal);
      });
      _showSnackBar('Removed from favorites');
    } else {
      setState(() {
        _favoriteMeals.add(meal);
      });
      _showSnackBar('Added to favorites');
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen = CateroriesScreen(
      categories: availableCategories,
      onToggleFavorite: _toggleFavoriteMeal,
    );

    var pageTitle = 'Categories';

    if (_selectedpageIndex == 1) {
      currentScreen = MealsScreen(
        meals: _favoriteMeals,
        onToggleFavorite: _toggleFavoriteMeal,
      );
      pageTitle = 'Favorites';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: currentScreen,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedpageIndex,
        onTap: (indexTab) {
          selectPage(indexTab);
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favoritges'),
        ],
      ),
    );
  }
}
