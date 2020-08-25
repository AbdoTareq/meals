import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/widgets/meal_item.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> filteredMeals;

  CategoryMealScreen({@required this.filteredMeals});

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  String _categoryTitle;
  List<Meal> _displayedMeals;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    if (!_initialized) {
      super.didChangeDependencies();
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs['id'];
      _categoryTitle = routeArgs['title'];
      _displayedMeals = widget.filteredMeals
          .where((meal) => meal.categories.contains(categoryId))
          .toList();
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
      ),
      body: ListView.builder(
        itemCount: _displayedMeals.length,
        itemBuilder: (context, index) => MealItem(meal: _displayedMeals[index]),
      ),
    );
  }
}
