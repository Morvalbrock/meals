import 'package:flutter/material.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';

import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite});
  final void Function(Meal meal) onToggleFavorite;
  void _selectCategory(BuildContext context, Category category) {
    final filterMeals = dummyMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meal: filterMeals,
          onToggleFavorite: onToggleFavorite,
        ),
      ),
    ); // another way  Navigator.push(context,route)
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        //anotherway
        //availableCetegories.map((category)=> CategoryGridItem(category: category),),
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCatagory: () {
              _selectCategory(context, category);
            },
          ),
      ],
    );
  }
}
