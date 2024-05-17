import 'package:flutter/material.dart';
import 'package:meals__app/model/category.dart';
import 'package:meals__app/model/meal.dart';
import 'package:meals__app/screen/meals.dart';
import 'package:meals__app/widgets/category_grid_item.dart';

class CateroriesScreen extends StatelessWidget {
  const CateroriesScreen({
    super.key,
    required this.categories,
    required this.availableMeals,
  });

  final List<Category> categories;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MealsScreen(
        title: category.title,
        meals: filteredMeals,
      );
    }));
  }

  @override
  Widget build(context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return CategoryGridItem(
              category: item,
              onSelectCategory: () {
                _selectCategory(context, item);
              });
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          childAspectRatio: 3 / 2,
        ),
      ),
    );
  }
}
