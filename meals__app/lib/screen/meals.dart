import 'package:flutter/material.dart';
import 'package:meals__app/model/meal.dart';
import 'package:meals__app/screen/selected_meal.dart';
import 'package:meals__app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final List<Meal> meals;
  final String title;

  void _selectedMealRoute(BuildContext context, Meal selectedMeal) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SelectedMealScreen(selectedMeal: selectedMeal);
    }));
  }

  @override
  Widget build(context) {
    Widget content = ListView.builder(
        // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final currentMeal = meals[index];
          return MealItem(
            meal: currentMeal,
            onSelectMeal: (currentMeal) =>
                _selectedMealRoute(context, currentMeal),
          );
        });

    if (meals.isEmpty) {
      content = Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh oh.. nothing is here =(',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Try selecting different catedory',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Theme.of(context).colorScheme.onBackground),
          ),
        ],
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: content,
    );
  }
}
