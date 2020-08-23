import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/dummy_data.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryMeals = DUMMY_MEALS
        .where((meal) => meal.categories.contains(categoryId))
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) => Text(categoryMeals[index].title)),
      ),
    );
  }
}
