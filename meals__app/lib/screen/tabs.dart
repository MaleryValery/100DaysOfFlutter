import 'package:flutter/material.dart';
import 'package:meals__app/data/dummy_data.dart';
import 'package:meals__app/model/meal.dart';
import 'package:meals__app/screen/caterories.dart';
import 'package:meals__app/screen/filters.dart';
import 'package:meals__app/screen/meals.dart';
import 'package:meals__app/widgets/main_drawer.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedpageIndex = 0;
  final List<Meal> _favoriteMeals = [];
  Map<Filter, bool> selectedFilters = kInitialFilters;

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      final result = await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(
              builder: (ctx) =>
                  FiltersScreen(currentFilters: selectedFilters)));
      print(result);
      setState(() {
        selectedFilters = result ?? kInitialFilters;
      });
    }
  }

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
    final availableMeals = dummyMeals.where((meal) {
      if (selectedFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (selectedFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (selectedFilters[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      if (selectedFilters[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      return true;
    }).toList();

    Widget currentScreen = CateroriesScreen(
      categories: availableCategories,
      onToggleFavorite: _toggleFavoriteMeal,
      availableMeals: availableMeals,
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
      drawer: MainDrawer(
        onSelectScreen: _setScreen,
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
