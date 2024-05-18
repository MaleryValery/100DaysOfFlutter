import 'package:flutter/material.dart';
import 'package:meals__app/data/dummy_data.dart';
import 'package:meals__app/provider/filters_provider.dart';
import 'package:meals__app/provider/favorites_provider.dart';
import 'package:meals__app/screen/caterories.dart';
import 'package:meals__app/screen/filters.dart';
import 'package:meals__app/screen/meals.dart';
import 'package:meals__app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const kInitialFilters = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegetarian: false,
  Filter.vegan: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedpageIndex = 0;

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();

    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
          MaterialPageRoute(builder: (ctx) => const FiltersScreen()));
    }
  }

  void selectPage(int index) {
    setState(() {
      _selectedpageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final favotiteMeals = ref.watch(favoriteMealProvider);
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget currentScreen = CateroriesScreen(
      categories: availableCategories,
      availableMeals: availableMeals,
    );

    var pageTitle = 'Categories';

    if (_selectedpageIndex == 1) {
      currentScreen = MealsScreen(
        meals: favotiteMeals,
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
