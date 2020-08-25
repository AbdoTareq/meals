import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/category_meal_screen.dart';
import 'package:meals/screens/filter_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Meal> _availableMeals;

  Filters _filters = Filters();

  _setFilters(Filters filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((element) {
        if (_filters.isGlutenFree && !element.isGlutenFree) {
          return false;
        }
        if (_filters.isLactoseFree && !element.isLactoseFree) {
          return false;
        }
        if (_filters.isVegan && !element.isVegan) {
          return false;
        }
        if (_filters.isVegetarian && !element.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 51, 1)),
              bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 51, 1)),
              headline6: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed'),
            ),
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => TabsScreen(),
        CategoryMealScreen.routeName: (context) => CategoryMealScreen(
              filteredMeals: _availableMeals,
            ),
        MealDetailScreen.routeName: (context) => MealDetailScreen(),
        FilterScreen.routeName: (context) => FilterScreen(
              selectedFilters: _filters,
              setFilters: _setFilters,
            ),
      },
    );
  }
}
