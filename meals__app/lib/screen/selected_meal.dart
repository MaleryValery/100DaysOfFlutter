import 'package:flutter/material.dart';
import 'package:meals__app/model/meal.dart';

class SelectedMealScreen extends StatelessWidget {
  const SelectedMealScreen({super.key, required this.selectedMeal});

  final Meal selectedMeal;

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: ListView(
        children: [
          Image.network(
            selectedMeal.imageUrl,
            width: double.infinity,
            height: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Ingredients',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          for (final item in selectedMeal.ingredients)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
              child: Text(
                item,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2),
            child: Text(
              'Steps',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          for (var item = 0; item < selectedMeal.steps.length; item += 1)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
              child: RichText(
                text: TextSpan(
                    text: '${item + 1}. ',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground),
                    children: [
                      TextSpan(
                        text: selectedMeal.steps[item],
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground),
                      ),
                    ]),
              ),
            ),
          // Expanded(
          //   child: ListView.builder(
          //       itemCount: selectedMeal.ingredients.length,
          //       itemBuilder: (content, index) {
          //         final current = selectedMeal.ingredients[index];
          //         return Text(
          //           current,
          //           style: Theme.of(context).textTheme.bodyLarge!.copyWith(
          //               color: Theme.of(context).colorScheme.onBackground),
          //         );
          //       }),
          // )
        ],
      ),
    );
  }
}
