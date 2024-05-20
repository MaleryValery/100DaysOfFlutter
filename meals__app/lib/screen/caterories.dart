import 'package:flutter/material.dart';
import 'package:meals__app/model/category.dart';
import 'package:meals__app/model/meal.dart';
import 'package:meals__app/screen/meals.dart';
import 'package:meals__app/widgets/category_grid_item.dart';

class CateroriesScreen extends StatefulWidget {
  const CateroriesScreen({
    super.key,
    required this.categories,
    required this.availableMeals,
  });

  final List<Category> categories;
  final List<Meal> availableMeals;

  @override
  State<CateroriesScreen> createState() => _CateroriesScreenState();
}

class _CateroriesScreenState extends State<CateroriesScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      lowerBound: 0,
      upperBound: 1,
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = widget.availableMeals
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
      body: AnimatedBuilder(
          animation: _animationController,
          child: GridView.builder(
            itemCount: widget.categories.length,
            itemBuilder: (context, index) {
              final item = widget.categories[index];
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
          builder: (context, child) {
            return SlideTransition(
                position: Tween(
                  begin: const Offset(0, 0.3),
                  end: const Offset(0, 0),
                ).animate(CurvedAnimation(
                    parent: _animationController, curve: Curves.easeInOut)),
                child: child);
          }),
    );
  }
}
