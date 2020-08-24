import 'package:flutter/material.dart';
import 'package:meals/models/dummy_data.dart';
import 'package:meals/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final mId = ModalRoute.of(context).settings.arguments as String;
    final meal = DUMMY_MEALS.firstWhere((element) => element.id == mId);

    Widget buildTitle(String title) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    Widget buildList(Widget child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(color: Colors.grey)),
            width: double.infinity,
            height: 200,
            child: child),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('${meal.title}'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Image.network(meal.imageUrl),
            buildTitle('Ingredients'),
            buildList(Card(
              elevation: 10,
              // be careful u can't put list view directly inside column as both have infinity height
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Container(
                    color: Theme.of(context).accentColor,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Text(meal.ingredients[index])),
              ),
            )),
            buildTitle('Steps'),
            buildList(Card(
              elevation: 10,
              // be careful u can't put list view directly inside column as both have infinity height
              child: ListView.builder(
                itemCount: meal.ingredients.length,
                itemBuilder: (ctx, index) => Container(
                    child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text(
                          '# ${index + 1}',
                        ),
                      ),
                      title: Text(meal.steps[index]),
                    ),
                    Divider()
                  ],
                )),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
