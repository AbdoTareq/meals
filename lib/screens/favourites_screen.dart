import 'package:flutter/material.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favouriteMeals;

  FavouritesScreen(this.favouriteMeals);

  @override
  Widget build(BuildContext context) {
    return favouriteMeals.isEmpty
        ? Center(child: Text('Add some favourite!'))
        : ListView.builder(
            itemCount: favouriteMeals.length,
            itemBuilder: (context, index) =>
                MealItem(meal: favouriteMeals[index]),
          );
  }
}
